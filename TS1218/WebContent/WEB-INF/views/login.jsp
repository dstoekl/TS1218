<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:directive.page contentType="text/html;charset=UTF-8" />
<%@include file="../common/header.jspf"%>
<body>
	<%@include file="../common/navigation.jspf"%>
	<div class="container mt-2 scrollable login-page show-login">
		
		
			<div class="login-form-wrapper">
				<%@include file="parts/login.jspf"%>
			</div>
			<div class="register-form-wrapper">
				<%@include file="parts/register.jspf"%>\
			</div>
		
	</div>
	<%@ include file="../common/footer.jspf"%>