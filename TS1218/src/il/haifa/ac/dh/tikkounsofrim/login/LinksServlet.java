package il.haifa.ac.dh.tikkounsofrim.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



//import com.in28minutes.todo.TodoService;


/*

 // Method descriptor #15 ()V
 public void init() throws javax.servlet.ServletException;

 // Method descriptor #37 (Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;)V
 public void service(javax.servlet.ServletRequest arg0, javax.servlet.ServletResponse arg1) throws javax.servlet.ServletException, java.io.IOException;

 // Method descriptor #15 ()V
 public void destroy();

 */
@WebServlet(urlPatterns = {"/LinksServlet"})
public class LinksServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
//private TodoService todoService = new TodoService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/links.jsp").forward(
				request, response);
	}

	

}