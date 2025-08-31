<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
    
    <%@page session="true"%>
    <% response.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body id="FullBody"  >
<style>
nav.navbar .menu-btn {
  margin-right: 20px;
  font-size: 1.2em;
  -webkit-transition: all 0.7s;
  transition: all 0.7s;
}

nav.navbar .menu-btn span {
  width: 20px;
  height: 2px;
  background: #fff;
  display: block;
  margin: 4px auto 0;
  -webkit-transition: all 0.3s cubic-bezier(0.81, -0.33, 0.345, 1.375);
  transition: all 0.3s cubic-bezier(0.81, -0.33, 0.345, 1.375);
}

nav.navbar .menu-btn span:nth-of-type(2) {
  position: relative;
  width: 35px;
  -webkit-transform: rotateY(180deg);
  transform: rotateY(180deg);
}

nav.navbar .menu-btn span:nth-of-type(2)::before, nav.navbar .menu-btn span:nth-of-type(2)::after {
  content: '';
  width: 6px;
  height: 2px;
  display: block;
  background: #fff;
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
  position: absolute;
  top: 2px;
  left: 0;
  -webkit-transition: all 0.7s;
  transition: all 0.7s;
}

nav.navbar .menu-btn span:nth-of-type(2)::after {
  -webkit-transform: rotate(145deg);
  transform: rotate(145deg);
  position: absolute;
  top: -2px;
  left: 0;
}

nav.navbar .menu-btn.active span:first-of-type {
  -webkit-transform: translateY(12px);
  transform: translateY(12px);
}

nav.navbar .menu-btn.active span:nth-of-type(2) {
  -webkit-transform: none;
  transform: none;
}

nav.navbar .menu-btn.active span:last-of-type {
  -webkit-transform: translateY(-12px);
  transform: translateY(-12px);
}

nav.navbar .menu-btn {
    margin-right: 20px;
    font-size: 1.2em;
    -webkit-transition: all 0.7s;
    transition: all 0.7s;
  }
  nav.navbar .menu-btn span:first-of-type {
    -webkit-transform: translateY(12px);
    transform: translateY(12px);
  }
  nav.navbar .menu-btn span:nth-of-type(2) {
    -webkit-transform: none;
    transform: none;
  }
  nav.navbar .menu-btn span:nth-of-type(2)::before, nav.navbar .menu-btn span:nth-of-type(2)::after {
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
  }
  nav.navbar .menu-btn span:nth-of-type(2)::after {
    -webkit-transform: rotate(145deg);
    transform: rotate(145deg);
    position: absolute;
    top: -2px;
    left: 0;
  }
  nav.navbar .menu-btn span:last-of-type {
    -webkit-transform: translateY(-12px);
    transform: translateY(-12px);
  }
  nav.navbar .menu-btn.active span:first-of-type {
    -webkit-transform: none;
    transform: none;
  }
  nav.navbar .menu-btn.active span:nth-of-type(2) {
    -webkit-transform: rotateY(180deg);
    transform: rotateY(180deg);
  }
  nav.navbar .menu-btn.active span:last-of-type {
    -webkit-transform: none;
    transform: none;
  }
}

</style>
<script>
function formSubmit() {
	console.log("asdasd");
			document.getElementById("logoutForm").submit();
		}
		</script>

	<form action="j_spring_security_logout" method="post" id="logoutForm">
	
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
<nav class="navbar navbar-expand-sm navbar-dark secondary-color">
                  <a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                  <div class="brand-text d-none d-lg-inline-block"><span>QMS </span><strong>Connect</strong></div>
                  <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>QMS</strong></div>
				  </a>
                
                 <a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
				   
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                           
                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                       
                    </ul>

                    <!-- Right -->
                    <ul class="navbar-nav nav-flex-icons">
                       
                      <li class="nav-item dropdown"> 
                      <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red badge-corner">12</span></a>
                  <div aria-labelledby="notifications" class="dropdown-menu dropdown-primary" >
                    <a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-envelope bg-green"></i>You have 6 new messages </div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a>
                    <a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a>
                    <a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-upload bg-orange"></i>Server Rebooted</div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a>
                   <a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
                          <div class="notification-time"><small>10 minutes ago</small></div>
                        </div></a>
                    <a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>view all notifications                                            </strong></a>
                  </div>
                </li>
                   
              <li class="nav-item dropdown">
        <a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle">
        <img src="resources/img/flags/16/GB.png" id="CurrentLang" alt="English">
        <span class="d-none d-sm-inline-block" id="CurrentLangName">English</span>
        </a>
        <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
          <a rel="nofollow" href="javascript:changeLanguage('ar','resources/img/flags/16/SA.png','العربية','rtl')" class="dropdown-item"> <img src="resources/img/flags/16/SA.png" alt="العربية" class="mr-2">العربية</a>
           <a rel="nofollow"href="javascript:changeLanguage('en','resources/img/flags/16/GB.png','English','ltr')" class="dropdown-item"> <img src="resources/img/flags/16/GB.png" alt="English" class="mr-2">English</a>
      
        </div>
      </li>

                        <li class="nav-item">
                        <a href="javascript:formSubmit()" class="nav-link logout">
                         <span class="d-none d-sm-inline"><fmt:message key="label.logout" /></span>
                         <i class="fa fa-sign-out"></i></a></li>
                    </ul>

                </div>
                </nav>
                                
 <script>
 
 function loadDefaultLastLang(){
	 
	 var NewSrc=localStorage.getItem("NewSrc");
	 var NewLangName=localStorage.getItem("NewLangName");
	 var NewDir=localStorage.getItem("NewDir");

	 if(NewSrc!=null){
	 document.getElementById("CurrentLang").src = NewSrc;
	 document.getElementById("CurrentLangName").innerHTML = NewLangName;
	 document.getElementById("FullBody").dir=NewDir;

	 }
	 

	 
 }
 
 loadDefaultLastLang();
 
 
 $('#toggle-btn').on('click', function (e) {
     e.preventDefault();
     $(this).toggleClass('active');

     $('.side-navbar').toggleClass('shrinked');
     $('.content-inner').toggleClass('active');
     $(document).trigger('sidebarChanged');

     if ($(window).outerWidth() > 1183) {
         if ($('#toggle-btn').hasClass('active')) {
             $('.navbar-header .brand-small').hide();
             $('.navbar-header .brand-big').show();
         } else {
             $('.navbar-header .brand-small').show();
             $('.navbar-header .brand-big').hide();
         }
     }

     if ($(window).outerWidth() < 1183) {
         $('.navbar-header .brand-small').show();
     }
 });
 
 function  changeLanguage(NewLang,NewSrc,NewLangName,NewDir){
	 
	 document.getElementById("CurrentLang").src = NewSrc;
	 document.getElementById("CurrentLangName").innerHTML = NewLangName;
	 document.getElementById("FullBody").dir=NewDir;

	 localStorage.setItem('NewLang', NewLang);
	 localStorage.setItem('NewSrc', NewSrc);
	 localStorage.setItem('NewLangName', NewLangName);
	 localStorage.setItem('NewDir', NewDir);
	 
	 document.cookie = "locale="+NewLang;
	 
	 location.reload();


 }


 </script>
</body>
</html>