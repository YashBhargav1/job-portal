<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.dao.JobDao" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.jobs" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Jobs</title>

<%@include file="all_components/all_css.jsp"%>

</head>
<body>
<c:if test = "${userobj.role ne 'admin'}">
<c:redirect url ="login.jsp"></c:redirect>
</c:if>

<%@include file="all_components/navbar.jsp"%>

<div class="container mt-5">

<h3 class="text-center mb-4">Available Jobs</h3>

<!-- Success Message -->
<c:if test="${not empty succMsg}">
<div class="alert alert-success text-center" role="alert">
${succMsg}
</div>
<c:remove var="succMsg"/>
</c:if>

<%
JobDao dao = new JobDao(DBConnect.getConn());
List<jobs> list = dao.getAllJobs();

for(jobs j : list){
%>

<div class="card mb-3 shadow">

<div class="card-body">

<h5 class="card-title"><%= j.getTittle() %></h5>

<p><strong>Location:</strong> <%= j.getLocation() %></p>

<p><strong>Category:</strong> <%= j.getCategory() %></p>

<p>
<strong>Status:</strong>

<% if("Open".equals(j.getStatus())){ %>
<span class="badge bg-success text-white">Open</span>
<% } else { %>
<span class="badge bg-danger text-white">Closed</span>
<% } %>

</p>

<p><strong>Description:</strong></p>

<p><%= j.getDescription() %></p>

<!-- Center Buttons -->
<div class="text-center mt-4">

<a href="editjobs.jsp?id=<%=j.getId()%>" 
class="btn btn-primary btn-sm me-2">
Edit
</a>

<a href="delete?id=<%=j.getId()%>" 
class="btn btn-danger btn-sm"
onclick="return confirm('Are you sure you want to delete this job?');">
Delete
</a>

</div>

</div>

</div>

<%
}
%>

</div>

</body>
</html>