<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <jsp:directive.page contentType="text/html;charset=UTF-8"/>
<%@include file="../common/header.jspf"  %>
<body  class="flex-column d-flex justify-content-between">
	<script type="text/javascript">
document.getElementById("project").className += " active";
 </script>
<%@include file="../common/navigation.jspf"  %>


    <div >
    <h1>Thank you for helping us to decipher ancient Hebrew manuscripts</h1>
    Your linecount: ${userlinecount}
    
    <p>Page under Construction
    </div>
    <br>
    <br>
    
	
<br>
<br>
<!-- img src='<c:url value="/images/elijah.png" ></c:url>' /-->
		<%@ include file="../common/footer.jspf"%>

