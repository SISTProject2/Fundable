<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

img {
	width: 330px;
	height: 330px;
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
<script>
function request() {
	var IMP = window.IMP;
	IMP.init('imp68206770');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'vbank',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${vo.title}',
	    amount : ${vo.price},
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '${vo.name}',
	    buyer_tel : '${vo.tel}',
	    buyer_addr : '??????????????? ????????? ?????????',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '????????? ?????????????????????.';
	        msg += '??????ID : ' + rsp.imp_uid;
	        msg += '?????? ??????ID : ' + rsp.merchant_uid;
	        msg += '?????? ?????? : ' + ${vo.price};
	        msg += '?????? ???????????? : ' + rsp.apply_num;
	        
	        alert(msg);
	        $.ajax({
	        	type:'post',
	        	url:'../store/after_pay.do',
	        	data:{"ph_price": ph_price, "name":name, "user_no":user_no, "sg_no":sg_no},
	        	success:function(result){
	        		location.href="../store/after_pay.do";
	        	}
	         })
	        
	        
	    } else {
	    	var msg = '????????? ?????????????????????.';
	        msg += '??????ID : ' + rsp.imp_uid;
	        msg += '?????? ??????ID : ' + rsp.merchant_uid;
	        msg += '?????? ?????? : ' + ${vo.price};
	        msg += '?????? ???????????? : ' + rsp.apply_num;
	        
	        alert(msg);
	        $.ajax({
	        	type:'post',
	        	url:'../store/after_pay.do',
	        	data:{"ph_price": ph_price, "name":name, "user_no":user_no, "sg_no":sg_no},
	        	success:function(result){
	        		location.href="../store/after_pay.do";
	        	}
	         })        
	        
	    }
	
	    
	});
	
}

// jquery => js??? jquery??? ?????? ???????????? ????????????
$(function(){
	
	// ?????? ??? ??????
	$('#btn').click(function(){
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
		let addr=$('#addr').val();
		if(addr.trim()=="")
		{
			$('#addr').focus();
			return;
		}
		
		let addr_detail=$('#addr_detail').val();
		if(addr_detail.trim()=="")
		{
			$('#addr_detail').focus();
			return;
		}
		
		let tel=$('#tel').val();
		if(tel.trim()=="")
		{
			$('#tel').focus();
			return;
		}
		
		let email=$('#email').val();
		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		}
		
		let bank_name=$('#bank_name').val();
		if(bank_name.trim()=="")
		{
			$('#bank_name').focus();
			return;
		}
		
		let card_number=$('#card_number').val();
		if(card_number.trim()=="")
		{
			$('#card_number').focus();
			return;
		}
		
		let card_date=$('#card_date').val();
		if(card_date.trim()=="")
		{
			$('#card_date').focus();
			return;
		}

		
		$('#btn').submit();

		
		// ?????? ??? ?????? ??? ?????? ??????
		ph_price =$('#ph_price').val();
		name =$('#name').val();
		user_no =$('#user_no').val();
		sg_no =$('#sg_no').val();
		request();
		
		alert(msg);
		$.ajax({
    	type:'post',
    	url:'../store/after_pay.do',
    	data:{"ph_price": ph_price, "name":name, "user_no":user_no, "sg_no":sg_no},
    	success:function(result){
    		location.href="../store/after_pay.do";
    	}
     })
})

	


})

</script>
</head>
<body>
<div class="col-25">
	<div style="height: 160px"></div>
    <div class="container" style="font-size: 15pt">
      <h1>?????? ??????</h1>
      <p>
      <hr>
      <%-- <c:forEach var="vo" items="list"> --%>
      	  <img src="${vo.img }">
 		  <p>	
	      <label for="fname">?????? ??????</label>
	      <input type="text" value="${vo.title }" id="name" name="name" readonly>
	      <label for="fname">?????? ??????</label>
	      <input type="text" value="${vo.price }???" id="ph_price" name="ph_price" readonly>
	      <input type="hidden" value="${vo.sg_no }" id="sg_no" name="sg_no" readonly>
      <%-- </c:forEach>  --%>
    </div>
  </div>
<div class="row">
  <div class="col-75">
    <div class="container" style="font-size: 14pt">
      <!-- <form action="/action_page.php"> -->
      	
        <div class="row">
          <div class="col-50">
            <h3>????????? ??????</h3>
            <div style="height: 39px"></div>     
	            <label for="fname"><i class="fa fa-user"></i> ??????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.name }" id="name" name="name" placeholder="????????? ???????????????">
	            <label for="email"><i class="fa fa-envelope"></i> ?????????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.email }" id="email" name="email" placeholder="???????????? ???????????????">
	            <label for="adr"><i class="fa fa-address-card-o"></i> ??????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.addr }" id="addr" name="addr" placeholder="????????? ???????????????">
	            <label for="city"><i class="fa fa-institution"></i> ?????? ??????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.addr_detail }" id="addr_detail" name="addr_detail" placeholder="?????? ????????? ???????????????">
	            <label for="city"><i class="fa fa-institution"></i> ????????????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.tel }" id="tel" name="tel" placeholder="??????????????? ???????????????">
	            <input type="hidden" value="${uvo.user_no }" id="user_no" name="user_no">
          </div>

          <div class="col-50">
            <h3>?????? ??????</h3>
            	<div style="height: 40px"></div>
	            <label for="cname">?????? ?????????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.bank_name }" id="bank_name" name="bank_name" placeholder="?????? ????????? ????????? ???????????????">
	            <label for="cname">?????? ????????? ??????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.name }" id="card_owner" name="name" placeholder="?????? ????????? ????????? ???????????????">
	            <label for="ccnum">?????? ??????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.card_number }" id="card_number" name="card_number" placeholder="?????? ????????? ???????????????">
	            <label for="expmonth">?????? ?????? ??????<span style="color: red; font-weight: bold">*</span></label>
	            <input type="text" value="${uvo.card_date }" id="card_date" name="card_date" placeholder="?????? ?????? ????????? ??????????????? (YY.MM.DD)">
          </div>
          
          
        </div>
        <div style="height: 80px"></div>
        <button class="btn" id="btn">????????????</button>
      <!-- </form> -->
    </div>
  </div>
  
</div>
</body>
</html>