<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="css/admin-css.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#updateBtn').on('click', function(){
		let user_no=$('#user_no').val();
		if(user_no.trim() == "")
		{
			$('#user_no').focus();
			return;
		}
		let admin=$('#admin').val();
		if(admin.trim() == "")
		{
			$('#admin').focus();
			return;
		}
		let id=$('#id').val();
		if(id.trim() == "")
		{
			$('#id').focus();
			return;
		}
		let name=$('#name').val();
		if(name.trim() == "")
		{
			$('#name').focus();
			return;
		}
		let email=$('#email').val();
		if(email.trim() == "")
		{
			$('#email').focus();
			return;
		}
		$('#frm').submit();
	}
)
</script>
</head>
<body>

<div class="sidebar">
  <a class="active" href="user_list.do">유저 관리</a>
  <a href="funding_list.do">펀딩 상품 관리</a>
  <a href="store_list.do">스토어 상품 관리</a>
  <a href="approve.do">상품 승인</a>
</div>


<div class="content">
<div style="height: 15px"></div>

<h2 style="color: grey">유저 관리</h2>
<hr>
<p>


<div class="container" id="user_detail">
  <h2>${vo.name }님의 정보</h2>
  <hr>
  <form id="frm" action="user_update_ok.do" method="POST">
    <div class="form-group">
      <label for="usr">유저 번호:</label>
      <input type="text" class="form-control" id="user_no" value="${vo.user_no }">
    </div>
    <div class="form-group">
      <label for="pwd">관리자 여부:</label>
      <input type="text" class="form-control" id="admin" value="${vo.admin }">
    </div>
    <div class="form-group">
      <label for="pwd">아이디:</label>
      <input type="text" class="form-control" id="id" value="${vo.id }">
    </div>
    <div class="form-group">
      <label for="pwd">이름:</label>
      <input type="text" class="form-control" id="name" value="${vo.name }">
    </div>
    <div class="form-group">
      <label for="pwd">이메일:</label>
      <input type="text" class="form-control" id="email" value="${vo.email }">
    </div>
    <div class="form-group">
      <label for="pwd">전화번호:</label>
      <input type="text" class="form-control" id="tel" value="${vo.tel }">
    </div>
    <div class="form-group">
      <label for="pwd">생년월일:</label>
      <input type="text" class="form-control" id="bday" value="${vo.bday }">
    </div>
    <div class="form-group">
      <label for="pwd">카드 번호:</label>
      <input type="text" class="form-control" id="card_number" value="${vo.card_number }">
    </div>
    <div class="form-group">
      <label for="pwd">카드 만료 날짜:</label>
      <input type="text" class="form-control" id="card_date" value="${vo.card_date }">
    </div>
    <div class="form-group">
      <label for="pwd">우편 번호:</label>
      <input type="text" class="form-control" id="zipcode" value="${vo.zipcode }">
    </div>
    <div class="form-group">
      <label for="pwd">주소:</label>
      <input type="text" class="form-control" id="addr" value="${vo.addr }">
    </div>
    <div class="form-group">
      <label for="pwd">상세 주소:</label>
      <input type="text" class="form-control" id="addr_detail" value="${vo.addr_detail }">
    </div>
  
    <span id="buttons" style="float: right">
	 <button class="w3-button w3-red" id="updateBtn" type="submit">저장</button>
	 <button class="w3-button w3-red" onclick="javascript:history.back()">돌아가기</button>
	</span>
	</form>
</div>  
<div style="height: 30px"></div>



</body>
</html>
</body>
</html>