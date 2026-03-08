<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.dao.JobDao" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.jobs" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Job</title>

<%@include file="all_components/all_css.jsp"%>

</head>
<body>
<c:if test="${empty userobj }">
<c:redirect url = "login.jsp"/>
</c:if>
<%@include file="all_components/navbar.jsp"%>

<div class="container mt-5">

<%
int id = Integer.parseInt(request.getParameter("id"));

JobDao dao = new JobDao(DBConnect.getConn());

jobs j = dao.getJobById(id);
%>

<div class="row justify-content-center">

<div class="col-md-8">

<div class="card shadow">

<div class="card-body">

<h3 class="text-center mb-4"><%= j.getTittle() %></h3>

<hr>

<p>
<strong>Location :</strong>
<%= j.getLocation() %>
</p>

<p>
<strong>Category :</strong>
<%= j.getCategory() %>
</p>

<p>
<strong>Status :</strong>
<span class="badge bg-success text-white">
Open
</span>
</p>

<hr>

<h5>Description</h5>

<p>
<%= j.getDescription() %>
</p>

<div class="text-center mt-4">

<a href="home.jsp"
class="btn btn-primary">

Back

</a>

</div>

</div>

</div>

</div>

</div>

</div>

</body>
</html>