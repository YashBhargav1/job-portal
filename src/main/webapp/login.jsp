<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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

<div class="container">
  <div class="row justify-content-center mt-5">
    <div class="col-md-5">

      <div class="card shadow">
        <div class="card-body">
          
          <h4 class="text-center mb-4">Login</h4>
          <c:if test="${not empty succMsg }"><div class="alert alert-success" role="alert">
  ${ succMsg }
</div>
<c:remove var ="succMsg"/>
</c:if>
          

          <form action="login" method="post">
            
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

            <!-- Remember Me -->
            <div class="form-group form-check">
              <input type="checkbox" 
                     class="form-check-input" 
                     id="remember">
              <label class="form-check-label" for="remember">
                Remember Me
              </label>
            </div>

            <!-- Button -->
            <button type="submit" class="btn btn-custom btn-block">
              Login
            </button>

          </form>

          <div class="text-center mt-3">
            <small>Don't have an account? 
              <a href="signup.jsp">Signup</a>
            </small>
          </div>

        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>