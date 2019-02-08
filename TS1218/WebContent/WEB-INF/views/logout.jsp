<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <jsp:directive.page contentType="text/html;charset=UTF-8"/>
<%@include file="../common/header.jspf"  %>
<body  class="flex-column d-flex justify-content-between">
	<script type="text/javascript">
document.getElementById("logout").className += " active";
 </script>
<%@include file="../common/navigation.jspf"  %>


    <div >
    <h1><fmt:message key="main.work_area.Good_bye_Message1"/></h1>
    <fmt:message key="main.work_area.Good_bye_Message2"/> ${userlinecount}
    
    <p>Page under Construction
    </div>
    <br>
    <br>
    
	
<br>
<br>
<!-- img src='<c:url value="/images/elijah.png" ></c:url>' /-->
		<%@ include file="../common/footer.jspf"%>

