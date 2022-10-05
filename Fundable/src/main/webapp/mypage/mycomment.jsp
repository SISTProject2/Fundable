<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="mycomment.do"><b>리뷰 내역</b></a>
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
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 23px; padding: 20px;">총 <span style="color: red">${count }</span>개의 댓글을 업로드 했습니다</td>
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
						                        <td class="u-align-center u-table-cell u-table-cell-6" style="font-weight: 700; font-size: 14px;">댓글 내용</td>
						                        
						                        <td class="u-align-center u-table-cell u-table-cell-9" style="font-weight: 700; font-size: 14px;">
<%-- 						                        	<a href="cart_total_delete.do?sg_no=${vo.sg_no }">
						                        		<input type=button value="전체 삭제" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
						                        	</a> --%>
						                        </td>
						                        
						                      </tr>
						                      <%-- <c:if test="${size > 0 }"> --%>
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
																	<!-- 댓글 내용 -->
																	${id} | ${vo.dbday }<br>
																	<b>${vo.content }</b><br>
																	<!-- 상품 이름 -->
																	<a href="../store/detail.do?sg_no=${vo.sg_no }&sc_no=${vo.sc_no}">
																	 <img src="images/original.png" width="55px" height="55px"> | ${vo.title }</a>
											                      </tr>
											                    </tbody>
											                  </table>
											                </div>
								                        </td>                    
								                        <td class="u-table-cell u-table-valign-middle u-table-cell-14" style="text-align: center;">
								                          <a href="comment_delete.do?s_no=${vo.s_no }"><input type=button value="삭제" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
								                        	</a>
								                        </td>
								                      </tr>
							                      </c:forEach>
						                      <%-- </c:if> --%>
						                      
						                      
						                      
						                      
						                      <tr style="height: 50px; border: none;">
						                      </tr>
						                    </tbody>
						                  </table>
						                  <span class="buttons">
								                  <a href="mycomment.do?page=${curpage>1?curpage-1:curpage }"><button>이전</button></a>
												  ${curpage } page / ${totalpage } pages
									              <a href="mycomment.do?page=${curpage<totalpage?curpage+1:curpage }"><button>다음</button></a>
								              </span>
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
</body>
</html>