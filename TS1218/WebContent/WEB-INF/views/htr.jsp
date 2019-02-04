<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/header.jspf"%>
<body>
	<%@include file="../common/navigation.jspf"%>

	<script type="text/javascript">
		window.page_name = 'htr';
		$("[data-link='htr']").addClass('active');
	</script>

	  <jsp:include page="../views/${lang}/HTR/htr.jspf" />

	<%@ include file="../common/footer.jspf"%>



</body>

</html>