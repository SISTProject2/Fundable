<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item - Start Bootstrap Template</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="css/reply.css">
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">


$(function(){
	
	$('#account').change(function(){
		let count = $(this).val();
		let price = $(this).attr("data-price");
		let total = count * price;
		$('#total').text(total);
		
		$('#goods_account').val(count);
		
	})
	
	
	// 수정
	let u = 0;
	$('.up').click(function(){
		$('.updates').hide();
		let sg_no = $(this).attr("data-no");
		if(u == 0)
		{
			$('#update' + sg_no).show();
			$('#up' + sg_no).text("취소")
			u = 1;
		}
		else
		{
			$('#update' + sg_no).hide();
			$('#up' + sg_no).text("수정")
			u = 0;
		}
	})
	
	// 답글
	let i = 0;
	$('.replyb').click(function(){
		$('.replys').hide();
		let sg_no = $(this).attr("data-no");
		if(i == 0)
		{
			$('#reply' + sg_no).show();
			$('#rebtn' + sg_no).text("취소");
			i = 1;
		}
		else
		{
			$('#reply' + sg_no).hide();
			$('#rebtn' + sg_no).text("답글");
			i = 0;
		}
	})
	
	

	

})

</script>
<style type="text/css">
.mb-md-0 {
 	border-radius: 25px;
}
.button4 {border-radius: 2px;}
.button {
	background-color: #000099;
	border: none;
	color: white;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	width: 620px;
	cursor: pointer;
}
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 25%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
}

textarea {
  width: 100%;
  height: 100px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 30px;
  resize: none;
}

.button5 {
  background-color: #000099; /* Green */
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  width: 100px;
  height: 90px;
}

.similar {
	margin: 0px 20px 30px 0px;
}

.updates {
	display: flex;
}

.replys {
	display: flex;
}

#Home {background-color: red;}
#News {background-color: green;}



