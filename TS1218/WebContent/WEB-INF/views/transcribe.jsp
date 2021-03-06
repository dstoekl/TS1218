'<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:directive.page contentType="text/html;charset=UTF-8" />
<%@include file="../common/header.jspf"%>

<body onload="onloadResize();" dir="${dir}">
	<%@include file="../common/navigation.jspf"%>
	<div dir="ltr"     class="transcribe-page scrollable mt-2 p-2 row">
		<div id="info-page" class="container col-4 flex-column d-flex">
			<div dir="${dir}">
				<ul class="nav nav-tabs flex-nowrap" role="tablist">
					<li class="nav-item"><a class="nav-link active sfont"
						id="page-tab" data-toggle="tab" role="tab" href="#page"
						aria-controls="page" aria-selected="true">Page</a></li>

					<li class="nav-item"><a class="nav-link sfont"
						id="special-tab" data-toggle="tab" role="tab" href="#special"
						aria-controls="special">Special Characters</a></li>

					<li class="nav-item"><a class="nav-link sfont" id="ab-tab"
						data-toggle="tab" role="tab" href="#ab" aria-controls="ab">אבג</a>
					</li>

					<li class="nav-item sfont"><a class="nav-link" id="marked-tab"
						data-toggle="tab" role="tab" href="#marked" aria-controls="marked">Marked
							Text</a></li>

					<li class="nav-item"><a class="nav-link sfont" id="help-tab"
						data-toggle="tab" role="tab" href="#help" aria-controls="help">Help</a>
					</li>
				</ul>
			</div>
			<div dir="${dir}" class="tab-content">
				<div class="tab-pane fade show active" id="page" role="tabpanel"
					aria-labelledby="page-tab">
					<div id="imgPage">
						<a href="${manuscriptDescLink}" target="_blank"> <label
							style="clear: both; color: blue;" title="${manuscriptShortDesc}">${manuscriptName}</label>
						</a> <label> - Page ${manuscriptPage} /
							${manuscriptTotalPages}, Line ${manuscriptLine} /
							${manuscriptTotalLines} </label>


						<div id="map" class="flex">
							<script type="text/javascript">
								setTimeout(
										function() {
											var map = L.map('map', {
												center : [ 0, 0 ],
												crs : L.CRS.Simple,
												attributionControl : false,
												zoom : 2,
												zoomDelta : 0.25,
												zoomSnap : 0
											});
											L.tileLayer.iiif("${pageimgsrc}")
													.addTo(map);
											var polygon = L
													.polygon(
															[
																	[
																			"${ytop}",
																			"${xleft}" ],
																	[
																			"${ytop}",
																			"${xright}" ],
																	[
																			"${ybottom}",
																			"${xright}" ],
																	[
																			"${ybottom}",
																			"${xleft}" ] ],
															{
																color : 'blue',
																fillColor : '#f03',
																fillOpacity : 0.2
															}).addTo(map);
										}, 1500);
							</script>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="special" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="tabcontent">
						<jsp:include page="../views/parts/${lang}/transcribe/special.jspf" />
					</div>
				</div>
				<div class="tab-pane fade" id="ab" role="tabpanel"
					aria-labelledby="ab-tab">
					<div class="tabcontent">
						<jsp:include page="../views/parts/${lang}/transcribe/abc.jspf" />
					</div>
				</div>
				<div class="tab-pane fade" id="marked" role="tabpanel"
					aria-labelledby="marked-tab">
					<div class="tabcontent">
						<jsp:include page="../views/parts/${lang}/transcribe/marked.jspf" />
					</div>
				</div>
				<div class="tab-pane fade" id="help" role="tabpanel"
					aria-labelledby="help-tab">
					<div class="tabcontent">
						<jsp:include page="../views/parts/${lang}/transcribe/help.jspf" />
					</div>
				</div>
			</div>
		</div>

		<!-- Column Two work area -->
		<div  dir="rtl" id="transcribe" class="container col-8">
			<div class="flex-fill d-flex flex-column justify-content-around">
				<div class="w-100 p-3">
					<div id="work-page"
						class="d-flex flex-column justify-content-between">
						<div dir="${dir}"  class="header mb-4">
							<div><fmt:message key="main.work_area.intro_line_1"/></div>

							<div><fmt:message key="main.work_area.intro_line_2"/></div>
						</div>
						<!--             <div id="img-line" style="background-image:url('http://tikkoun-sofrim.haifa.ac.il/cantaloupe/iiif/2/bge-cl0146_007.jpg/511,4684,4155,449/full/0/default.jpg');"> -->
						<img id="imgline"
							alt="Page ${manuscriptPage} of ${manuscriptTotalPages}, line ${manuscriptLine} of ${manuscriptTotalLines}"
							width="100%" src="${transcribedlineimgsrc}"
							data-high-res-src="${transcribedlineimgsrc}"
							style="float: right; margin-top: 5px;" class="imageline">
						<script type="text/javascript">
							//Example 3
							$(function() {
								$('.imageline').ImageViewer({
									snapView : false
								});
							});
						</script>
					</div>
					<div>
						<form
							action="${pageContext.request.contextPath}/TranscribeServlet"
							method="post">
							<div class="mt-2">
								<input id="trw" type="text" oninput="trwChanged()"
									name="transcribed" dir="rtl" value="${transcribedline}"
									style="font-family: Corsiva" class="w-100 p-2"> <input
									type="hidden" id="trwOrig" value="${transcribedline}" />
							</div>
							<!-- Transcribe toolbar -->
							<div  class="btn-toolbar justify-content-between d-flex mt-3 p-10"
								role="toolbar">
								<div class="mr-2" role="group">
									<select id="filler" class="custom-select"
										title="End of line marks" onchange="myFill()">
										<option value="">&nbsp;</option>
										<option value="/">/</option>
										<option value="//">//</option>
										<option value="|">|</option>
										<option value="V">V</option>
										<option value="'">'</option>
									</select>
								</div>
								<div class="btn-group mr-2" role="group"
									aria-label="First group">
									<button class="btn btn-secondary" type="button"
										onclick="myInsert('ﭏ')" title="Aleph Lamed Ligature">
										<b>ﭏ</b>
									</button>
									<button class="btn btn-secondary" type="button"
										onclick="myInsert('˙')" title="High Point">
										<b>˙</b>
									</button>

									<button class="btn btn-secondary" type="button"
										onclick="myMark('}','{')" title="Mark Damaged">
										<span style="font-size: smaller;"><fmt:message key="main.work_area.button_4"/></span>
									</button>
									<button class="btn btn-secondary" type="button"
										onclick="myMark('>','<')" title="Mark Uncertain">
										<span style="font-size: smaller;"><fmt:message key="main.work_area.button_3"/></span>
									</button>
									<button class="btn btn-secondary" type="button"
										onclick="myMark(')','(')" title="Mark Deleted">
										<span style="font-size: smaller;"><fmt:message key="main.work_area.button_1"/></span>
									</button>
									<button class="btn btn-secondary" type="button"
										onclick="myMark(']','[')" title="Mark Addition">
										<span style="font-size: smaller;"><fmt:message key="main.work_area.button_2"/></span>
									</button>
								</div>

								<!-- right part -->
								<div class="btn-group mr-2" role="group"
									aria-label="Second group">
									<button class="btn btn-secondary" type="button"
										onclick="myReset()" title="Reset to original transcribedline"><fmt:message key="main.work_area.button_5"/></button>
									<button class="btn btn-secondary" type="button"
										onclick="myResize(1)" title="Increase size of text">
										<span style="font-size: larger;"><b>א+</b></span>
									</button>
									<button class="btn btn-secondary" type="button"
										onclick="myResize(-1)" title="Reduce size of text">
										<span style="font-size: smaller;"><b>א-</b></span>
									</button>
									<label id="test">Font size</label>
								</div>
							</div>

							<div dir="${dir}" id="activity" class="mt-2 align-self-center w-60">

								<div><fmt:message key="main.work_area.finish_line_1"/></div>
								<div><fmt:message key="main.work_area.finish_line_2"/></div>

								<div id="activity-buttons"
									class="mt-2 d-flex justify-content-between">
									<button type="submit" class="btn btn-primary" name="status"
										value="Done"><fmt:message key="main.work_area.finish_button_1"/></button>
									<button type="submit" class="btn btn-primary" name="status"
										value="Skip"><fmt:message key="main.work_area.finish_button_2"/></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>


	<%@ include file="../common/footer2.jspf"%>