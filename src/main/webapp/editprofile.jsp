<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<%@include file="all_components/all_css.jsp"%>

<style>
.bg-custom{
background:#283593;
}
</style>

</head>
<%@include file="all_components/navbar.jsp"%>
<body>
 <c:if test="${not empty succMsg }"><div class="alert alert-success" role="alert">
  ${ succMsg }
</div>
<c:remove var ="succMsg"/>
</c:if>
<c:if test="${empty userobj }">
<c:redirect url = "login.jsp"/>
</c:if>

<div class="container p-5">

<div class="row">
<div class="col-md-4 offset-md-4">

<div class="card">
<div class="card-header text-center text-primary">

<i class="fa fa-user-circle fa-3x"></i>
<h4>Edit Profile</h4>

</div>

<div class="card-body">

<form action="update_profile" method="post">

<input type="hidden" name="id" value="${userobj.id}">

<div class="form-group">
<label>Name</label>
<input type="text" name="name" class="form-control" value="${userobj.name}" required>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" class="form-control" value="${userobj.email}" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" class="form-control" placeholder="Enter new password">
</div>

<div class="form-group">
<label>Qualification</label>
<input type="qualification" name="qualification" class="form-control" value="${userobj.qualification }">
</div>

<div class="text-center">

<button type="submit" class="btn btn-primary">Update Profile</button>

<a href="home.jsp" class="btn btn-secondary ml-2">
<i class="fa fa-arrow-left"></i> Back
</a>

</div>

</form>

</div>
</div>

</div>
</div>

</div>

</body>
</html>