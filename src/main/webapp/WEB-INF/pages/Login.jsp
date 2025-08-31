<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>QM Connect (ISO-9000)</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="resources/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="resources/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="resources/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="resources/img/favicon.ico">
  </head>
<body>

</head>
<body onload='document.loginForm.username.focus();'>

 <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
          <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
				  <img src="resources/img/QMS_White.png" style="max-width:100%"/>
                    
                  </div>
                 
                </div>
              </div>
            </div>
        <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">

		<c:if test="${not empty error}">
		<div class="alert alert-danger" role="alert">
  <strong>Oh snap!</strong>${error}
</div>
		
		</c:if>
		<c:if test="${not empty msg}">
		<div class="alert alert-info" role="alert">
             <strong>Heads up!</strong> ${msg}
          </div>
		</c:if>

		<form name='loginForm'
			action="<c:url value='/j_spring_security_check' />" method='POST' class="form-validate">
                        <div class="form-group">
                          <img src="resources/img/logo_ar.svg" style="max-width:100%"/>
                    </div>
			                    
					<div class="form-group">
                      <input id="login-username" type="text" name='username' required data-msg="Please enter your username" class="input-material">
                      <label for="login-username" class="label-material">User Name</label>
                    </div>
			
					<div class="form-group">
                      <input id="login-password" type="password" name="password" required data-msg="Please enter your password" class="input-material">
                      <label for="login-password" class="label-material">Password</label>
                    </div>
				
					<input name="submit" type="submit"
						value="submit" class="btn btn-primary"/>
				
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
 <!-- JavaScript files-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="resources/vendor/chart.js/Chart.min.js"></script>
    <script src="resources/vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="resources/js/front.js"></script>
</body>
</html>