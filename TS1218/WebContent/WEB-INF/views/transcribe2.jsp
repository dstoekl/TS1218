<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <jsp:directive.page contentType="text/html;charset=UTF-8"/>
<%@include file="../common/header.jspf"  %>
<%@include file="../common/colors.jspf"  %>


	
 
<div   id="transcribe" class="container" style = "margin-left: 10px; margin-right:0px; padding-right:0px;width:60%; float:left; padding-left: 15px;  overflow: auto;  " >

<div>
<label style="font-size:16px; margin-left: 15px; color:<%= txtcolor %>">This is an automatic transcription. Please correct all errors</label>
<br> 
<label style="font-size:14px; margin-left: 15px; color:<%= txtcolor %>">including misread letters, missing letters, unnecessary or missing spaces or misread signs</label>
</div>

     
     <div id="workPage" class="container" style="background-color:<%= frmcolor %>; border:2px solid gray; padding:15px;  width:95%;height:100%; border-radius: 8px;">
     
      <!-- input id="tro" type="text" dir="rtl" readonly value="${transcribedline}" 
      style="padding-right: 10px;padding-left: 10px;float:right; margin-top: 10px;margin-left: 10px;font-weight: bold;width:100%; font-family: Calibri;"
      size ="${transcribedlength}" >
   
     <br-->
     
     <img id="imgline"   alt="Page ${manuscriptPage} of ${manuscriptTotalPages}, line ${manuscriptLine} of ${manuscriptTotalLines}" 
     width="100%"   src="${transcribedlineimgsrc}" data-high-res-src="${transcribedlineimgsrc}" style="float:right;margin-top: 5px;" class="imageline" >
     
     <script type="text/javascript">
    //Example 3
    $(function () {
        $('.imageline').ImageViewer({snapView:false});
    });
</script>
   
     
        
      <br>
      
      
     <input id="trw" type="text"  oninput="trwChanged()" name="transcribed" dir="rtl" value="${transcribedline}"  
     style="padding-right: 10px;padding-left: 10px;color:<%= txtcolor %>; float:right; margin-top: 2px;margin-left: 10px; font-weight: bold;width:100%;font-family: Corsiva" 
     size="${transcribedlength}">
     

    
      
      <div style="float:right;width:100%;margin-top:2px;">
	  <button type="button" onclick="myReset()"  style="float:right;margin: 5px;" title="${transcribedline}">Reset</button>
	<button type="button"  onclick="myResize(1)" style="float:right;margin: 5px;font-size:larger;" title="Increase size of text"><b>א+</b> </button>
	 <button type="button"  onclick="myResize(-1)" style="float:right;margin: 5px;font-size:smaller; ;" title="Reduce size of text"><b>א-</b></button>
        
        <label id="test" style="float:right;margin: 5px;padding:3px; border: 2px">Font size</label>
        <span id="filled" class="btn-lg btn-menu col-xs-6" onclick="myFill()"  style="float:left;margin: 0px;padding:0px;font-size:larger;width:45px">
<!--         <button id="filled" type="button" onclick="myFill()"  style="float:left;margin: 0px;padding:0px;font-size:larger;"> -->
        <select id="filler" style="float:left;margin: 5px;font-size:larger;" title="End of line marks" >
      <option value=""> </option>
  <option value="/">/</option>
   <option value="//">//</option>
  <option value="|">|</option>
  <option value="V">V</option>
  <option value="'">'</option>
</select>
</span>
<!-- </button> -->
         <button type="button" onclick="myInsert('ﭏ')"  style="float:left;margin: 5px;font-size:larger;" title="Aleph Lamed Ligature"><b>ﭏ</b></button>
          <button type="button" onclick="myInsert('˙')"  style="float:left;margin: 5px;font-size:larger;font-weight: bold;" title="High Point"><b>˙</b></button>
<!--           <button type="button" onclick="myInsert('ײ')"  style="float:left;margin: 5px;font-size:larger;" title="Yiddish Double Yud"><b>ײ</b></button> -->
          <button type="button" onclick="myMark(')','(')"  style="float:left;margin: 5px;font-size:larger;" title="Mark Deleted">(<span style="font-size:smaller;">Deleted</span>)</button>
        
          <button type="button" onclick="myMark(']','[')"  style="float:left;margin: 5px;font-size:larger;" title="Mark Inserted">[<span style="font-size:smaller;">Inserted</span>]</button>
          
           
         
        </div>   


</div>
  
