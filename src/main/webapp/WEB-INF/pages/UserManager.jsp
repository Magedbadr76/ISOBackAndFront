<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
    
    <%@page session="true"%>
    <% response.setCharacterEncoding("UTF-8");%>

    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Task Manager</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">
    <!-- Font Awesome CSS-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="resources/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="resources/img/favicon.ico">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/js/mdb.min.js"></script>
    
  </head>
<body>
<jsp:include page="NavBar.jsp">
         <jsp:param name="param1" value="Userli"/>
     </jsp:include>
<div class="page-content d-flex align-items-stretch"> 
   <jsp:include page="SideNave.jsp">
         <jsp:param name="param1" value="Userli"/>
     </jsp:include>
<div class="content-inner">


<div class="card mb-4 wow fadeIn" style="visibility: visible; animation-name: fadeIn;">

                <!--Card content-->
                <div class="card-body d-sm-flex justify-content-between">

                    <h4 class="mb-2 mb-sm-0 pt-1">
                        <a href="allUsers">User Manager</a>
                        
                    </h4>

                    <form class="d-flex justify-content-center">
                        <!-- Default input -->
                        <input type="search" placeholder="Type your query" aria-label="Search" class="form-control">
                        <button class="btn btn-primary btn-sm my-0 p waves-effect waves-light" type="submit">
                            <i class="fa fa-search"></i>
                        </button>

                    </form>

                </div>


            </div>
         
<section class="vh-100" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-12 col-xl-10">

        <div class="card">
          <div class="card-header p-3">
            <h5 class="mb-0"><i class="fa fa-tasks me-2"></i>User List</h5>
          </div>
          <div class="card-body" data-mdb-perfect-scrollbar="true" style="position: relative;overflow-y: auto;max-height: 400px;">

            <table class="table mb-0">
              <thead>
                <tr>
                <th scope="col">Serial</th>
                  <th scope="col">User Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">Phone</th>
                  <th scope="col">User Type</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="User" items="${listUsers}">
              
                <tr class="fw-normal">
                   <td class="align-middle">
                    <span >${User.uSER_ID}</span >
                  </td>
				  <td class="align-middle">
                    <span >${User.uSER_NAME}</span >
                  </td>
				  <td class="align-middle">
                    <span >${User.uSER_EMAIL}</span >
                  </td>
				  <td class="align-middle">
                    <span >${User.uSER_TEL}</span >
                  </td>
                  <td class="align-middle">
                    <span >${User.uSER_TYPE}</span >
                  </td>
				  
                  <td class="align-middle">
                    <a href="deleteUser?id=${User.uSER_ID}" data-mdb-toggle="tooltip" title="delete"><i class="fa fa-times text-danger me-3"></i></a>
                    <a href="editUser?id=${User.uSER_ID}" data-mdb-toggle="tooltip" title="Edit"><i class="fa fa-edit text-warning"></i></a>
                  </td>
                </tr>
                </c:forEach>
            
              </tbody>
            </table>

          </div>
          <div class="card-footer text-end p-3">
            <a href="newUser"class="btn btn-primary">Add User</a>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
            </div>
            </div>

</body>
 <script type="text/javascript">
        // Animations initialization
        new WOW().init();
    </script>
    <script>
        // Line
      
    </script>
</html>