<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Basic 88</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
	margin:0px 20px 30px 570px;
	font-size: 13pt;
	color: black !important;
	font-weight: bold;
}

.price {
	font-weight: bold;
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
      <section id="services" class="clear">
      
      <span class="word">${title }</span>
      
      <span id="sort">
      	<a href="list.do?no=1">인기 순 &nbsp;|&nbsp;</a>
      	<a href="list.do?no=2">서포터 많은 순 &nbsp;|&nbsp;</a>
      	<a href="list.do?no=3">최신 순 &nbsp;|&nbsp;</a>
      	<a href="list.do?no=4">가격 높은 순 &nbsp;|&nbsp;</a>
      	<a href="list.do?no=5">가격 낮은 순</a>
      </span>

      <hr>
     
      <c:forEach var="vo" items="${list }" varStatus="s">
      	<c:if test="${s.index>=0 && s.index<15 }">
	        <article class="one_third">
	          <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><img src="${vo.img }" width="320" height="230" alt=""></a><p>
	            <figcaption>
	              <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}"><h2 style="font-style: regular; color: black; font-size: 12pt; font-weight: bold">${vo.title }</h2></a>
	              <div style="font-size: 12pt">창작자 | ${vo.id }</div>
	              <span class="price"><a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}" style="color:black; font-size: 14pt"><fmt:formatNumber pattern="#,###" value="${vo.price }"/>원<p>
	              </span>
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
    
    
    <!-- pagination -->
	    <div class="text-center">
	            <ul class="pagination">
	             <li><a href="list_category.do?sc_no=${sc_no }&no=${no }&page=1">&lt;&lt;</a></li>
	             <c:if test="${startPage>1 }"><%-- 1 11 21... --%>
	             <li><a href="list_category.do?sc_no=${sc_no }&no=${no }&page=${startPage-1 }">&lt;</a></li>
	           </c:if>
	           <c:forEach var="i" begin="${startPage }" end="${endPage }">
	             <c:if test="${curpage==i }">
	               <c:set var="style" value="class=active"/>
	             </c:if>
	             <c:if test="${curpage!=i }">
	               <c:set var="style" value=""/>
	             </c:if>
	             <li ${style }><a href="list_category.do?sc_no=${sc_no }&no=${no }&page=${i }">${i }</a></li>
	           </c:forEach>
	           <c:if test="${endPage<totalpage }">
	             <li><a href="list_category.do?sc_no=${sc_no }&no=${no }&page=${endPage+1 }">&gt;</a></li>
	           </c:if>
	           <li><a href="list_category.do?sc_no=${sc_no }&no=${no }&page=${totalpage }">&gt;&gt;</a></li>
	         </ul>
	       </div>
    <!-- content body -->
    
    
        
    
  </div>
</div>



</body>
</html>
