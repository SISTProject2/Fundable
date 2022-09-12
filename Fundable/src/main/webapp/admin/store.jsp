<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link rel="stylesheet" href="css/admin-css.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>

<div class="sidebar">
  <a href="#home">유저 관리</a>
  <a href="#home">펀딩 상품 관리</a>
  <a class="active" href="#news">스토어 상품 관리</a>
  <a href="#news">상품 승인</a>
  <a href="#news">홈으로</a>
</div>


<div class="content">
<h2 style="color: grey">스토어 상품 관리</h2>
<hr>
<p>

<li style="display: flex">
  <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search" width=30px>
</li>

<p></p>
  
<div class="container">
  <div class="row">
    <div class="col-12">
		<table class="table table-image">
		  <thead>
		    <tr>
		      <th scope="col">상품 번호</th>
		      <th scope="col">이미지</th>
		      <th scope="col">상품 이름</th>
		      <th scope="col">가격</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td class="w-25">
			      <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg" class="img-fluid img-thumbnail" alt="Sheep" style="height: 120px; width: 120px">
		      </td>
		      <td>Bootstrap 4 CDN and Starter Template</td>
		      <td>Cristina</td>
		    </tr>

		  </tbody>
		</table>   
    </div>
  </div>
</div>
  
  	
	
</div>

</body>
</html>
