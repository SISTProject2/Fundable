<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/layout2.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<style type="text/css">
.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:16px;padding:0}
#staioneryCard {
	margin:20px 50px 50px 150px;
	justify-content: center;
}
#staioneryCard2 {
	margin:20px 50px 50px 150px;
	justify-content: center;
}
.condition{
	font-size: 15pt;
	font-weight: bold;
}
.w3-round-large {
	margin:20px 50px 50px 700px;
}
.buttons {
	margin:20px 50px 50px 120px;
	border-radius: 25px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('#foodMore').click(function(){
		if(i==0){
			$('#food2').show("slow");
			$('#foodMore').hide()
		}
	})
	$('#stationeryMore').click(function(){
		if(i==0){
			$('#stationery2').show("slow");
			$('#stationeryMore').hide()
		}
	})
	$('#bookMore').click(function(){
		if(i==0){
			$('#book2').show("slow");
			$('#bookMore').hide()
		}
	})
})

</script>
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
	          <figure style="padding: 10px">
	          	<c:forEach var="vo" items="${list }" varStatus="s">
	          		<c:if test="${s.index>=0 && s.index<10 }">
			            <ul>
			              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
				              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" /></span>명 참여 중<br>
				              <span class= "condition"><fmt:formatNumber pattern="#,###" value="${vo.success }" /></span>원 달성<p><p>
			              </li>
			            </ul>
		            </c:if>
	            </c:forEach>
	          </figure>
	        </article>
	        <button class="w3-btn w3-white w3-border w3-border-red w3-round-large" id="stationeryMore">더 보기</button>
	        <article style="display: none" id="staionery2">
	          <figure>
	          	<c:forEach var="vo" items="${list }" varStatus="s">
	          		<c:if test="${s.index>=10 && s.index<20 }">
			            <ul>
			              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
				              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" /></span>명 참여 중<br>
				              <span class= "condition"><fmt:formatNumber pattern="#,###" value="${vo.success }" /></span>원 달성<p><p>
			              </li>
			            </ul>
		            </c:if>
	            </c:forEach>
	          </figure>
	        </article>
	        <p>
	      </section> 
      </div>
      <div style="height: 20px"></div>
      
      
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	음식류</h3 style="font-weight: bold">
	  <hr>
	  
	  <div class="homepage">
      <section id="latest">
        <article>
          <figure style="padding: 10px">
          	<c:forEach var="vo" items="${list2 }" varStatus="s">
          		<c:if test="${s.index>=0 && s.index<10 }">
		            <ul>
		              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
			              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" />명</span> 참여 중<br>
			              <span class= "condition"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성<p><p>
		              </li>
		            </ul>
	            </c:if>
            </c:forEach>
          </figure>
        </article>
        <button class="w3-btn w3-white w3-border w3-border-red w3-round-large" id="foodMore">더 보기</button>
        <article id="food2">
          <div style="display: none">
          	<c:forEach var="vo" items="${list2 }" varStatus="s">
          		<c:if test="${s.index>=10 && s.index<20 }">
		            <ul>
		              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
			              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" />명</span> 참여 중<br>
			              <span><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성<p><p>
		              </li>
		            </ul>
	            </c:if>
            </c:forEach>
          </div>
        </article>
        <p>
      </section>    
      </div>
      <div style="height: 20px"></div>
      
      <!-- 중간 버튼 -->
      <span style="display: flex" class="buttons">
	      <img src="../css/img/search.png" width="400px" height="170px" style="border-radius: 20px">
	      <div style="width: 20px"></div>
	      <img src="../css/img/best.png" width="400px" height="170px" style="border-radius: 20px">
	      <div style="width: 20px"></div>
	      <img src="../css/img/allhome.png" width="400px" height="170px" style="border-radius: 20px">
      </span>
      <div style="height: 20px"></div>
      
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     	출판류</h3 style="font-weight: bold">
	  <hr>
      <div class="homepage">
      <section id="latest">
        <article>
          <figure style="padding: 10px">
          	<c:forEach var="vo" items="${list3 }" varStatus="s">
          		<c:if test="${s.index>=0 && s.index<10 }">
		            <ul>
		              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
			              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" />명</span> 참여 중<br>
			              <span class= "condition"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성<p><p>
		              </li>
		            </ul>
	            </c:if>
            </c:forEach>
          </figure>
        </article>
        <button class="w3-btn w3-white w3-border w3-border-red w3-round-large" id="bookMore">더 보기</button>
        <article>
          <div style="display: none" id="book2">
          	<c:forEach var="vo" items="${list3 }" varStatus="s">
          		<c:if test="${s.index>=10 && s.index<20 }">
		            <ul>
		              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
			              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" />명</span> 참여 중<br>
			              <span><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성<p><p>
		              </li>
		            </ul>
	            </c:if>
            </c:forEach>
          </div>
        </article>
        <p>
      </section>    
      </div>
      <div style="height: 20px"></div>
      
      
      
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     	반려동물</h3 style="font-weight: bold">
	  <hr>
      <div class="homepage">
      <section id="latest">
        <article>
          <figure style="padding: 10px">
          	<c:forEach var="vo" items="${list4 }" varStatus="s">
          		<c:if test="${s.index>=0 && s.index<10 }">
		            <ul>
		              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
			              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" />명</span> 참여 중<br>
			              <span class= "condition"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성<p><p>
		              </li>
		            </ul>
	            </c:if>
            </c:forEach>
          </figure>
        </article>
        <button class="w3-btn w3-white w3-border w3-border-red w3-round-large" id="stationeryMore">더 보기</button>
        <article>
          <div style="display: none">
          	<c:forEach var="vo" items="${list4 }" varStatus="s">
          		<c:if test="${s.index>=10 && s.index<20 }">
		            <ul>
		              <li class="one_quarter"><img src="${vo.img }" width="235" height="180" alt=""><p>
			              <span style="font-size: 13pt; font-weight: bold"><fmt:formatNumber pattern="#,###" value="${vo.sponsor }" />명</span> 참여 중<br>
			              <span><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성<p><p>
		              </li>
		            </ul>
	            </c:if>
            </c:forEach>
          </div>
        </article>
        <p>
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