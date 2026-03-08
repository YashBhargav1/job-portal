<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_components/all_css.jsp"%>
<%@include file="all_components/navbar.jsp"%>
<style type="text/css">
.back-img {
	background:url("all_components/img/bg2.webp");
		
    width :90%;
    height: 110vh;
    background-repeat: no-repeat;
    background-size: cover;

}
</style>
</head>
<body>
<c:if test = "${userobj.role ne 'admin'}">
<c:redirect url ="login.jsp"></c:redirect>
</c:if>

<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-white p-4">Welcome Admin
			</h1>

		</div>


	</div>

</body>
</html>