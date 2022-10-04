<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.floating {
  position: fixed; 
  right: 0%;
  bottom: 0%;
}
</style>
</head>
<body>
  <jsp:include page="../main/header.jsp"></jsp:include>
  <jsp:include page="../main/nav_funding.jsp"></jsp:include>
  <jsp:include page="${main_jsp }"></jsp:include>
  <c:if test="${sessionScope.id==null }">
    <div class="floating">
	  <a href="../user/login.do"><img src="../css/img/chat.png" style="width: 130px; height: 130px;"></a>
    </div>
  </c:if>
  <c:if test="${sessionScope.id!=null }">
    <div class="floating">
	  <a href="../chat/chat.do"><img src="../css/img/chat.png" style="width: 130px; height: 130px;"></a>
    </div>
  </c:if> 
  <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>