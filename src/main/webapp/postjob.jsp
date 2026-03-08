<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Job</title>
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
    <h2>Post a New Job</h2>
    
   
   <c:if test="${not empty succMsg }"><div class="alert alert-success" role="alert">
  ${ succMsg }
</div>
<c:remove var ="succMsg"/>
</c:if>

    <form action="postjob" method="post">

        <!-- Job Title -->
        <label>Job Tittle</label>
        <input type="text" name="tittle" placeholder="Enter job tittle" required>

        <!-- Location -->
        <label>Location</label>
        <input type="text" name="location" placeholder="Enter job location" required>

        <!-- Category -->
        <label>Category</label>
        <select name="category" required>
            <option value="">-- Select Category --</option>
            <option>IT</option>
            <option>Finance</option>
            <option>Marketing</option>
            <option>HR</option>
            <option>Engineering</option>
        </select>

        <!-- Status -->
        <label>Status</label>
        <select name="status" required>
            <option value="">-- Select Status --</option>
            <option>Open</option>
            <option>Closed</option>
        </select>

        <!-- Description -->
        <label>Job Description</label>
        <textarea name="description" rows="4"
                  placeholder="Enter job description"
                  required></textarea>

        <!-- Submit Button -->
        <button type="submit">Post Job</button>

    </form>
</div>

</body>
</html>