<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>

<%@include file="all_components/all_css.jsp"%>
<%@include file="all_components/navbar.jsp"%>

<style>
body {
    background-color: #f0f1f2;
}

.card {
    border-radius: 10px;
}

.btn-custom {
    background-color: #2c3e50;
    color: white;
}

.btn-custom:hover {
    background-color: #1a252f;
}
</style>

</head>
<body>

 <c:if test="${not empty succMsg }"><h4 class="text-center text-success">${succMsg }</h4>
<c:remove var ="succMsg"/>
</c:if>

<div class="container">
  <div class="row justify-content-center mt-5">
    <div class="col-md-6">

      <div class="card shadow">
        <div class="card-body">

          <h4 class="text-center mb-4">Create Account</h4>

          <form action="register" method="post">

            <!-- Full Name -->
            <div class="form-group">
              <label>Full Name</label>
              <input type="text"
                     class="form-control"
                     name="fullname"
                     placeholder="Enter full name"
                     required>
            </div>

            <!-- Email -->
            <div class="form-group">
              <label>Email address</label>
              <input type="email"
                     class="form-control"
                     name="email"
                     placeholder="Enter email"
                     required>
            </div>

            <!-- Password -->
            <div class="form-group">
              <label>Password</label>
              <input type="password"
                     class="form-control"
                     name="password"
                     placeholder="Enter password"
                     required>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
              <label>Qualification</label>
              <input type="qualification"
                     class="form-control"
                     name="qualification"
                     placeholder="Enter Qualification"
                     required>
            </div>

            <!-- Button -->
            <button type="submit"
                    class="btn btn-custom btn-block">
              Register
            </button>

          </form>

          <div class="text-center mt-3">
            <small>Already have an account?
              <a href="login.jsp">Login</a>
            </small>
          </div>

        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>