<div id="activity" style="margin-top: 3px;clear:both;overflow: auto;color:<%= txtcolor %>">
	<div class="submitme" style="margin-top: 2px;float:left; width:55%;">
	<!-- 
	position:absolute; bottom:65px; left:3px;">
	 -->
	
	<br>
	<form style="padding-left: 15px; background-color:<%= bgcolor %> ;margin-top: 1px;float:left; width:98%" action="${pageContext.request.contextPath}/TranscribeServlet" method="post">
	<fieldset style="margin: 25px; border: 2px solid gray; background-color:<%= frmcolor %>; padding-left: 5px; border-radius: 5px; " >
	<legend style="padding:0px;font-size:16px; margin:5px; background-color:<%= txtcolor %>color:<%= bgcolor %> ; width:90%" >Finished line - What next?</legend>
	
	<div style="float:left;">
	<input type="radio" id="NE" name="status" value="NE" style="float:left;  margin-left:15px;white-space:normal; background-color:#90CAF9"> <label for="NE">No errors</label>
	</div> 
	<div style="float:left;">   
	<input type="radio"  checked="checked" id="Skip" name="status"  value="Skip" style="float:left; margin-left:15px; white-space:normal; background-color:#90CAF9"><label for="Skip">Possibly some errors, Skip</label>
	<br><br>
	</div> 
	
	<div style="float:left;clear:left">
	<input type="radio" id="AC" name="status" disabled value="AC"  style="float:left; margin-left:15px; white-space:normal;background-color:#f0f0f0"><label for="AC">All errors corrected</label>
    </div> 
    <div style="float:left;">
    <input type="radio" id="PC" name="status" disabled value="PC"  style="float:left; margin-left:15px; white-space:normal;background-color:#f0f0f0"><label for="PC">Errors partially corrected</label>
    
    <br>
    </div> 
    
    <div>
    
     <input type="submit" name="Next"  value="Next"  style="margin: 10px;clear:both;float:left">
    
     <input type="submit" name="Done"  value="Finished"  style="margin: 10px;float:right">
  
    </div> 
	
	
    
	</fieldset>
	
  
	</form>
		
<br>

	</div>
	
	<div id="info" class="tab" style="color: <%= txtcolor %>; margin-top: 10px;float:right;  text-align: right;">
	<button style="color:<%= txtcolor %>;background-color: <%= tab1color %>;" class="tablinks active" onclick="openInfo(event, 'imgPage')">Page</button>
	 <button style="color: <%= txtcolor %>; background-color: <%= tab2color %>;" class="tablinks" onclick="openInfo(event, 'SC')">Special Characters</button>
  <button style="color: <%= txtcolor %>; background-color: <%= tab3color %>;font-size=larger;"  class="tablinks" onclick="openInfo(event, 'AB')">אבג</button>
 <button style="color: <%= txtcolor %>; background-color:<%= tab4color %>;" class="tablinks" onclick="openInfo(event, 'ADD')">Insertions &amp; Deletions</button>
 <button style="color: <%= txtcolor %>; background-color:<%= tab5color %>;" class="tablinks" onclick="openInfo(event, 'FAQ')">Tips &amp; Links</button>
  <!--  button  style=" color:#402204;background-color:<%= tab5color %>; height:10px;" class="tablinks" onclick="openInfo(event, 'FAQ')">Hidden</button>
  -->
</div>
	
	
	</div>

	  </div>


 
	
	

	
	


<div id="infoPage"  style="overflow:auto;float:left; width:39%;   vertical-align:middle;margin-left: 0px; padding-left:0px;" >
<!-- Less than 390 layout fails -->
<div id="SC" hidden="hidden" class="tabcontent" style="background-color:<%= tab2color %>;height:100%;overflow:hidden" >
  <h3 style="overflow:auto">Special characters</h3>
  <p>under Construction.</p> 
  <ul>
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
   <li>1 
   <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
   <li>1 
   <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  
  </ul>
</div>
<div id="AB" hidden="hidden" class="tabcontent" style="background-color:<%= tab3color %>;height:100%; padding:15px;" >
  <h3>AB</h3>
  <p>Under construction</p>
 <ul>
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
   <li>1 
   <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
   <li>1 
   <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
 
  </ul>
</div>


<div id="ADD" hidden="hidden" class="tabcontent" style="overflow:auto; background-color: <%= tab4color %>;height:100%;" >
 <%@include file="../views/HEB/ADD/ADD.jspf" %>
</div>
<div id="FAQ" hidden="hidden" class="tabcontent" style="background-color: <%= tab5color %>; height:100%; overflow:scroll;" >
  <h3>Tips &amp; Links</h3>
  
  <p >Under Consruction.</p>
  <ul>
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
   <li>1 
   <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
   <li>1 
   <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  <li>1
  
  </ul>
 
</div>

   <div id="imgPage" class="tabcontent" style="float:right; width:100%;  height:100%; align-items:center; vertical-align:middle;margin-left: 10px; background-color:<%= tab1color %> " > 
<a href="${manuscriptDescLink}" target="_blank">
<label style="clear:both; color:blue; font-size:16px;" title="${manuscriptShortDesc}">${manuscriptName}</label>
</a>
 <label style=" background-color: <%= tab1color %>;font-size:12px;color:<%= txtcolor %>;"> - Page ${manuscriptPage} / ${manuscriptTotalPages}, Line ${manuscriptLine} / ${manuscriptTotalLines} </label>
<!-- <label>${pageimgsrc}</label> -->
 
<br>
<div id="map"    style="float:right; width:95%; height:95%; vertical-align:middle;background-color: <%= frmcolor %>;">
<br>
</div>
    <script>
 setTimeout(function(){
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
 //   [-295,295],
   // [-325,295],
  //  [-325,30],
   // [-295,30]
       ["${ytop}","${xleft}"],
    ["${ytop}","${xright}"],
    ["${ybottom}","${xright}"],
    ["${ybottom}","${xleft}"]
],{
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
<div class="footer1">
<label  style="clear:both;" >logo logo logo logo logo logo</label>
</div>	
<!-- %@ include file="../common/footer.jspf"% -->
