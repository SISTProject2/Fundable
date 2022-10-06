<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>funding_detail</title>
</head>
<link rel="stylesheet" href="../css/funding/funding_detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


<script>

//문서가 준비되면 제일 먼저 실행
$(document).ready(function() {
	$("#iamportPayment").click(function() {
		payment(); //버튼 클릭하면 호출 
	});
})

//버튼 클릭하면 실행
function payment(data) {
	IMP.init('imp15433307');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({// param
		pg : "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
		pay_method : "card", //지불 방법
		merchant_uid : "iamport_test_id", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
		name : "${vo.title }", //결제창에 노출될 상품명
		amount : ${vo.price }, //금액
		buyer_email : "emmail",
		buyer_name : "name",
		buyer_tel : "tel"
	}, function(rsp) { // callback
		if (rsp.success) {
			alert("완료 -&gt; imp_uid : " + rsp.imp_uid
					+ " / merchant_uid(orderKey) : " + rsp.merchant_uid);
		} else {
			alert("실패 : 코드(" + rsp.error_code + ") / 메세지(" + rsp.error_msg
					+ ")");
		}
	});
}
</script>
<body>

	<main>
    <p class="category_location">
    </p>
    <article class="detail_top">
        <section class="detail_img">
            <div>
                <img src="${vo.img }" alt="">
            </div>
        </section>
            <div>
			<section class="detail_info">
			<div class="detail_info_p">
				<div>
					<div class="detail_name">
						<p class="d_brand">
							<a href="../funding/cate_list.do?fc_no=${fc_no }">${cvo }</a>
						</p>
						<div class="d_name">
							 ${vo.title }
						</div>
					</div>
					
					<div>
						<div class="detail_price">
							<span>모인 금액 &nbsp;&nbsp;  </span>
							<span class="d_price"> <fmt:formatNumber pattern="#,###" value="${vo.now_amount }" />원 </span>
						</div>
						
						<div class="detail_price">
							<span>달성률 &nbsp;&nbsp;&nbsp;&nbsp; </span>
							<span class="d_price" id="red">${vo.rate }%</span>
						</div>
						
						<div class="detail_price">
							<span>남은 시간 &nbsp; </span>
							<span class="d_price"> ${vo.leftday }일</span>
						</div>

						<div class="detail_price">
							<span>후원자 &nbsp;&nbsp;&nbsp;&nbsp;  </span>
							<span class="d_price"> <fmt:formatNumber pattern="#,###" value="${vo.sponsor }" />명</span>
						</div>

					</div>

					<div class="detail_amount" id="iamportPayment">
						<div class="d_price_button">
							<div class="dpb">
								${vo.price }원 후원하기
							</div>
						</div>

						<!-- 좋아요 버튼 -->
						<div class="detail_like">
					        	<a href=""><img src="../funding/image/like_g.png"><br>${vo.like_count }</a>
					 
					      		<img src="">
						</div>
					</div>
					<div class="goods_info">
						<div class="goods_h1">상품 정보</div>
						<div class="GI_detail">
							<div class="GI_title">
								목표금액<br> 펀딩 기간<br> 결제일<br> 창작자<br> 이메일<br>
							</div>
							<div class="GI_contents">
								${vo.goal_amount }원 <br>
								${vo.dbday } ~ ${vo.dbday } <br>
								목표금액 달성시에 ${vo.dbday }결제 진행 <br>
								${uvo.id } | ${uvo.name } <br>
								${uvo.email }
							</div>
						</div>
					</div>
				</div>
				</div>

			</section>
            </div>
		</article>



		<hr>

		<article>
			<div class="goods_h1">상세 이미지</div>
			<section>
				<c:forEach var="image" items="${iList }">
					<td>
						<img src="${image }">
					</td>
				</c:forEach>
			</section>

		</article>

	</main>

</body>

</html>