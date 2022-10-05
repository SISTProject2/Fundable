<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link rel="stylesheet" href="css/admin-css.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css" >
input.ui-corner-all {
  width: 500px;
  height: 40px;
  font-size: 40px;
}

label {
	font-size: 14pt;
}

a {
	text-decoration-line: none;
}

</style>

<!-- vue  -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$('#update').click(function(){ 
		
	})
	
	
} );
</script>

</head>
<body>

<div class="sidebar">
  <a href="user_list.do">유저 관리</a>
  <a href="funding_list.do">펀딩 상품 관리</a>
  <a href="store_list.do">스토어 상품 관리</a>
  <a class="active" href="comment.do">유저 댓글 관리</a>
  <a href="../main/main.do">메인 홈으로</a>
</div>


<div class="content">
<h2 style="color: grey">유저 댓글 관리</h2>
<hr>
<p>

<!-- 검색 창 -->
<!-- <div class="word" style="display: flex">
  <span class="search_bar" style="display: flex">
  	<form method="post" action="../admin/funding_list.do">
	  <input type="search" class="form-control rounded" style="line-height: 32px;" placeholder="상품 이름을 입력하세요" aria-label="Search" aria-describedby="search-addon" name="type" />
	  <button type="submit" class="w3-button w3-green" v-on:click="fundingFind()">검색</button>
  	</form>
  </span>
</div>-->

<p></p>
  
<div class="container">
  <div class="row">
    <div class="col-12">
		<table class="table table-image">
		  <thead>
		    <tr>
		      <th scope="col">댓글 내용</th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="vo" items="${list }">
			    <tr>	    

			      <td>
			      
			           작성 날짜 | ${vo.dbday }<br>
			      <p>
			      <b><span style="font-size: 14pt">${vo.content}</span></b>
			      <p>
			      <img src="image/original.png" width="55px" height="55px"> | <a href="../store/detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}" target="_blank">${vo.title }</a><br>
			      </td>
			      <td>
				   	  <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="comment_delete.do?s_no=${vo.s_no }"><button class="w3-button w3-red">삭제</button></a>
			   	  </td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>   
	
	

	

  
  <!-- pagination -->
  <div style="height: 20px;"></div>
    <div class="row">
      <div class="text-center">
        <button class="w3-button w3-green"><a href="../admin/comment.do?page=${curpage>1?curpage-1:curpage }">이전</a></button>
          ${curpage } page / ${totalpage } pages
        <button class="w3-button w3-green"><a href="../admin/comment.do?page=${curpage<totalpage?curpage+1:curpage }">다음</a></button>
      </div>
    </div>
  	
	
</div>

</body>
</html>
  
  	
	
</div>

</body>
</html>
