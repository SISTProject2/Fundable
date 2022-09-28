<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
p:not(.u-text-variant) {
    margin-top: 0px; 
    margin-bottom: 00px; 
}
</style>
</head>
<body>
  <div style="height: 100px;"></div>
  <div class="container-fluid" style="width: 83%;">
    <div class="row">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	      <li data-target="#myCarousel" data-slide-to="3"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	      <div class="item active">
	        <img src="../funding/image/main1.jpg" style="width:100%;">
	        <div style="left: 130px; width: 450px; bottom: 50px; font-size: 3.5em; font-weight: bold; position: absolute;">
		       	 편안한 잠옷인데<br>
		       	 비주얼은 외출복<br>
		      <span style="font-size: 25px; font-weight: 500;">통기성 좋은 원단에 널널한 한겹 파자마</span>
		    </div>
	      </div>
	
	      <div class="item">
	        <img src="../funding/image/main2.jpg" style="width:100%;">
	        <div style="left: 130px; width: 450px; bottom: 50px; font-size: 3.5em; font-weight: bold; position: absolute; color: white;">
		       	 폰트 하나로<br>
		       	 1990년대로 회귀<br>
		      <span style="font-size: 25px; font-weight: 500;">상업적 활용이 가능한 비디오테잎 폰트</span>
		    </div>
	      </div>
	    
	      <div class="item">
	        <img src="../funding/image/main3.jpg" style="width:100%;">
	        <div style="left: 130px; width: 450px; bottom: 50px; font-size: 3.5em; font-weight: bold; position: absolute;">
		       	 소화에 좋은 매실<br>
		       	 무설탕으로 더 건강하게<br>
		      <span style="font-size: 25px; font-weight: 500;">스틱형으로 간편하게 즐기는 황매실차</span>
		    </div>
	      </div>

	      <div class="item">
	        <img src="../funding/image/main4.jpg" style="width:100%;">
	        <div style="left: 130px; width: 450px; bottom: 50px; font-size: 3.5em; font-weight: bold; position: absolute;">
		       	 한국 고전에<br>
		       	 이런 요괴도 있었다고?<br>
		      <span style="font-size: 25px; font-weight: 500;">100여 종의 여우와 수중 요괴 도감</span>
		    </div>
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
    </div>
  </div>
  <div class="container-fluid">
    <div class="col-sm-9" style="padding-left: 180px; width: 70%;">
    <div style="height: 30px;"></div>
  <div style="height: 30px;"></div>  
  <div class="row">
    <h2 style="padding: 20px; font-weight: 700;">인기 프로젝트</h2>
    <c:forEach var="vo" items="${list }">
      <div class="col-md-3">
        <div class="thumbnail" style="border: none;">
          <a href="../funding/detail_before.do?fg_no=${vo.fg_no }" target="_blank">
            <img src="${vo.img }" alt="Lights" style="width:100%">
            <div class="caption" style="padding: 9px 0px;">
              <p style="color: gray; font-weight: 500; font-size: 14px; margin-top: 10px;">${vo.category} | ${vo.id }</p>
              <p style="font-size: 18px; font-weight: 700; margin-top: 15px; height: 51px;">${vo.title}</p>
              <p style="color: #cb3b3b; font-weight: 700; font-size: 16px; margin-top: 15px;"><fmt:formatNumber pattern="#,###" value="${vo.rate }"/>% 달성</p>
            </div>
          </a>
        </div>
      </div>
    </c:forEach>
  </div>
  <div style="height: 30px;"></div>  
  <div class="row">
    <h2 style="padding: 20px; font-weight: 700;">마감임박 프로젝트</h2>
    <c:forEach var="vo" items="${list2 }">
      <div class="col-md-3">
        <div class="thumbnail" style="border: none;">
          <a href="../funding/detail_before.do?fg_no=${vo.fg_no }" target="_blank">
            <img src="${vo.img }" alt="Lights" style="width:100%">
            <div class="caption" style="padding: 9px 0px;">
              <p style="color: gray; font-weight: 500; font-size: 14px; margin-top: 10px;">${vo.category} | ${vo.id }</p>
              <p style="font-size: 18px; font-weight: 700; margin-top: 15px; height: 51px;">${vo.title}</p>
              <p style="color: #cb3b3b; font-weight: 700; font-size: 16px; margin-top: 15px;"><fmt:formatNumber pattern="#,###" value="${vo.rate }"/>% 달성</p>
            </div>
          </a>
        </div>
      </div>
    </c:forEach>
  </div>
  <div style="height: 30px;"></div>  
  <div class="row">
    <h2 style="padding: 20px; font-weight: 700;">공개예정 프로젝트</h2>
    <c:forEach var="vo" items="${list3 }">
      <div class="col-md-3">
        <div class="thumbnail" style="border: none;">
          <a href="../funding/detail_before.do?fg_no=${vo.fg_no }" target="_blank">
            <img src="${vo.img }" alt="Lights" style="width:100%">
            <div class="caption" style="padding: 9px 0px;">
              <p style="color: gray; font-weight: 500; font-size: 14px; margin-top: 10px;">${vo.category} | ${vo.id }</p>
              <p style="font-size: 18px; font-weight: 700; margin-top: 15px; height: 51px;">${vo.title}</p>
              <p style="color: #478ac9;; font-weight: 700; font-size: 16px; margin-top: 15px;">${vo.dbday } 오픈 예정</p>
            </div>
          </a>
        </div>
      </div>
    </c:forEach>
  </div>
  <div style="height: 30px;"></div>  
  </div>
  <div class="col-sm-3" style="padding-left: 50px; padding-right: 70px;">
  <div style="height: 80px;"></div>
  <table class="table">
      <h3 style="font-weight: 700; font-size: 20px; padding-left: 10px;">최근 본 프로젝트</h3>
	    <c:forEach var="vo" items="${cList }" varStatus="s">
	    <c:if test="${s.index>=0 && s.index<8 }">
	      <tr>
	        <td rowspan="3" style="border: none;"><img src="${vo.img }" style="width: 130px; height: 130px;"></td>
	        <td rowspan="3" style="font-size: 20px; font-weight: 700; color: rgba(240, 80, 62, 0.9); border: none;">${s.index+1 }.</td>
	        <td style="border: none; padding: 0px 0px 0px 8px;"><p style="color: gray; font-weight: 700; font-size: 12px; margin-top: 10px;">${vo.category} | ${vo.id }</p></td>
	      </tr>
	      <tr>
	        <td class="text-left" style="border: none;"><a href="" target="_blank" style="font-size: 18px; color: black; font-weight: 700;">${vo.title }</a></td>
	      </tr>
	      <tr>
	        <c:if test="${vo.dbday>=today }">
	          <td style="border: none;"><p style="color: #478ac9;; font-weight: 700; font-size: 16px; margin-top: 15px;">${vo.dbday } 오픈 예정</p></td>
            </c:if>
            <c:if test="${vo.dbday<today }">
	          <td style="border: none;"><p style="color: #cb3b3b; font-weight: 700; font-size: 16px; margin-top: 15px;"><fmt:formatNumber pattern="#,###" value="${vo.rate }"/>% 달성</p></td>
            </c:if>
	      </tr>
	      </c:if>
	    </c:forEach>
  </table>
  <div style="height: 50px;"></div>
  <table class="table">
      <span style="font-weight: 700; font-size: 20px;">실시간 크라우드 펀딩 뉴스</span>
      <p style="font-size: 14px;">${now } 기준</p>
      <div style="height: 15px;"></div>
	    <c:forEach var="vo" items="${newsList }" varStatus="s">
	      <tr>
	        <td style="font-size: 16px; font-weight: 700; color: rgba(240, 80, 62, 0.9);">${s.index+1 }.</td>
	        <td class="text-left" ><a href="${vo.link }" target="_blank" style="font-size: 16px; color: black;">${vo.title }</a></td>
	      </tr>
	    </c:forEach>
  </table>
  </div>
  </div>
</body>
</html>