<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:directive.page contentType="text/html;charset=UTF-8" />
<%@include file="../common/header.jspf"%>
<body>
	<%@include file="../common/navigation.jspf"%>
	<div class="container scrollable login-page">
		<div>
			<h2>Welcome to Tikkoun Sofrim!</h2>

			<p>Help us train a computerized reading of Hebrew manuscripts, by
				correcting errors in the initial automatic reading
			<p>
				This Project aims to train the computer to recognize handwritten
				text of Hebrew manuscripts. We need your help in correcting errors
				in the initial automatic reading! <br> <br>
			</p>
		</div>
		<div>
			<div class="login">
				<%@include file="parts/login.jspf"%>
			</div>
			<div class="register">
				<%@include file="parts/register.jspf"%>\
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jspf"%>