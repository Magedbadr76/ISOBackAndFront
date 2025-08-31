<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
    
    <%@page session="true"%>
    <% response.setCharacterEncoding("UTF-8");%>
    
<!DOCTYPE html>
<html>
<head>
<style>
nav.side-navbar {
  background: #fff;
  min-width: 250px;
  max-width: 250px;
  color: #686a76;
  -webkit-box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
  box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
  z-index: 9;
  /*==== Sidebar Header ====*/
  /*==== Sidebar Menu ====*/
  /*==== Shrinked Sidebar ====*/
}

nav.side-navbar a {
  color: inherit;
  position: relative;
  font-size: 0.9em;
}

nav.side-navbar a[data-toggle="collapse"]::before {
  content: '\f104';
  display: inline-block;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  font-family: 'FontAwesome';
  position: absolute;
  top: 50%;
  right: 20px;
}

nav.side-navbar a[aria-expanded="true"] {
  background: #EEF5F9;
}

nav.side-navbar a[aria-expanded="true"]::before {
  content: '\f107';
}

nav.side-navbar a i {
  font-size: 1.2em;
  margin-right: 10px;
  -webkit-transition: none;
  transition: none;
}

nav.side-navbar .sidebar-header {
  padding: 30px 15px;
}

nav.side-navbar .avatar {
  width: 55px;
  height: 55px;
}

nav.side-navbar .title {
  margin-left: 10px;
}

nav.side-navbar .title h1 {
  color: #333;
}

nav.side-navbar .title p {
  font-size: 0.9em;
  font-weight: 200;
  margin-bottom: 0;
  color: #aaa;
}

nav.side-navbar span.heading {
  text-transform: uppercase;
  font-weight: 400;
  margin-left: 20px;
  color: #ccc;
  font-size: 0.8em;
}

nav.side-navbar ul {
  padding: 15px 0;
}

nav.side-navbar ul li {
  /* submenu item active */
}

nav.side-navbar ul li a {
  padding: 10px 15px;
  text-decoration: none;
  display: block;
  font-weight: 300;
  border-left: 4px solid transparent;
}

nav.side-navbar ul li a:hover {
  background: #796AEE;
  border-left: 4px solid #3b25e6;
  color: #fff;
}

nav.side-navbar ul li li a {
  padding-left: 50px;
  background: #EEF5F9;
}

nav.side-navbar ul li.active > a {
  background: #148ab5 !important;
  color: #fff;
  border-left: 4px solid #3b25e6;
}

nav.side-navbar ul li.active > a:hover {
  background: #148ab5 !important;
}

nav.side-navbar ul li li.active > a {
  background: #148ab5 !important;
}

nav.side-navbar ul li ul {
  padding: 0;
}

nav.side-navbar.shrinked {
  min-width: 90px;
  max-width: 90px;
  text-align: center;
}

nav.side-navbar.shrinked span.heading {
  margin: 0;
}

nav.side-navbar.shrinked ul li a {
  padding: 15px 2px;
  border: none;
  font-size: 0.8em;
  color: #aaa;
  -webkit-transition: color 0.3s, background 0.3s;
  transition: color 0.3s, background 0.3s;
}

nav.side-navbar.shrinked ul li a[data-toggle="collapse"]::before {
  content: '\f107';
  -webkit-transform: translateX(50%);
  transform: translateX(50%);
  position: absolute;
  top: auto;
  right: 50%;
  bottom: 0;
  left: auto;
}

nav.side-navbar.shrinked ul li a[data-toggle="collapse"][aria-expanded="true"]::before {
  content: '\f106';
}

nav.side-navbar.shrinked ul li a:hover {
  color: #fff;
  border: none;
}

nav.side-navbar.shrinked ul li a:hover i {
  color: #fff;
}

nav.side-navbar.shrinked ul li a i {
  margin-right: 0;
  margin-bottom: 2px;
  display: block;
  font-size: 1rem;
  color: #333;
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
}

nav.side-navbar.shrinked ul li.active > a {
  color: #fff;
}

nav.side-navbar.shrinked ul li.active > a i {
  color: #fff;
}

nav.side-navbar.shrinked .sidebar-header .title {
  display: none;
}

/* SIDEBAR MEDIAQUERIES ----------------------------------- */
@media (max-width: 1199px) {
  nav.side-navbar {
    margin-left: 90px;
    min-width: 90px;
    max-width: 90px;
    text-align: center;
    overflow: hidden;
  }
  nav.side-navbar span.heading {
    margin: 0;
  }
  nav.side-navbar ul li a {
    padding: 15px 2px;
    border: none;
    font-size: 0.8em;
    color: #aaa;
    -webkit-transition: color 0.3s, background 0.3s;
    transition: color 0.3s, background 0.3s;
  }
  nav.side-navbar ul li a[data-toggle="collapse"]::before {
    content: '\f107';
    -webkit-transform: translateX(50%);
    transform: translateX(50%);
    position: absolute;
    top: auto;
    right: 50%;
    bottom: 0;
    left: auto;
  }
  nav.side-navbar ul li a[data-toggle="collapse"][aria-expanded="true"]::before {
    content: '\f106';
  }
  nav.side-navbar ul li a:hover {
    color: #fff;
    border: none;
  }
  nav.side-navbar ul li a:hover i {
    color: #fff;
  }
  nav.side-navbar ul li a i {
    margin-right: 0;
    margin-bottom: 5px;
    display: block;
    font-size: 1.6em;
    color: #333;
    -webkit-transition: color 0.3s;
    transition: color 0.3s;
  }
  nav.side-navbar ul li.active > a {
    color: #fff;
  }
  nav.side-navbar ul li.active > a i {
    color: #fff;
  }
  nav.side-navbar .sidebar-header .title {
    display: none;
  }
  nav.side-navbar.shrinked {
    margin-left: 0;
  }
  .content-inner {
    width: 100%;
  }
  .content-inner.active {
    width: calc(100% - 90px);
  }
}
.content-inner {
  position: relative;
  width: calc(100% - 250px);
  min-height: calc(100vh - 70px);
  padding-bottom: 60px;
}