</style>
 <!-- Favicon-->
 <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
 <!-- Bootstrap icons-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <!-- Product section-->
    <div style="height: 60px"></div>
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
        		
            <div class="row gx-4 gx-lg-5 align-items-center">
            	<div style="height: 40px"></div>
                <div class="col-md-6" style="margin-bottom: 550px"><img class="card-img-top mb-5 mb-md-0" src="${vo.img }" width="100px" height="650px" alt="..." /></div>
                <div class="col-md-6">
                    <div class="fs-5 mb-5">
                       <span style="font-size: 17pt;">${title }</span>
                       
                       <c:if test="${vo.rate!=0.0}">
                       	<span style="float: right; font-weight: bold; font-size: 23pt"><img src="images/star.png" width="18px" height="18px">${vo.rate }</span>
                       </c:if>
                       <c:if test="${vo.rate==0.0}">
			              <span style="color: #FF8C00; font-size: 16pt; float: right; font-weight: bold">별점 없음</span>
		              </c:if>
                       	
                    </div>	
                    
                    <div class="display-5 fw-bolder" style="font-size: 20pt">${vo.title }</div>
                    <div style="height: 20px"></div>
                    <div class="fs-5 mb-5">
                        
                        <div style="float: right; font-weight: bold; font-size: 23pt"><span style="color: #000099"><fmt:formatNumber pattern="#,###" value="${vo.price }"/></span>원</div>
                    </div>
                    <div style="height: 20px"></div>
                    
                    <div class="d-flex">
                        <input type="number" id="account" max="10" min="1" data-price="${vo.price }"> :<span style="color: blue; font-size: 9pt" id="total">${vo.price }</span>원<p>
                        <form method="post" action="../mypage/session_insert.do">
	                        <input type="hidden" name="sg_no" id="goods_no" value="${vo.sg_no }">
	              			<input type="hidden" name="account" id="goods_account">
	                        
	                        <button class="btn btn-outline-dark flex-shrink-0" type="submit" style="width=60px; height: 35px; font-size: 10pt;">
	                            <i class="bi-cart-fill me-1"></i>
	                                                        장바구니에 담기
	                        </button>
                        </form>
                        
                        
                    </div>
                    
                    
                    <div style="height: 180px"></div>
                    
                    <a href="pay.do?sg_no=${vo.sg_no }">
                    <button class="button button4" style="font-size: 15pt; font-weight: bold">구매하기</button></a>
                   <div style="height: 70px"></div>
					
					<table class="w3-table w3-bordered">
				    <tr>
				      <td>펀딩 성공 금액</td>
				      <td><span style="font-size: 17pt; font-weight: bold";>
				      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      	<fmt:formatNumber pattern="#,###" value="${vo.success }"/></span>원
				      </td>
				    </tr>
				    <tr>
				      <td>서포터 수</td>
				      <td><span style="font-size: 17pt; font-weight: bold";>
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      ${vo.sponsor }</span>명</td>
				  </table>
				  
				  	
				  <div style="height: 70px"></div>
					
				
				<!-- 창작자 프로필 -->	
				<div class="profile-card">
			        <div class="profile-cover">
			            <div class="profile-avatar">
			                <span><img src="images/person.png" style="width: 130px; height: 130px" /></span>
			            </div>
			            <div class="profile-details">
			                <h2>${vo.id }</h2>
			            </div>
			        </div>
			        <div class="profile-content" style="font-size: 13.5pt">
			            <ul>
			                <li>
			                    <div class="digits">이름</div>
			                    	${vo.name }
			                </li>
			                <c:if test="${vo.email!=null}">
				                <li>
				                    <div class="digits">이메일</div>
				                    	${vo.email }
				                </li>
			                </c:if>
			                <c:if test="${vo.email==null}">
				                <li>
				                    <div class="digits">이메일</div>
				                    	비공개
				                </li>
			                </c:if>
			                
			                <c:if test="${vo.email!=null}">
				                <li>
				                    <div class="digits">문의 전화</div>
				                    	${vo.tel }
				                </li>
			                </c:if>
			                <c:if test="${vo.email==null}">
				                <li>
				                    <div class="digits">문의 전화</div>
				                    	비공개
				                </li>
			                </c:if>
			            </ul>
			            <div class="clear"></div>
			        </div>
			    </div>	               
                </div>
            </div>

		<div style="height: 150px"></div>
		
		
		
		<!-- 댓글 -->
		
		
		
			
		<form method="post" action="insert_ok.do?sg_no=${vo.sg_no }&sc_no=1">
			<span style="display: flex; font-size: 15pt">
				<input type="hidden" name="sg_no" value="${vo.sg_no }">
				<input type="hidden" name="sc_no" value="${vo.sc_no }">
				<input type="hidden" name="user_no" value="${vo.user_no }">
				<img src="images/profile.jpg" style="width: 100px; height: 80px"><div style="width: 15px"></div>
				<textarea name="content"></textarea><div style="width: 15px"></div>
				<input type="submit" value="댓글" class="button button5"></input>
			</span>
		</form>
		<!-- -->
		
		<hr>
		<div class="container mt-5">
            <div class="row  d-flex justify-content-center">
                <div class="col-md-8">
                    <div class="headings d-flex justify-content-between align-items-center mb-3">
                        <h2>댓글(6)</h2>
                    </div>
                    
                    <c:forEach var="rvo" items="${list }">
	                    <div class="card p-3">
	                        <div class="d-flex justify-content-between align-items-center">
	                      <div class="user d-flex flex-row align-items-center">
	                        <img src="images/profile.jpg" width="60" class="user-img rounded-circle mr-2">
	                        <span><small class="font-weight-bold text-primary">${id }</small> <small class="font-weight-bold">${rvo.content }</small></span>                       
	                      </div>
	                      <small>${rvo.dbday }</small>
	                      </div>
	                     <div class="action d-flex justify-content-between mt-2 align-items-center">
	                        <div class="reply px-4">
	                            <small class="replyb" data-no="${rvo.s_no }" id="rebtn${rvo.s_no }">답글</small>
	                            <span class="dots"></span>
	                            <small class="up" data-no="${rvo.s_no }" id="up${rvo.s_no }">수정</small>
	                            <span class="dots"></span>
	                            <small>삭제</small>                           
	                        </div>
	                      </div>                      
	                    </div>
	                    
	                    
	                    <form method="post" action="update_ok.do?sg_no=${vo.sg_no }&sc_no=1">
	                    	<!-- 댓글 수정 창 -->
							<span style="display: none; font-size: 15pt;" class="updates" id="update${rvo.s_no }">
								<textarea name="content">${rvo.content }</textarea><div style="width: 5px"></div>
								<input type="submit" value="수정" class="button button5" style="size: 10px"></input>
							</span>
						</form>
						
	                    <form method="post" action="">
	                    	<!-- 답글 창 -->
							<span style="display: none; font-size: 15pt" class="replys" id="reply${rvo.s_no }">
								<textarea name="content"></textarea><div style="width: 5px"></div>
								<input type="submit" value="댓글" class="button button5"></input>
							</span>
						</form>
						
						
                    </c:forEach>                  
                </div>                
            </div>          
        </div>		
        </div>
        
        
        
        
    </section>
    
    
    
    <!-- 상세 이미지 -->
    <!-- <div class="container">
      <div class="row">
        <div class="col">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">스토리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">댓글</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
                <c:forTokens items="${vo.sub_img }" delims="^" var="image">
					<td>
						<img src="${image }">
					</td>
				</c:forTokens>
              </div>
              
              <!-- 댓글 -->
              <!-- <div class="tab-pane fade" id="asd">
                <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
            </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>*/
	
	
	
    
    
    	
    
    
   
    
    
    
    <!-- 비슷한 프로젝트 -->
    <section class="py-5 bg-light">
        <div class="container px-4 px-lg-5 mt-5 similarp">
            <h3 class="fw-bolder mb-4">비슷한 프로젝트</h3><p>  
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
              
              <c:forEach var="vo" items="${rList }">
                <div class="col mb-5">
               		
	                    <div class="card h-100 similar" style="width: 330px; height: 280px; padding: 25px">	
	                        <!-- Product image-->
	                        
	                        <a href="detail_before.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}">
		                        <img class="card-img-top" src="${vo.img }" width="50px" height="250px"/>
		                        </a> 
		                        <!-- Product details-->
		                        <div class="card-body p-4">
		                            <div>
		                                <!-- Product name-->
		                                <h4 class="fw-bolder" style="color: black;">${vo.title }</h4>
		                            </div>
		                        </div>
	                         
	                    </div>
	                    
                    
                </div> 
               </c:forEach>
            </div>		
            </div>
    </section> 
    
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
