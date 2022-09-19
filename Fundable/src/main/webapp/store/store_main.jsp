<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#nav_funding').hide();
})
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
    <jsp:include page="../main/nav_store.jsp"></jsp:include>
	<jsp:include page="${ store_main_jsp }"></jsp:include>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>
