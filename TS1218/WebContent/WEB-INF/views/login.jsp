<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <jsp:directive.page contentType="text/html;charset=UTF-8"/>
<%@include file="../common/header.jspf"  %>
<body  class="flex-column d-flex justify-content-between">
<%@include file="../common/navigation.jspf"  %>
    <div class="w-30">
    <h2><fmt:message key="login.welcome.header"/></h2>
    
    <p>Help us train a computerized reading of Hebrew manuscripts, by correcting errors in the initial automatic reading
    <p>This Project aims to train the computer to recognize handwritten text of Hebrew manuscripts. We need your help in correcting errors in the initial automatic reading!
     <br>
    <br>
    </p>
    </div>
   <div style="float:right; width:58%"> 				
                <div id="container_demo"  >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                           <form autocomplete="on" style="padding-left: 15px; margin-top: 1px;float:left; width:98%" action="${pageContext.request.contextPath}/LoginServlet" method="post">
                                <h4>Log in</h4> 
                               <p style="font-weight:bold; font-size: large; color:red;">${errorMessageLogin}</p>
                               <p>
                                    <label for="username" class="uname" data-icon="u" >Userid: </label>
                                    <input id="username" name="username" style="margin-right:20px; width:125px;" required="required" type="text" placeholder="myusername or mymail@mail.com" value="${username}" />
                               
                                    <label for="password" class="youpasswd" data-icon="p"> Password: </label>
                                    <input id="password" name="password" style="width:125px;" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                               </p>
<!--                                 <p class="keeplogin">  -->
<!-- 									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" />  -->
<!-- 									<label for="loginkeeping">Keep me logged in</label> -->
<!-- 								</p> -->
 								<p> 
								(Optional)
								<label for="manuscript" > Manuscript </label>
                                
                                 <select name="m" id="manuscript">
                                 <option value=" "> 
                                 <option ${m1} value="Geneva146">Geneva 146
                                  <option ${m2} value="Parma">Parma 111
                                   <option ${m3} value="Vatican"> Vatican 22
                                 
                                 </select>
                                
                                 <label for="p" > Page </label>
                                
                                 <input maxlength="4" id="p" name="p"  style="padding:0px;width:60px;height:25px" type="number" min="1" max="9000"  value="${p}" />
                                  <label for="l" > Line </label>
                                 <input maxlength="3" id="l" name="l" style="padding:0px;width:45px;height:25px;" type="number" min="1" max="150"  value="${l}" />
								</p>
								<p> 
								(Optional)
								
                                
                                 <label  for="ntn" > 929 Chapter </label>
                                
                                 <input maxlength="3" id="ntn" name="ntn"  style="padding:0px;width:30px;height:25px" type="number" min="1" max="99"  value="${ntn}" />
                                 
								</p>
                                <p class="login button"> 
                                    <input  name="login" style="align-self: center;width:150px; margin-left:25px;" type="submit"  value="Start correcting" /> 
								</p>
                                <p class="change_link">
									Not registered yet ?
									<a href="#toregister" class="to_register">Register</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                        <form autocomplete="on" style="padding-left: 15px; margin-top: 1px;float:left; width:98%" action="${pageContext.request.contextPath}/LoginServlet" method="post">
                            
                                <h4> Register</h4>
                              <p style="font-weight:bold; font-size: large; color:red;">${errorMessageRegister}</p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Userid:</label>
                                    <input style="width:145px;" id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
                                
                                    <label for="emailsignup" style="margin-left: 25px" class="youmail" data-icon="e" > E-mail:</label>
                                    <input style="width:145px;" id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Password: </label>
                                    <input style="width:125px;" id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                 
                                    <label for="passwordsignup_confirm" style="margin-left: 25px" class="youpasswd" data-icon="p">Confirm<br> password: </label>
                                    <input style="width:125px;" id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <br>
                                <fieldset>
                                <legend style="font-size:15px; font-weight:bold;">Demographics (Optional)</legend>
                                <label for="age" > Age </label>
                                 <input maxlength="2" id="age" name="age" style="padding:0px;width:45px;height:25px;" type="number" min="1" max="120" placeholder="eg. 75" />
  <br>
                                <label>Knowledge of Hebrew</label>
                              
                                <ul class="likert">
  <li> None </li>
  <li><input type="radio" name="hebrew" value="1" /></li>
  <li><input type="radio" name="hebrew" value="2" /></li>
  <li><input type="radio" name="hebrew" value="3" /></li>
  <li><input type="radio" name="hebrew" value="4" /></li>
  <li><input type="radio" name="hebrew" value="5" /></li>
  <li> Very Knowledgeable </li>
</ul>
     </fieldset>            
       <fieldset>
                                <label>Knowledge of Midrashim</label>
                              
                                <ul class="likert">
  <li> None </li>
  <li><input type="radio" name="midrashim" value="1" /></li>
  <li><input type="radio" name="midrashim" value="2" /></li>
  <li><input type="radio" name="midrashim" value="3" /></li>
  <li><input type="radio" name="midrashim" value="4" /></li>
  <li><input type="radio" name="midrashim" value="5" /></li>
  <li> Very Knowledgeable </li>
</ul>
   </fieldset>                                   
                                <p class="signin button"> 
									<input   name="register" type="submit" style="width:75px; margin-left:25px;" value="Register"/> 
								</p>
                                <p class="change_link">  
									Already registered ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            
    
    
    
    </div>
   
    
	



<!-- img src='<c:url value="/images/elijah.png" ></c:url>' /-->
		<%@ include file="../common/footer.jspf"%>

	

</body>

</html>