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
<html lang="en" data-ng-app="FileManagerApp">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Task Manager</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    
       <script src="resources/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="resources/node_modules/angular/angular.min.js"></script>
    <script src="resources/node_modules/angular-translate/dist/angular-translate.min.js"></script>
    <script src="resources/node_modules/ng-file-upload/dist/ng-file-upload.min.js"></script>
        <script src="resources/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
   
    <link rel="stylesheet" href="resources/node_modules/bootswatch/paper/bootstrap.min.css" />
    <link href="resources/dist/angular-filemanager.min.css" rel="stylesheet">
    <script src="resources/dist/angular-filemanager.min.js"></script>
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
 
    <script src="resources/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- /Comment if you need to use raw source code -->

  <script type="text/javascript">
    //example to override angular-filemanager default config
    angular.module('FileManagerApp').config(['fileManagerConfigProvider', function (config) {
      var defaults = config.$get();
      config.set({
        appName: 'angular-filemanager',
        pickCallback: function(item) {
          var msg = 'Picked %s "%s" for external use'
            .replace('%s', item.type)
            .replace('%s', item.fullPath());
          window.alert(msg);
        },

        allowedActions: angular.extend(defaults.allowedActions, {
          pickFiles: false,
          pickFolders: false,
        }),
      });
    }]);
  </script> 
  </head>
<body class="ng-cloak" style="font-size:1.5rem !important;">
<jsp:include page="NavBar.jsp">
         <jsp:param name="param1" value="FileLi"/>
     </jsp:include>
<div class="page-content d-flex align-items-stretch"> 
   <jsp:include page="SideNave.jsp">
         <jsp:param name="param1" value="FileLi"/>
     </jsp:include>
<div class="content-inner">
         

  <angular-filemanager></angular-filemanager>

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