<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.JobDao" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.jobs" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Job</title>

<%@include file="all_components/all_css.jsp"%>
<%@include file="all_components/navbar.jsp"%>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f1f2;
}

.container {
    width: 50%;
    margin: 50px auto;
    background-color: white;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

label {
    font-weight: bold;
}

input, select, textarea {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #2c3e50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #1a252f;
}
</style>

</head>
<body>
<c:if test = "${userobj.role ne 'admin'}">
<c:redirect url ="login.jsp"></c:redirect>
</c:if>

<div class="container">

<%
int id = Integer.parseInt(request.getParameter("id"));
JobDao dao = new JobDao(DBConnect.getConn());
jobs j = dao.getJobById(id);
%>

<h2>Edit Job</h2>

<form action="updatejob" method="post">

<!-- Hidden id -->
<input type="hidden" name="id" value="<%=j.getId()%>">

<!-- Job Title -->
<label>Job Title</label>
<input type="text" name="tittle" required value="<%=j.getTittle()%>">

<!-- Location -->
<label>Location</label>
<input type="text" name="location" required value="<%=j.getLocation()%>">

<!-- Category -->
<label>Category</label>
<select name="category" required>

<option value="IT" <%= j.getCategory().equals("IT")?"selected":"" %>>IT</option>

<option value="Finance" <%= j.getCategory().equals("Finance")?"selected":"" %>>Finance</option>

<option value="Marketing" <%= j.getCategory().equals("Marketing")?"selected":"" %>>Marketing</option>

<option value="HR" <%= j.getCategory().equals("HR")?"selected":"" %>>HR</option>

<option value="Engineering" <%= j.getCategory().equals("Engineering")?"selected":"" %>>Engineering</option>

</select>

<!-- Status -->
<label>Status</label>
<select name="status" required>

<option value="Open" <%= j.getStatus().equals("Open")?"selected":"" %>>Open</option>

<option value="Closed" <%= j.getStatus().equals("Closed")?"selected":"" %>>Closed</option>

</select>

<!-- Description -->
<label>Job Description</label>
<textarea name="description" rows="4" required><%=j.getDescription()%></textarea>

<!-- Submit Button -->
<button type="submit">Update Job</button>

</form>
</div>

</body>
</html>