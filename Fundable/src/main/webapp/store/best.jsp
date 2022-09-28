<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Basic 88</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" href="css/layout.css" type="text/css">
<link rel="stylesheet" type="text/css" href="../main/css/demo.css" />
<link rel="stylesheet" type="text/css" href="../main/css/multilevelnav.css" />

<style type="text/css">
.word {
	margin:30px 20px 30px 100px;
	font-size: 20pt;
	color: black;
}
#sort {
	margin:0px 20px 30px 680px;
	font-size: 10pt;
	font-color: black;
}

.pagination {
	size: 200px;
}

</style>


</head>
<body>
<!-- content -->

<div class="wrapper row2">
  <div id="container" class="clear">

    <!-- main content -->
    <div id="homepage">
    
      <!-- Services -->
      
      <div style="height: 90px"></div>
      <section id="services" class="clear">
      
      <span class="word">실시간 조회 수 TOP 15</span>

      <hr>
     
      <c:forEach var="vo" items="${slist }" varStatus="s">
      	<c:if test="${s.index>=0 && s.index<15 }">
	        <article class="one_third">
	        	<!-- 1-3위 왕관 이미지 -->
		        <c:if test="${s.index == 0 }">
	                <img src="images/gold.png" width="80" height="80">
	             </c:if>
	             <c:if test="${s.index == 1}">
	                <img src="images/silver.png" width="80" height="80">
	             </c:if>
	             <c:if test="${s.index == 2}">
	                <img src="images/bronze.png" width="80" height="80">
	             </c:if>
	             
	             <!-- 1-3위 순위 번호 지우기 -->
	             <c:if test="${s.index > 2}">
	             	<span style="font-size: 27pt">${s.index+1 }</span>
	             </c:if>
	             
	          <a href="detail_before.do?sg_no=${vo.sg_no }"><img src="${vo.img }" width="320" height="210" alt=""></a><p>
	            <figcaption>
	              <a href="detail_before.do?sg_no=${vo.sg_no }"><h2 style="font-style: regular; color: black; font-size: 12pt; font-weight: bold">${vo.title }</h2></a><p>
	              <div style="font-size: 8pt">${vo.id }</div><p>
	              <a href="detail_before.do?sg_no=${vo.sg_no }" style="color:black; font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.price }"/>원<p>
	              
	              <c:if test="${vo.rate!=0.0}">
	              	  <p>
		              <img src="images/star.png" width="18px" height="18px"><span style="color: #FF8C00; font-size: 13pt;">${vo.rate }</span>
		              <span style="float: right">
	              </c:if>
	              <c:if test="${vo.rate==0.0}">
	                  <p>
		              <span style="color: #FF8C00; font-size: 10pt;">별점 없음</span>
		              <span style="float: right">
	              </c:if>
	              
	              <img src="images/person.png" width="15px" height="15px"><span style="color: grey; font-size: 10pt">${vo.sponsor }명 참여</span></span>
	            
	              <div style="height:40px"></div>
	            </figcaption>
	       	 </article>
	        </c:if>
        </c:forEach>


      </section>

    </div>
    

    <!-- content body -->
    
    
    
    
  </div>
</div>



</body>
</html>
