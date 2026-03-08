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
<title>User : Home</title>

<%@include file="all_components/all_css.jsp"%>

</head>
<body>
<c:if test="${empty userobj }">
<c:redirect url = "login.jsp"/>
</c:if>

<%@include file="all_components/navbar.jsp"%>

          
<div class="container mt-4">

<h3 class="text-center mb-4">Available Jobs</h3>

<!-- FILTER SECTION -->

<form action="searchjobs.jsp" method="get">

<div class="row mb-4">

<!-- LOCATION INPUT -->

<div class="col-md-4">
<input type="text"
class="form-control"
name="location"
placeholder="Enter Location">
</div>

<!-- CATEGORY DROPDOWN -->

<div class="col-md-4">
<select class="form-control" name="category">

<option value="">Choose Category</option>
<option value="IT">IT</option>
<option value="Developer">Developer</option>
<option value="Banking">Banking</option>
<option value="Engineer">Engineer</option>
<option value="Teacher">Teacher</option>

</select>
</div>

<div class="col-md-4">
<button class="btn btn-primary">
Search Jobs
</button>
</div>

</div>

</form>

<hr>


<%
JobDao dao = new JobDao(DBConnect.getConn());
List<jobs> list = dao.getAllJobsForUser();

for(jobs j : list){

String desc = j.getDescription();
String shortDesc = desc;

if(desc.length() > 120){
shortDesc = desc.substring(0,120) + "...";
}
%>


<!-- JOB CARD -->

<div class="card mb-3 shadow">

<div class="card-body">

<h5 class="card-title"><%= j.getTittle() %></h5>

<p>
<strong>Location:</strong>
<%= j.getLocation() %>
</p>

<p>
<strong>Category:</strong>
<%= j.getCategory() %>
</p>

<p>
<strong>Status:</strong>
<span class="badge bg-success text-white">
Open
</span>
</p>

<p>
<strong>Description:</strong>
</p>

<p>
<%= shortDesc %>
</p>


<!-- VIEW MORE BUTTON -->

<div class="text-center mt-3">

<a href="viewmore.jsp?id=<%=j.getId()%>"
class="btn btn-success btn-sm">

View More

</a>

</div>

</div>

</div>


<%
}
%>

<%
if(list.size()==0){
%>

<h4 class="text-center text-danger mt-4">
No Jobs Available
</h4>

<%
}
%>

</div>

</body>
</html>