package il.haifa.ac.dh.tikkounsofrim.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import il.haifa.ac.dh.tikkounsofrim.impl.TaskProviderImpl;
import il.haifa.ac.dh.tikkounsofrim.impl.UserDBaseJDBC;
import il.haifa.ac.dh.tikkounsofrim.model.TaskProvider;
import il.haifa.ac.dh.tikkounsofrim.model.TikunUser;
import il.haifa.ac.dh.tikkounsofrim.model.UserDBase;
import il.haifa.ac.dh.tikkounsofrim.model.UserInfo;
import il.haifa.ac.dh.tikkounsofrim.model.TaskProvider.Task;


@WebServlet(urlPatterns = {"/LoginServlet","/index.html"})
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static TaskProvider taskProvider = new TaskProviderImpl();
    static  UserDBase userValidationService = new UserDBaseJDBC();
	
//private TodoService todoService = new TodoService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//TODO set user name
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		if(page==null) {
			request.getSession().setAttribute("username",request.getParameter("u"));
			String mname = request.getParameter("m");
			if(mname != null && mname != "") {
				if (mname.startsWith("geneva")) {
					request.setAttribute("m1","selected");
				}
				if (mname.startsWith("parma")) {
					request.setAttribute("m2","selected");
				}
				if (mname.startsWith("vatican")) {
					request.setAttribute("m2","selected");
				}
				request.setAttribute("p",request.getParameter("p"));
				request.setAttribute("l",request.getParameter("l"));
			}
			String book = request.getParameter("b");
			if(book != null &&  book != "") {
				request.setAttribute("b",book);
				request.setAttribute("c",request.getParameter("c"));
				
			}
			String direct = request.getParameter("direct");
			if(direct != null && direct != "") {
				page= "views/transcribe.jsp";
			} else {
				page= "views/login.jsp";
			}
		}
		System.out.println("page="+page);
		request.getRequestDispatcher("/WEB-INF/"+page).forward(
				request, response);
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String login = request.getParameter("login");
		System.out.println("login exists "+login);
		if(login != null) {
			handleLogin(request, response);
			return;
		}
		String register = request.getParameter("register");
		if(register != null) {
			handleRegister(request, response);
			return;
		}
		
		String page = request.getParameter("page");
		if(page==null) {
			page= "views/login.jsp";
		}
		System.out.println("page2="+page);
		request.getRequestDispatcher("/WEB-INF/"+page).forward(
				request, response);
	}
	
	
	private int convert(String str) {
		if (str!= null && str != "" && str != " ") {
			try {
				int i =Integer.parseInt(str);
				return i;
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}

	private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("usernamesignup");
		String password = request.getParameter("passwordsignup");
		String email = request.getParameter("emailsignup");
		String age = request.getParameter("age");
		String hebrew = request.getParameter("hebrew");
		String midrashim = request.getParameter("midrashim");
		
		UserInfo uInfo = new UserInfo(convert(age),convert(hebrew), convert(midrashim));
		if(!userValidationService.checkUser(name)) {
			int userRegisterd = userValidationService.registerUser(name, password, email, uInfo);
			if (userRegisterd != 0) {
				request.setAttribute("errorMessageRegister", "Problem registering");
				response.sendRedirect("/TS1218/LoginServlet#toregister");
				return;
			}
			request.getSession().setAttribute("username", name);
			response.sendRedirect("/TS1218/LoginServlet");
		} else {
			request.setAttribute("errorMessageRegister", "Invalid Username exists");
			response.sendRedirect("/TS1218/LoginServlet#toregister");
			
		}

		
		
	}

	

	private void handleLogin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		Task task = null;
		String name = request.getParameter("username");
		String password = request.getParameter("password");

		boolean isUserValid = userValidationService.isUserValid(name, password);

		if (isUserValid) {
			TikunUser user = new TikunUser(name);
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("userDB", userValidationService);
			int b =convert(request.getParameter("b"));
			int c =convert(request.getParameter("c"));
			if( task== null & b > 0 &&  c > 0 ) {
				task =  taskProvider.getTask(user, b,c);
			} 
			String m = request.getParameter("m");
			int p =convert(request.getParameter("p"));
			int l =convert(request.getParameter("l"));
			if( task== null & m!= null && m.length() > 0  && p > 0  && l > 0 ) {
				task =  taskProvider.getTask(user, m,p,l);
			} 
			
			if(task == null) {
				task = taskProvider.getTask(user);

			}
			request.getSession().setAttribute("taskProvider", taskProvider);
			request.getSession().setAttribute("task",task);
			response.sendRedirect("/TS1218/TranscribeServlet");
		} else {
			request.setAttribute("errorMessageLogin", "Invalid Credentials!");
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
					request, response);
			
		}
	}

}