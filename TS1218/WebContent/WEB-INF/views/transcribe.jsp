<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <jsp:directive.page contentType="text/html;charset=UTF-8"/>
<!DOCTYPE html>

	
<html>
<head>
<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />


<title>TikkounSofrim</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet-draw@0.4.10/dist/leaflet.draw.css" />
<link href="views/imageviewer.css"  rel="stylesheet" type="text/css" />


<script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"></script>
<script src="https://unpkg.com/leaflet-draw@0.4.10/dist/leaflet.draw.js"></script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="views/imageviewer.js"></script>

<script src="https://unpkg.com/leaflet-iiif@2.0.1"></script>
<%@ include file="../common/colors.jspf"%>
<script>
// When the user clicks on <div>, open the popup
function myPopup() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}
function myInsert(ligature) {
        elem = document.getElementById('trw')
        var caretPos = elem.selectionStart;
        var myString =elem.value;
        pre = myString.substring(0,caretPos);
        post = myString.substring(caretPos, myString.length);
        elem.value = pre+ ligature + post;
        elem.focus();
         elem.selectionStart= caretPos+1;
        elem.selectionEnd= caretPos+1;
        
    }
function myMark(endligature, startligature) {
        elem = document.getElementById('trw')
        var caretPosStart = elem.selectionStart;
        var caretPosEnd = elem.selectionEnd;
        var myString =elem.value;
        
        pre = myString.substring(0,caretPosStart);
        middle = startligature+ myString.substring(caretPosStart, caretPosEnd)+ endligature;
        post = myString.substring(caretPosEnd, myString.length);
        document.getElementById('trw').value = pre+ middle + post;
        if (caretPosStart !=  caretPosEnd ) {
        caretPosEnd += 2;
        } else {
         caretPosEnd += 1;
        }
        elem.focus();
        elem.selectionStart= caretPosEnd;
        elem.selectionEnd= caretPosEnd;
    }
    function myFill() {
        elem = document.getElementById('trw')
      
        var myString =elem.value;
          elem2 = document.getElementById('filler');
        ligature = elem2.value;
        elem.value = myString+ ligature;
         elem.focus();
          elem.selectionStart= myString.length;
         elem.selectionEnd= myString.length;
        
    }    
function myResizeOrg() {
    
     var elemImg = document.getElementById("imgline");
    
		if(elemImg) {
   			var rect = elemImg.getBoundingClientRect();
   			var fontsize = (Math.trunc(rect.height*0.45)-1)+"px";  
//    		    var elemTRO = document.getElementById("tro");
//    			elemTRO.style.height = fontsize;
//    			elemTRO.style.fontSize = fontsize;
   			var elemTRW = document.getElementById("trw");
   			elemTRW.style.height = fontsize;
   			elemTRW.style.fontSize = fontsize;
   			var elemTest = document.getElementById("test");
   			elemTest.innerHTML=fontsize;
   			console.log("OrgFontsize= "+fontsize);
   			}
   			
}
function myResizeOrg2() {
    
     var elemImg = document.getElementById("map2");
		if(elemImg) {
   			var rect = elemImg.getBoundingClientRect();
   			var fontsize = (Math.trunc(rect.height*0.45)-1)+"px";  
//    			var elemTRO = document.getElementById("tro");
//    			elemTRO.style.height = fontsize;
//    			elemTRO.style.fontSize = fontsize;
   			var elemTRW = document.getElementById("trw");
   			elemTRW.style.height = fontsize;
   			elemTRW.style.fontSize = fontsize;
   			var elemTest = document.getElementById("test");
   			elemTest.innerHTML=fontsize;
   			console.log("OrgFontsize= "+fontsize)
   			}
   			
}
function myResize(myAdd) {
    
     
   			 
//    			var elemTRO = document.getElementById("tro");
//    			var rect = elemTRO.getBoundingClientRect();
//    			var fontsize = (Math.trunc(rect.height)+myAdd)+"px";  
   			
//    			elemTRO.style.height = fontsize;
//    			elemTRO.style.fontSize = fontsize;
   			var elemTRW = document.getElementById("trw");
   			var rect = elemTRW.getBoundingClientRect();
   			var fontsize = (Math.trunc(rect.height)+myAdd)+"px";  
   			elemTRW.style.height = fontsize;
   			elemTRW.style.fontSize = fontsize;
   			var elemTest = document.getElementById("test");
   			elemTest.innerHTML=fontsize;
   			console.log("Fontsize= "+fontsize)
   			
} 
    
function myReset() {
var elemTRW = document.getElementById("trw");
elemTRW.value = "${transcribedline}"
document.getElementById("NE").disabled = false;
document.getElementById("NE").setAttribute("style", "background-color: 90CAF9");

document.getElementById("Skip").disabled = false;
document.getElementById("Skip").setAttribute("style", "background-color: 90CAF9");
document.getElementById("AC").disabled = true;
document.getElementById("AC").setAttribute("style", "background-color: #f0f0f0");
document.getElementById("PC").disabled = true;
document.getElementById("PC").setAttribute("style", "background-color: #f0f0f0");
}   

