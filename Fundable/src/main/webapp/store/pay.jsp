<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<body>
<div class="col-25">
	<div style="height: 160px"></div>
    <div class="container" style="font-size: 15pt">
      <h4>상품 정보 <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>4</b></span></h4>
      <%-- <c:forEach var="vo" items="list"> --%>
	      <p><a href="detail.do?sg_no=${vo.sg_no }">${vo.title }</a> <span class="price"><fmt:formatNumber pattern="#,###" value="${vo.price }"/>원</span></p>
	      <hr>
	      <p>Total <span class="price" style="color:black"><b><fmt:formatNumber pattern="#,###" value="${vo.price }"/>원</b></span></p>
      <%-- </c:forEach>  --%>
    </div>
  </div>
<div class="row">
  <div class="col-75">
    <div class="container" style="font-size: 14pt">
      <form action="/action_page.php">
      	
        <div class="row">
          <div class="col-50">
            <h3>구매자 정보</h3>
            <div style="height: 39px"></div>     
	            <label for="fname"><i class="fa fa-user"></i> 이름</label>
	            <input type="text" value="${uvo.name }" id="name" name="name" placeholder="이름을 입력하세요">
	            <label for="email"><i class="fa fa-envelope"></i> 이메일</label>
	            <input type="text" value="${uvo.email }" id="email" name="email" placeholder="이메일을 입력하세요">
	            <label for="adr"><i class="fa fa-address-card-o"></i> 주소</label>
	            <input type="text" value="${uvo.addr }" id="addr" name="addr" placeholder="주소를 입력하세요">
	            <label for="city"><i class="fa fa-institution"></i> 상세 주소</label>
	            <input type="text" value="${uvo.addr_detail }" id="addr_detail" name="addr_detail" placeholder="상세 주소를 입력하세요">
	            <label for="city"><i class="fa fa-institution"></i> 전화번호</label>
	            <input type="text" value="${uvo.tel }" id="tel" name="tel" placeholder="전화번호를 입력하세요">
          </div>

          <div class="col-50">
            <h3>결제 정보</h3>
            	<div style="height: 40px"></div>
	            <label for="cname">카드 회사명</label>
	            <input type="text" value="${uvo.bank_name }" id="name" name="name" placeholder="카드 소유자 이름을 입력하세요">
	            <label for="cname">카드 소유자 이름</label>
	            <input type="text" value="${uvo.name }" id="name" name="name" placeholder="카드 소유자 이름을 입력하세요">
	            <label for="ccnum">카드 번호</label>
	            <input type="text" value="${uvo.card_number }" id="card_number" name="card_number" placeholder="카드 번호를 입력하세요">
	            <label for="expmonth">카드 만료 날짜</label>
	            <input type="text" value="${uvo.card_date }" id="card_date" name="card_date" placeholder="카드 만료 날짜를 입력하세요 (YY.MM.DD)">
          </div>
          
          
        </div>
        <div style="height: 80px"></div>
        <input type="submit" value="결제하기" class="btn">
      </form>
    </div>
  </div>
  
</div>
</body>
</html>