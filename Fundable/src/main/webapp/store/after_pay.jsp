<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../main/header.jsp"></jsp:include>
<jsp:include page="../main/nav_store.jsp"></jsp:include>
<style type="text/css">
.cb1 {
  padding: 20px;
}

.accordion {
    background-color: #fff;
    margin-top: 20px;
    margin-bottom: 20px;
}

.accordion h4 {
    background-color: #de2323;
    color: #fff;
    position: relative;
    background-color: #de2323;
    padding: 10px;
    border-bottom: 1px solid #fff;
    margin: 0;
    line-height: 1em;
    font-size: 16px;
    text-transform: uppercase;
}
</style>
</head>
<body>
<div style="height: 250px"></div>
<div class="container">
  <div class="cb1">
    <div class="row text-center">
        <span class="icon icon-xl icon-success">
          <i class=""></i>
        </span>
        <h1>주문이 완료되었습니다!</h1>
        <p>
        <h4>상품은 영업일 2-3일 내 배송됩니다!</h4>                 
  </div>
  </div>
</div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
  <div class="accordion active" id="Details">
    <h4 class="accordion-toggle"><i class="fa fa-chevron-down"></i></h4>
    <div class="panel-body">
      <div class="form-group">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 menuitem">
          
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>