function trwChanged() {
document.getElementById("NE").disabled = true;
document.getElementById("NE").setAttribute("style", "background-color: #f0f0f0");
document.getElementById("Skip").disabled = true;
document.getElementById("Skip").setAttribute("style", "background-color: #f0f0f0");
document.getElementById("AC").disabled = false;
document.getElementById("AC").setAttribute("style", "background-color: 90CAF9");
document.getElementById("PC").disabled = false;
document.getElementById("AC").setAttribute("style", "background-color: 90CAF9");
}  
function resizeImg() {
	/*
  			console.log("imgPageHeight!");
  			var elemWorkPage = document.getElementById("transcribe");
  			var rect1 = elemWorkPage.getBoundingClientRect();
  			var height1 = Math.trunc(rect1.heigth*0.95);
  			var elemInfoPage= document.getElementById("infoPage");
  			elemInfoPage.style.height= height1+"px";
  			console.log("InfoPageHeight= "+height1)
  		*/	
   			var elemImgPage = document.getElementById("imgPage");
   			var rect = elemImgPage.getBoundingClientRect();
   			var width = Math.trunc(rect.width*0.95); 
   			var height = Math.trunc(width*1.333);
   			
   			
   			elemImgPage.style.height = height+"px";
   			var elemImgMap = document.getElementById("map");
   			elemImgMap.style.height = height+"px";
   			elemImgMap.style.width = width+"px";
   			
   			console.log("imgPageHeight= "+height)
   			
} 
function onloadResize(){
	myResizeOrg();
	resizeImg();
	
}

function openInfo(evt, infoName) {
	  // Declare all variables
	  var i, tabcontent, tablinks;

	  // Get all elements with class="tabcontent" and hide them
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }

	  // Get all elements with class="tablinks" and remove the class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }

	  // Show the current tab, and add an "active" class to the link that opened the tab
	  document.getElementById(infoName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
</script>
<style>

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px;
	background-color: #f5f5f5;
	
}
.footer1 {
/* 	position: absolute; */
	bottom: 0px;
	padding: 15px;
	margin: 15px;
	width: 50%;
	height: 30px;
	
}
.ubmitme {
	position: fixed;
	bottom: 75px;
	width: 60%;
	height: 60px;
	background-color: #f5f5f5;
	}
/* Style the tab */
.tab {
  float: right;
  border: 0px;
  background-color: <%= bgcolor %> ;
  border-radius: 50px 0px 0px 50px;
 /* width: 30%; */
  text-align: center;
  list-style: none;
  margin: 0;
  padding: 0;
  line-height: 24px;
  
 /* push to bottom */
 
   position:absolute;
    bottom:25px;
    right:38%;
  
}

.tab::after {
  position: absolute;
  content: "";
 /* width: 100%; */
  bottom: 0;
  left: 0;
  border-right: 1px solid #AAA;
  z-index: 1;
}
.tab::before {
  z-index: 1;
} 
/* Style the buttons that are used to open the tab content */
.tab button {
  position: relative;
  z-index: 0;
  display: block;
   background-color: <%= bgcolor %>;
   color: <%= txtcolor %> ;
  padding: 4px 4px;
  width: 150px;
  border: 0px solid #AA;
  outline: none;
  text-align: right;
  cursor: pointer;
  border-radius: 50px 0px 0px 50px;
  transition: 0.3s;
  
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
   font-size: larger;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
  font-size: x-large;
   z-index: 2;
  border-right-color: #FFF;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 2px;
  border: 1px solid #ccc;
  width: 100%;
  border-left: none;
  height: inherit;
}
	

/* Popup container */
.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
}

/* The actual popup (appears on top) */
.popup .popuptext {
    visibility: hidden;
    width: 260px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 100;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class when clicking on the popup container (hide and show the popup) */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
} 
</style>
</head>

<body   onload="onloadResize();" onresize="onloadResize();" style="background-color:<%= bgcolor %> ; font-family: Georgia;">

<%@ include file="../common/navigation.jspf"%>
<script type="text/javascript">
document.getElementById("work").className += " active";
 
</script>
 
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


 
	
	

	
	


<div id="infoPage"  style="float:left; width:39%;   vertical-align:middle;margin-left: 0px; padding-left:0px;" >
<!-- Less than 390 layout fails -->
<div id="SC" hidden="hidden" class="tabcontent" style="background-color:<%= tab2color %>;height:100%;overflow:hidden" >
  <h3 style="overflow:hidden">Special characters</h3>
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


<div id="ADD" hidden="hidden" class="tabcontent" style="background-color: <%= tab4color %>;height:100%;" >
  <h3>Additions &amp; Deletions</h3>
  <p>Under Consruction.</p>
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
<div id="FAQ" hidden="hidden" class="tabcontent" style="background-color: <%= tab5color %>; height:100%;" >
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
