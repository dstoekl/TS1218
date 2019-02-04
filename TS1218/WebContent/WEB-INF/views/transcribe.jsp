<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <jsp:directive.page contentType="text/html;charset=UTF-8"/>
<%@include file="../common/header.jspf"  %>
<body onload="onloadResize();" class="flex-column d-flex justify-content-between">
<%@include file="../common/navigation.jspf"  %>
<div id="transcribe-wrapper" class="align-self-start  w-100 mt-2 p-2 row">
    <div id="info-page" class="container w-33 col-sm col-sm-auto">
      <ul class="nav nav-tabs flex-wrap" role="tablist">
        <li class="nav-item">
          <a class="nav-link active sfont" id="page-tab" data-toggle="tab" role="tab" href="#page" aria-controls="page"
            aria-selected="true">Page</a>
        </li>
        <li class="nav-item">
          <a class="nav-link sfont" id="special-tab" data-toggle="tab" role="tab" href="#special" aria-controls="special">Special
            Characters</a>
        </li>
        <li class="nav-item">
          <a class="nav-link sfont" id="ab-tab" data-toggle="tab" role="tab" href="#AB" aria-controls="AB">אבג</a>
        </li>
        <li class="nav-item sfont">
          <a class="nav-link" id="ADD-tab" data-toggle="tab" role="tab" href="#ADD" aria-controls="ADD">Marked Text</a>
        </li>
        <li class="nav-item">
          <a class="nav-link sfont" id="help-tab" data-toggle="tab" role="tab"href="#FAQ" aria-controls="FAQ">Help</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="page" role="tabpanel" aria-labelledby="page-tab">
          <div id="imgPage">
            <a href="${manuscriptDescLink}" target="_blank">
              <label style="clear:both; color:blue; " title="${manuscriptShortDesc}">${manuscriptName}</label>
            </a>
            <label> - Page ${manuscriptPage} / ${manuscriptTotalPages}, Line ${manuscriptLine} / ${manuscriptTotalLines}  </label>


            <div id="map" class="flex">
<script type="text/javascript">
setTimeout(function () {
	  var map = L.map('map', {
	    center: [0, 0],
	    crs: L.CRS.Simple,
	    attributionControl: false,
	    zoom: 2,
	    zoomDelta: 0.25,
	    zoomSnap: 0


	  });
	  L.tileLayer.iiif("${pageimgsrc}").addTo(map);
	  //511,4684,4155,449
	  //var markerX= 290;
	  //var markerY = -300;
	  // var marker = L.marker([0,0]).addTo(map);
	  //   var marker = L.marker([-300,290]).addTo(map);
	  //var marker = L.marker(["${ytop}","${xleft}"]).addTo(map);
	  var polygon = L.polygon([
// 	    [-295, 295],
// 	    [-325, 295],
// 	    [-325, 30],
// 	    [-295, 30]
	     ["${ytop}","${xleft}"],
	     ["${ytop}","${xright}"],
	     ["${ybottom}","${xright}"],
	     ["${ybottom}","${xleft}"]
	  ], {
	      color: 'blue',
	      fillColor: '#f03',
	      fillOpacity: 0.2

	    }).addTo(map);
	  //map.setZoom(.8);
	  // map.setView([400,400]);
	  /*
	     var circle = L.circle([-300, 200], {
	     color: 'red',
	     fillColor: '#f03',
	     fillOpacity: 0.5,
	     radius: 50
	   }).addTo(map); 
	  */
	}, 1500);
</script>
            </div>
          </div>
        </div>
        <div class="tab-pane fade w-33" id="special" role="tabpanel" aria-labelledby="profile-tab">
          <div id="special1"  class="tabcontent">
            <h3 style="overflow:hidden">Help</h3>
            <p>under Construction.</p>
           <jsp:include page="../views/${lang}/HELP/HELP.jspf" />
          </div>
        </div>
        <div class="tab-pane fade w-33" id="special" role="tabpanel" aria-labelledby="profile-tab">
          <div id="special1"  class="tabcontent">
            <h3 style="overflow:hidden">Special characters</h3>
            <p>under Construction.</p>
           <jsp:include page="../views/${lang}/SC/SC.jspf" />
          </div>
        </div>
        <div class="tab-pane fade" id="AB" role="tabpanel" aria-labelledby="AB-tab">
          <div id="AB"  class="tabcontent">
            <h3>Alphabet</h3>
            <p>Under construction</p>
             <jsp:include page="../views/${lang}/ABC/ABC.jspf" />
          </div>
        </div>
        <div class="tab-pane fade" id="ADD" role="tabpanel" aria-labelledby="ADD-tab">
          <div id="ADD1"  class="tabcontent">
            <h3>Marked Text</h3>
            <jsp:include page="../views/${lang}/ADD/ADD.jspf" />
            
          </div>
        </div>
        <div class="tab-pane fade" id="FAQ" role="tabpanel" aria-labelledby="contact-tab">
          <div id="FAQ1" hidden="hidden" class="tabcontent">
            <h3>Tips &amp; Links</h3>
            <p>Under Consruction.</p>
             <jsp:include page="../views/${lang}/FAQ/FAQ.jspf" />
          </div>
        </div>
      </div>
    </div>





