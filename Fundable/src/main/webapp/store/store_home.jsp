<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/layout2.css" type="text/css">

<style>
</style>
  
<style>
.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:16px;padding:0}
</style>
</head>
<body>
    <!-- Slider -->
   <!--  <section id="slider" style="margin-top: 100px;"><a href="#"><img src="images/slider2.png" alt=""></a></section> -->

<div style="height: 100px"></div>
 <div class="w3-content w3-display-container" style="max-width:1400px">
  <img class="mySlides" src="images/002.png" style="width:100%">
  <img class="mySlides" src="images/003.png" style="width:100%">
  <img class="mySlides" src="images/004.png" style="width:100%">
  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
  </div>
</div> 

<div style="height: 140px"></div>

<div id="homepage">
      <!-- One Quarter -->
      
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	문구류</h3 style="font-weight: bold">
	  <hr>
      
      <div class="homepage">
	      <section id="latest">
	        <article>
	          <figure>
	            <ul>
	              <li class="one_quarter"><img src="images/demo/215x150.gif" width="215" height="150" alt="">
	              <p>9,999명 펀딩 성공</p>
	              <p>9,9999999원 펀딩 성공</p>
	              </li>
	              
	            </ul>
	          </figure>
	        </article>
	      </section>
      </div>

    </div>





<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>
		
	
</body>
</html>