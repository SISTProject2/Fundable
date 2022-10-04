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
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,200&family=Nanum+Gothic:wght@700&family=Noto+Sans+Mono&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,200&family=Noto+Sans+KR:wght@700&family=Noto+Sans+Mono&display=swap" rel="stylesheet">

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
a {
	text-decoration-line: none;
}

.cards {
	justify-content: center;
	font-family: 'Noto Sans Mono', monospace;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#smore').click(function() {
			$('#shidden').show("fade");
			$('#smore').hide()
	
	})
	$('#fmore').click(function() {
			$('#fhidden').show("fade");
			$('#fmore').hide()
	
	})
	$('#bmore').click(function() {
			$('#bhidden').show("fade");
			$('#bmore').hide()
	
	})
	$('#pmore').click(function() {
			$('#phidden').show("fade");
			$('#pmore').hide()
	
	})
})

</script>
</head>
<body>
    <!-- Slider -->
   <!--  <section id="slider" style="margin-top: 100px;"><a href="#"><img src="images/slider2.png" alt=""></a></section> -->

<div style="height: 100px"></div>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/002.png"  style="width:100%;">
      </div>

      <div class="item">
        <img src="images/003.png"  style="width:100%;">
      </div>
    
      <div class="item">
        <img src="images/004.png"  style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div> 

<div style="height: 140px"></div>


<span class="cards" style="display: flex;">

<!-- 펀딩 뉴스 -->
<div class="w3-card w3-margin">
	<div style="height: 20px"></div>
    <div class="w3-container w3-padding">
      <h3>
      <span>#펀더블은&nbsp;</span>
      <span>#지금&nbsp;</span>
      <span>#On-Media</span>
      </h3>
      ${now } 기준
    </div>
    <ul class="w3-ul w3-hoverable w3-white">
      <li class="w3-padding-16">
      	<c:forEach var="nvo" items="${newsList }" varStatus="s">
        <span class="w3-large">
		<a href="${nvo.link }" target="_blank">${s.index+1 }.&nbsp;<span style="color: black;">${nvo.title }</span></a></span><br>
        </c:forEach>
      </li> 
    </ul>
  </div>
  
<!-- 인기 상품 -->
<div class="w3-card w3-margin">
	<div style="height: 20px"></div>
    <div class="w3-container w3-padding">
      <h3>
      <span>#가장많이본&nbsp;</span>
      <span>#실시간</span>
      <span>#인기상품</span>
      </h3>
      ${now } 기준
    </div>
    <ul class="w3-ul w3-hoverable w3-white">
      <li class="w3-padding-16">
      	<c:forEach var="vo" items="${slist }" varStatus="s">
      		<c:if test="${s.index>=0 && s.index<10 }">
		        <span class="w3-large">
				<a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}" target="_blank">${s.index+1 }.&nbsp;<span style="color: black;">${vo.title }</span></a></span><br>
        	</c:if>
        </c:forEach>
      </li> 
    </ul>
  </div>



  </span>




<section class="py-5">
	<h3 class="fw-bolder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	펀더블이 추천하는 <span style="color: #000099">#문구류</span></h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <span class="btn btn-outline-dark mt-auto text-center" id="smore">Load more</span>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="display: none" id="shidden">
            <c:forEach var="vo" items="${list }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
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
      	유저들이 가장 많이 펀딩한 <span style="color: #000099">#음식류</span></h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list2 }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <span class="btn btn-outline-dark mt-auto text-center" id="fmore">Load more</span>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="display: none" id="fhidden">
            <c:forEach var="vo" items="${list2 }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
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
      	평점이 높은 <span style="color: #000099">#출판류</span></h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list3 }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <span class="btn btn-outline-dark mt-auto text-center" id="bmore">Load more</span>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="display: none" id="bhidden">
            <c:forEach var="vo" items="${list3 }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
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
      	펀딩 금액이 높은 <span style="color: #000099">#반려동물</span></h3></h3>
	<hr>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="vo" items="${list4 }" varStatus="s">
         		<c:if test="${s.index>=0 && s.index<8 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
		                    </div>
		                    <!-- Product actions-->
		                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail_before.do?sg_no=${vo.sg_no }">펀딩하러 가기</a></div>
		                    </div>        
		                </div>                    
		            </div>
	            </c:if>
              </c:forEach>
              <span class="btn btn-outline-dark mt-auto text-center" id="pmore">Load more</span>
            </div>
            
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="display: none" id="phidden">
            <c:forEach var="vo" items="${list4 }" varStatus="s">
         		<c:if test="${s.index>=8 && s.index<16 }">
		            <div class="col mb-5">           
		                <div class="card h-100">         	
		                    <!-- Product image-->
		                    <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img class="card-img-top" src="${vo.img }" width="200px" height="210px" alt="..." /></a>
		                    <!-- Product details-->
		                    <div class="card-body p-4">
	                            <!-- Product name-->
	                            <span class="fw-bolder" style="font-size: 14pt">${vo.sponsor }명</span> 펀딩 참여 중<br>
	                            <span class="fw-bolder" style="font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.success }" />원</span> 달성
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