<!-- Column Two work area -->
    <div id="transcribe" class="container col d-flex flex-column justify-content-between w-73">
      <div class="flex-fill d-flex flex-column justify-content-around">
        <div class="w-100 p-3">
          <div id="work-page" class="d-flex flex-column justify-content-between">
            <div class="header mb-4">
              <div>
                This is an automatic transcription.
                Please correct all errors
              </div>

              <div>
                including misread letters, missing letters, unnecessary or missing spaces or misread signs</div>
            </div>
<!--             <div id="img-line" style="background-image:url('http://tikkoun-sofrim.haifa.ac.il/cantaloupe/iiif/2/bge-cl0146_007.jpg/511,4684,4155,449/full/0/default.jpg');"> -->
<img id="imgline"   alt="Page ${manuscriptPage} of ${manuscriptTotalPages}, line ${manuscriptLine} of ${manuscriptTotalLines}" 
     width="100%"   src="${transcribedlineimgsrc}" data-high-res-src="${transcribedlineimgsrc}" style="float:right;margin-top: 5px;" class="imageline" >
     <script type="text/javascript">
    //Example 3
    $(function () {
        $('.imageline').ImageViewer({snapView:false});
    });
</script>
            </div>
            <div>
            <form action="${pageContext.request.contextPath}/TranscribeServlet" method="post" >
            <div class="mt-2">
              <input id="trw" type="text" oninput="trwChanged()" name="transcribed" dir="rtl" value="${transcribedline}"
                style="font-family: Corsiva" class="w-100 p-2">
                <input type="hidden" id="trwOrig"    value="${transcribedline}" />
            </div>
            <!-- Transcribe toolbar -->
            <div class="btn-toolbar justify-content-between d-flex mt-3 p-10" role="toolbar">
              <div class="mr-2" role="group">
                <select id="filler" class="custom-select" title="End of line marks" onchange="myFill()">
                  <option value="">&nbsp;</option>
                  <option value="/">/</option>
                  <option value="//">//</option>
                  <option value="|">|</option>
                  <option value="V">V</option>
                  <option value="'">'</option>
                </select>
              </div>
              <div class="btn-group mr-2" role="group" aria-label="First group">
                <button class="btn btn-secondary" type="button" onclick="myInsert('ﭏ')" title="Aleph Lamed Ligature"><b>ﭏ</b></button>
                <button class="btn btn-secondary" type="button" onclick="myInsert('˙')" title="High Point"><b>˙</b></button>
                
                <button class="btn btn-secondary" type="button" onclick="myMark('}','{')" title="Mark Damaged">{<span
                    style="font-size:smaller;">Uncertain</span>}</button>
                <button class="btn btn-secondary" type="button" onclick="myMark('>','<')" title="Mark Uncertain">
                  &lt;<span style="font-size:smaller;">Damaged</span>&gt;
                </button>
                <button class="btn btn-secondary" type="button" onclick="myMark(')','(')" title="Mark Deleted">(<span
                    style="font-size:smaller;">Deleted</span>)</button>
                <button class="btn btn-secondary" type="button" onclick="myMark(']','[')" title="Mark Addition">[<span
                    style="font-size:smaller;">Addition</span>]</button>
              </div>

              <!-- right part -->
              <div class="btn-group mr-2" role="group" aria-label="Second group">
                <button class="btn btn-secondary" type="button" onclick="myReset()" title="Reset to original transcribedline">Reset</button>
                <button class="btn btn-secondary" type="button" onclick="myResize(1)" title="Increase size of text">
                <span style="font-size:larger;"><b>א+</b></span>
                </button>
                <button class="btn btn-secondary" type="button" onclick="myResize(-1)" title="Reduce size of text">
                <span style="font-size:smaller;"><b>א-</b></span></button>
                <label id="test">Font size</label>
              </div>
            </div>

            <div id="activity" class="mt-2 align-self-center w-60">
              
                <label>Having corrected all errors, or if no errors found, press ‘Done’. </label>
                <label>If you wish to skip this line without correcting, press ‘Skip’.</label>

                <div id="activity-buttons" class="mt-2 d-flex justify-content-between">
                  <button type="submit" class="btn btn-primary" name="status" value="Done">Done</button>
                  <button type="submit" class="btn btn-primary" name="status" value="Skip">Skip</button>
                </div>
                 </div>
</form>
              
             
              
            </div>
          </div>
        </div>
      </div>
     
    </div>
  
  
  <%@ include file="../common/footer2.jspf"%>


  
	
 