.content-inner.active {
  width: calc(100% - 90px);
}

</style>                
</head>
<body dir="rtl">
  <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><img src="resources/img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
            <div class="title">
              <h1 class="h4"> ${pageContext.request.userPrincipal.name}</h1>
              <p>Administrator</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus-->
          <span class="heading">Main</span>
           <ul class="list-unstyled">
                    <li id="Dashboardli"><a href="Dashboard"> <i class="fa fa-area-chart"></i><fmt:message key="label.Dashboard" /></a></li>
                      <sec:authorize access="hasRole('ROLE_ADMIN')">
					<li id="Userli"><a href="allUsers"> <i class="fa fa-user"></i><fmt:message key="label.userManagement" /></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li id="FileLi"><a href="filemanager"> <i class="fa fa-file"></i><fmt:message key="label.fileManagement" /></a></li>
					</sec:authorize>
		
					<li id="ObjectiveManagerli"><a href="#ObjectiveDropdown" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-line-chart" aria-hidden="true"></i><fmt:message key="label.ObjectiveManager" /></a>
                      <ul id="ObjectiveDropdown" class="collapse list-unstyled ">
                        <li><li ><a href="ObjectiveManagerPlanning"><i class="fa fa-tasks"></i><fmt:message key="label.Planning" /></a></li>
                        <li><a href="#"><i class="fa fa-bar-chart"></i><fmt:message key="label.Reports" /></a></li>
                      </ul>
                    </li>
					<!--  <li><a href="#ActionDropdown" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-list"></i><fmt:message key="label.ActionManager" /></a>
                      <ul id="ActionDropdown" class="collapse list-unstyled ">
                        <li><a href="AuditPlan"><i class="fa fa-tasks"></i><fmt:message key="label.Planning" /></a></li>
                        <li><a href="#"><i class="fa fa-bar-chart"></i><fmt:message key="label.Reports" /></a></li>
                      </ul>
                    </li>-->
					<li><a href="#InternalDropdown" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-clipboard"></i></i><fmt:message key="label.InternalAudit" /></a>
                      <ul id="InternalDropdown" class="collapse list-unstyled ">
                        <li id="AuditAdminli"><a href="allSchedules"><i class="fa fa-tasks"></i><fmt:message key="label.Planning" /></a></li>
                        <li  id="AuditAdminli2"><a href="allSchedulesCal"><i class="fa fa-calendar"></i><fmt:message key="label.internalAuditCalendar" /></a></li>
                        <li id="AuditAdminli3"><a href="allAcceptedSchedules"><i class="fa fa-bar-chart"></i><fmt:message key="label.Reports" /></a></li>
                      </ul>
                    </li>
					<li><a href="#MeetingDropdown" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-briefcase" aria-hidden="true"></i><fmt:message key="label.ManagementReview" /></a>
                      <ul id="MeetingDropdown" class="collapse list-unstyled ">
                        <li><a href="#"><i class="fa fa-handshake-o" aria-hidden="true"></i><fmt:message key="label.Planning" /></a></li>
                        <li><a href="#"><i class="fa fa-bar-chart"></i><fmt:message key="label.PreviousMeetingsreports" /></a></li>
                      </ul>
                    </li>
					<li><a href="#CRSDropdown" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-list-alt" aria-hidden="true"></i><fmt:message key="label.Non-conformitiesActions" /></a>
                      <ul id="CRSDropdown" class="collapse list-unstyled ">
                        <li><a href="allNCRS"><i class="fa fa-history"></i><fmt:message key="label.CARsLog" /></a></li>
                        <li><a href="#"><i class="fa fa-bar-chart"></i><fmt:message key="label.Reports" />Reports</a></li>
                      </ul>
                    </li>
					 <!-- Sidebar Navidation Menus
                     <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('APP_USER')">
                    <li id="AuditAdminli"><a href="allSchedules"> <i class="fa fa-history"></i>Audits</a></li>
                    </sec:authorize>
                    <li id="NCRLi"><a href="NCR"> <i class="fa fa-ticket"></i>NCR </a></li>
                    <li id="AuditPlanli"><a href="AuditPlan"> <i class="fa fa-ticket"></i>Audit Plan </a></li>
                    <li id="InternalAuditli"><a href="InternalAudit"> <i class="fa fa-ticket"></i>Internal Audit </a></li>
                    <li id="Etlli"><a href="ETL"> <i class="fa fa-file-excel-o "></i>ETL Data </a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li id="Reportsli"><a href="Reporting"> <i class="fa fa-bar-chart"></i>Reports </a></li>
                  	</sec:authorize>
-->
          </ul>
        </nav>           
</body>
<script>
$(${param.param1} ).addClass( "active" );
</script>
</html>