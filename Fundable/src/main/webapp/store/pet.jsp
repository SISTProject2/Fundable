<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Basic 88</title>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" href="css/layout.css" type="text/css">
<link rel="stylesheet" type="text/css" href="../main/css/demo.css" />
<link rel="stylesheet" type="text/css" href="../main/css/multilevelnav.css" />

<!-- include -->
<jsp:include page="../main/nav_store.jsp" />
</head>
<body>
<!-- content -->
<div class="wrapper row2">
  <div id="container" class="clear">
    <!-- Slider -->
    <section id="slider"><a href="#"><img src="images/list/960x360.gif" alt=""></a></section>
    <!-- main content -->
    <div id="homepage">
    
      <!-- Services -->
      <section id="services" class="clear">
      <c:forEach var="vo" items="${list }">
	        <article class="one_third">
	          <img src="${vo.img }" width="290" height="180" alt="">
	            <figcaption>
	              <h2 style="font-style: regular; color: black; font-size: 12pt; font-weight: bold">${vo.title }</h2>
	              <div style="font-size: 8pt">어디어디 주식회사</div>
	              <div style="color: black; font-size: 11.5pt">${vo.price }</div>
	              <img src="images/list/star.png" width="20px" height="20px"><span style="color: #FF8C00; font-size: 10pt;">${vo.rate }</span>
	              <span style="float: right">
	              <img src="images/list/person.png" width="20px" height="20px"><span style="color: grey; font-size: 8pt">${vo.sponsor }명 참여</span></span>
	            </figcaption>
	        </article>
        </c:forEach>


      </section>

    </div>
    <!-- / content body -->
  </div>
</div>



</body>
</html>
