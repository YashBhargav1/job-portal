<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Job Portal</a>

    <button class="navbar-toggler" type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="home.jsp"><i class="fa-solid fa-house"></i>Home</a>
        </li>
        
        <c:if test = "${userobj.role eq 'admin' }">
        <li class="nav-item">
          <a class="nav-link" href="postjob.jsp"><i class="fa-solid fa-circle-plus"></i>Post Job</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewjob.jsp"><i class="fa-solid fa-eye"></i>View Job</a>
        </li>
         </c:if>
      </ul>
     

      <form class="form-inline">
      <c:if test="${userobj.role eq 'admin' }">
      <a href="#" class="btn btn-light mr-2"><i class="fa-solid fa-user"></i>Admin</a>
      <a href="logout" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i>Logout</a></c:if>
      
       <c:if test="${userobj.role eq 'user' }">
      <a href="#" class="btn btn-light mr-2" data-toggle="modal" data-target="#exampleModal"><i class="fa-solid fa-user"></i>${userobj.name }</a>
      <a href="logout" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i>Logout</a></c:if>
      
        
        
        <c:if test="${empty userobj }">
      <a href="login.jsp" class="btn btn-light mr-2"><i class="fa-solid fa-right-to-bracket"></i>login</a>
        <a href="signup.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i>Signup</a></c:if>
        
      </form>

    </div>
  </div>
</nav>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>

      <div class="modal-body">
        <div class="card">

          <div class="card-body">

            <div class="text-center text-primary">
              <i class="fas fa-user-circle fa-3x"></i>
            </div>

            <table class="table">
              <tbody>

                <tr>
                  <th scope="row">Name</th>
                  <td>${userobj.name}</td>
                </tr>

                <tr>
                  <th scope="row">Email</th>
                  <td>${userobj.email}</td>
                </tr>

                <tr>
                  <th scope="row">Qualification</th>
                  <td>${userobj.qualification}</td>
                </tr>

              </tbody>
            </table>

          </div>

        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

        <a href="editprofile.jsp" class="btn btn-primary">
          Edit Profile
        </a>

      </div>

    </div>
  </div>
</div>