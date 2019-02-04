<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/header.jspf"%>
<body>
	<%@include file="../common/navigation.jspf"%>

	<script type="text/javascript">
		document.getElementById("htr").className += " active";
	</script>
	<div class="container">
		<h1>What is HTR?</h1>
		<div>
			<p>HTR - (automatic) Handwritten Text Recognition is a
				subdiscipline of Computer Vision that deals with the automatic
				process of transforming document images to text so it can be
				searched and integrated into websites, books or articles.</p>
			<p>We use a combination of cutting edge deep learning techniques,
				different types of neural networks (biLSTM, CNN) with classical
				methods such a morphological transformations, projections and
				different filters.</p>
			<p>The basic principle is that we show the computer a great
				number of images of manuscript lines and their corresponding text
				transcriptions and the computer learns the principle how to get from
				the image to the text. Eventually, it can do this also for images it
				has never seen.</p>
		</div>
	</div>

	<%@ include file="../common/footer.jspf"%>



</body>

</html>