<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Simple Sidebar - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
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
            	<a class="list-group-item list-group-item-action list-group-item-light p-3" href="myproject.do">올린 프로젝트</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="cart_list.do">장바구니</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">구매 내역</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">리뷰 내역</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="recently_viewed.do">최근 본 목록</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="../store/store_main.do">스토어 홈으로</a>
            </div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Page content-->
            
            <div style="height: 70px"></div>
			<div class="u-tab-content">
			            <div class="u-container-style u-tab-active u-tab-pane" id="tab-8c3e" role="tabpanel" aria-labelledby="link-tab-8c3e">
			              <div class="u-container-layout u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-1">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 23px; padding: 20px;"><span style="color: red">${size }</span>개의 상품을 담았습니다</td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-3">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-2">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="4.5%">
						                      <col width="61%">
						                      <col width="14.9%">
						                      <col width="11.3%">
						                      <col width="8.3%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                    
						                      <tr style="height: 50px; border: 1px solid lightgray;">
						                        <td class="u-table-cell u-table-cell-5"></td>
						                        <td class="u-align-center u-table-cell u-table-cell-6" style="font-weight: 700; font-size: 14px;">상품명</td>
						                        <td class="u-align-center u-table-cell u-table-cell-8" style="font-weight: 700; font-size: 14px;">수량</td>
						                        <td class="u-align-center u-table-cell u-table-cell-7" style="font-weight: 700; font-size: 14px;">합산가</td>
						                        <td class="u-align-center u-table-cell u-table-cell-9" style="font-weight: 700; font-size: 14px;">주문 관리</td>
						                        
						                        <td class="u-align-center u-table-cell u-table-cell-9" style="font-weight: 700; font-size: 14px;">
<%-- 						                        	<a href="cart_total_delete.do?sg_no=${vo.sg_no }">
						                        		<input type=button value="전체 삭제" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
						                        	</a> --%>
						                        </td>
						                        
						                      </tr>
						                      <c:if test="${size > 0 }">
							                      <c:forEach var="vo" items="${list }">
								                      <tr style="height: 32px; border: 1px solid lightgray;">
								                        <td class="u-table-cell u-table-valign-middle u-table-cell-10" style="text-align: center;">
								                        </td>
								                        <td class="u-table-cell u-table-valign-middle u-table-cell-11">
								                          <div class="u-expanded-width u-table u-table-responsive u-table-3">
											                  <table class="u-table-entity">
											                    <colgroup>
											                      <col width="10.2%">
											                      <col width="89.8%">
											                    </colgroup>
											                    <tbody class="u-table-body">
											                      <tr>
											                        <td class="u-table-cell u-table-cell-15" rowspan="2">
											                          <img src="${vo.img }" style="width: 90px; height:90px">
											                        </td>
											                      </tr>
											                      <tr style="bottom-margin: 150px">
											                        <td class="u-table-cell u-table-cell-18" style="font-size: 18px; font-weight: 700; padding: 0px 10px 10px 10px">${vo.title }</td>
											                      </tr>
											                    </tbody>
											                  </table>
											                </div>
								                        </td>
								                        <td class="u-table-cell u-table-valign-middle u-table-cell-13" style="text-align: center;">
								                          ${vo.account }
								                        </td>
								                        <td class="u-align-center u-table-cell u-table-valign-middle u-table-cell-12"><fmt:formatNumber pattern="#,###" value="${vo.price*vo.account }"/>원</td></td>                     
								                        <td class="u-table-cell u-table-valign-middle u-table-cell-14" style="text-align: center;">
								                          <input type=button value="구매 " style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
								                        </td>
								                        <td class="u-table-cell u-table-valign-middle u-table-cell-14" style="text-align: center;">
								                          <a href="cart_cancel.do?sg_no=${vo.sg_no }"><input type=button href="cart_cancel.do?sg_no=${sg_no }" value="삭제" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;"></a>
								                        </td>
								                      </tr>
							                      </c:forEach>
						                      </c:if>
						                      
						                      
						                      <tr style="height: 50px; border: none;">
						                      </tr>
						                    </tbody>
						                  </table>
						                  <!-- 상품이 없을 때 -->
					                      <c:if test="${size < 1 }">
					                      	<img src="images/cart.png" width="701px" height="250px">
					                      </c:if>
						                </div>
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			              </div>
			            </div>
			          </div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>