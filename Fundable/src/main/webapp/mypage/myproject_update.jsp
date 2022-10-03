<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="css/mypage.css" type="text/css">
<link rel="stylesheet" href="../css/mypage/nicepage.css" media="screen">
<link rel="stylesheet" href="../css/mypage/mypage.css" media="screen">
<jsp:include page="../main/header.jsp"></jsp:include>
</head>
<body>

	<div class="d-flex" id="wrapper">
	  <!-- Sidebar-->
      <div class="border-end bg-white" id="sidebar-wrapper">
          <div class="sidebar-heading border-bottom bg-light"><span style="font-weight: bold">${id}</span>님의 <br>스토어 마이페이지</div>
          <div class="list-group list-group-flush">
              <a class="list-group-item list-group-item-action list-group-item-light p-3" href="myproject.do"><span style="font-weight: bold">올린 프로젝트</span></a>
              <a class="list-group-item list-group-item-action list-group-item-light p-3" href="cart_list.do">장바구니</a>
              <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">구매 내역</a>
              <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">리뷰 내역</a>
              <a class="list-group-item list-group-item-action list-group-item-light p-3" href="recently_viewed.do">최근 본 목록</a>
              <a class="list-group-item list-group-item-action list-group-item-light p-3" href="../store/store_main.do">스토어 홈으로</a>     	
          </div>     
      </div>
      
     <div class="container" id="store_detail">
		 <h2>내 프로젝트 수정하기</h2><p>
		 <a href="../store/detail.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}" style="z-index: -6">해당 상품 페이지 바로 가기 &gt;&gt;</a>
		  <hr>
		  
		  <form id="frm" action="myproject_update_ok.do" method="POST">
		  	
		  	<img src="${vo.img }" style="width: 230px; height: 230px">
		  	<div style="height: 20px"></div>
		  	
		    <div class="form-group">
		      <label for="pwd">상품 이름</label>
		      <input type="text" class="form-control" id="title" name="title" value="${vo.title }">
		    </div>
		    <p>
		    <div class="form-group"> <!-- 출력하지 않을 건 hidden으로 감춤 -->
		      <input type="hidden" class="form-control" id="user_no" name="user_no" value="${vo.user_no }">
		      <input type="hidden" class="form-control" id="sg_no" name="sg_no" value="${vo.sg_no }">
		    </div> 
		    <div class="form-group">
		      <label for="pwd">가격(숫자만 입력)</label>
		      <input type="text" class="form-control" id="price" name="price" value="${vo.price }">
		    </div>
		    <p>
		    <div class="form-group">
		      <label for="pwd">이미지 URL</label>
		      <input type="text" class="form-control" id="img" name="img" value="${vo.img }">
		    </div>
		    <p>
		    <div class="form-group">
		      <label for="pwd">상세 이미지 URL('^'로 구분)</label>
		      <input type="text" class="form-control" id="sub_img" name="sub_img" value="${vo.sub_img }">
		    </div>
		    <p>
		    <div class="form-group">
		      <label for="pwd">상품 카테고리 넘버(1: 문구, 2: 푸드, 3: 출판, 4: 반려동물)</label>
		      <input type="text" class="form-control" id="sc_no" name= "sc_no" value="${vo.sc_no }">
		    </div>
		
			<p>
		    <span id="buttons" style="float: right">
			 <button class="w3-button w3-red" id="btn" type="submit"
			 	onclick="return confirm('정말로 수정하시겠습니까?')">저장</button>
			 <button class="w3-button w3-red" onclick="javascript:history.back()">돌아가기</button>
			</span>
			
			</form>
			<div style="height: 100px"></div>
		</div>
		  
      
   </div>
   
   
      
      
      
      
      
</body>
</html>