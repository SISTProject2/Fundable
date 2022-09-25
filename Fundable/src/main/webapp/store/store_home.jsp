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
<link rel="stylesheet" href="css/home.css" type="text/css">
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

<section class="py-5">
	<h3 class="fw-bolder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	문구류</h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Load more</a></div>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5" style="display: none">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              
            </div>
        </div>
        
    
    <div style="height: 150px"></div>    
	<h3 class="fw-bolder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	음식류</h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list2 }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Load more</a></div>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list2 }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5" style="display: none">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              
            </div>
        </div>
        
        
    <div style="height: 150px"></div>    
	<h3 class="fw-bolder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	출판류</h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list3 }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Load more</a></div>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list3 }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5" style="display: none">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              
            </div>
        </div>
        
        
    <div style="height: 150px"></div>    
	<h3 class="fw-bolder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	반려동물</h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list4 }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Load more</a></div>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list4 }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5" style="display: none">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              
            </div>
        </div>
</section>
    





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