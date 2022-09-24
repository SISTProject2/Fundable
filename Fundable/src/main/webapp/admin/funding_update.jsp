<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="css/admin-css.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

<div class="sidebar">
  <a href="user_list.do">유저 관리</a>
  <a class="active" href="funding_list.do">펀딩 상품 관리</a>
  <a href="store_list.do">스토어 상품 관리</a>
  <a href="approve.do">상품 승인</a>
</div>


<div class="content">
<div style="height: 20px"></div>
<h2 style="color: grey">펀딩 상품 관리</h2>
<hr>
<p>


<div class="container" id="store_detail">
 <h2>${vo.title }</h2><p>
 <a href="../funding/detail.do?fg_no=${vo.fg_no }">해당 상품 페이지 바로 가기 &gt;&gt;</a>
  <hr>
  <form id="frm" action="funding_update_ok.do" method="POST">
	  	<img src="${vo.img }" style="width: 230px; height: 230px">
	  	<div style="height: 20px"></div>
	  	
	    <div class="form-group">
	      <label for="usr">상품 번호:</label>
	      <input type="text" class="form-control" name="fg_no" value="${vo.fg_no }" readonly>
	    </div>
	    <div class="form-group">
	      <label for="pwd">상품 이름:</label>
	      <input type="text" class="form-control" name="title" value="${vo.title }">
	    </div>
	    <div class="form-group">
	      <input type="hidden" class="form-control" name="user_no" value="${vo.user_no }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">창작자 이름:</label>
	      <input type="text" class="form-control" name="id" value="${id }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">가격:</label>
	      <input type="text" class="form-control" name="price" value="${vo.price }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">이미지 URL:</label>
	      <input type="text" class="form-control" name="img" value="${vo.img }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">상세 이미지 URL('^'로 구분):</label>
	      <input type="text" class="form-control" name="sub_img" value="${vo.sub_img }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">상품 설명:</label>
	      <input type="content" height="1500px" class="form-control" name="content" value="${vo.content } ">
	    </div>
	    <div class="form-group">
	      <label for="pwd">목표 금액:</label>
	      <input type="text" class="form-control" name="goal_amount" value="${vo.goal_amount }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">구매자 수:</label>
	      <input type="text" class="form-control" name="now_amount" value="${vo.now_amount }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">오픈 예정 날짜:</label>
	      <input type="text" class="form-control" id="open_date" name="open_date" 
	      	value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${vo.open_date }" />'>
	    </div>
	    <div class="form-group">
	      <label for="pwd">마감 날짜:</label>
	      <input type="text" class="form-control" id="close_date" name="close_date" 
	      	value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${vo.close_date }" />'>
	    </div>
	    <div class="form-group">
	      <label for="pwd">후원자 수:</label>
	      <input type="text" class="form-control" name="sponsor" value="${vo.sponsor }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">좋아요 수:</label>
	      <input type="text" class="form-control" name="like_count" value="${vo.like_count }">
	    </div>
	    <div class="form-group">
	      <label for="pwd">펀딩 카테고리 번호:</label>
	      <input type="text" class="form-control" name="fc_no" value="${vo.fc_no }">
	    </div>
	
	
	    <span id="buttons" style="float: right">
		 <button class="w3-button w3-red" id="updateBtn" type="submit"
		 	onclick="return confirm('정말로 수정하시겠습니까?')">저장</button>
		 <button class="w3-button w3-red" onclick="javascript:history.back()">돌아가기</button>
		</span>
	</form>
</div>  
<div style="height: 30px"></div>



</body>
</html>
</body>
</html>