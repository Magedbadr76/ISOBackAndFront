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
    <title>Meeting Manager</title>
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
                        <a href="allUsers">Meeting Manager</a>
                        
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
<div class="calendar" id="calendar"></div>


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
    const events = [
    	  {
    	    summary: 'JS Conference',
    	    start: {
    	      date: Calendar.dayjs().format('DD/MM/YYYY'),
    	    },
    	    end: {
    	      date: Calendar.dayjs().format('DD/MM/YYYY'),
    	    },
    	    color: {
    	      background: '#cfe0fc',
    	      foreground: '#0a47a9',
    	    },
    	  },
    	  {
    	    summary: 'Vue Meetup',
    	    start: {
    	      date: Calendar.dayjs().add(1, 'day').format('DD/MM/YYYY'),
    	    },
    	    end: {
    	      date: Calendar.dayjs().add(5, 'day').format('DD/MM/YYYY'),
    	    },
    	    color: {
    	      background: '#ebcdfe',
    	      foreground: '#6e02b1',
    	    },
    	  },
    	  {
    	    summary: 'Angular Meetup',
    	    description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
    	    start: {
    	      date: Calendar.dayjs().subtract(3, 'day').format('DD/MM/YYYY'),
    	      dateTime: Calendar.dayjs().subtract(3, 'day').format('DD/MM/YYYY') + ' 10:00',
    	    },
    	    end: {
    	      date: Calendar.dayjs().add(3, 'day').format('DD/MM/YYYY'),
    	      dateTime: Calendar.dayjs().add(3, 'day').format('DD/MM/YYYY') + ' 14:00',
    	    },
    	    color: {
    	      background: '#c7f5d9',
    	      foreground: '#0b4121',
    	    },
    	  },
    	  {
    	    summary: 'React Meetup',
    	    start: {
    	      date: Calendar.dayjs().add(5, 'day').format('DD/MM/YYYY'),
    	    },
    	    end: {
    	      date: Calendar.dayjs().add(8, 'day').format('DD/MM/YYYY'),
    	    },
    	    color: {
    	      background: '#fdd8de',
    	      foreground: '#790619',
    	    },
    	  },
    	  {
    	    summary: 'Meeting',
    	    start: {
    	      date: Calendar.dayjs().add(1, 'day').format('DD/MM/YYYY'),
    	      dateTime: Calendar.dayjs().add(1, 'day').format('DD/MM/YYYY') + ' 8:00',
    	    },
    	    end: {
    	      date: Calendar.dayjs().add(1, 'day').format('DD/MM/YYYY'),
    	      dateTime: Calendar.dayjs().add(1, 'day').format('DD/MM/YYYY') + ' 12:00',
    	    },
    	    color: {
    	      background: '#cfe0fc',
    	      foreground: '#0a47a9',
    	    },
    	  },
    	  {
    	    summary: 'Call',
    	    start: {
    	      date: Calendar.dayjs().add(2, 'day').format('DD/MM/YYYY'),
    	      dateTime: Calendar.dayjs().add(2, 'day').format('DD/MM/YYYY') + ' 11:00',
    	    },
    	    end: {
    	      date: Calendar.dayjs().add(2, 'day').format('DD/MM/YYYY'),
    	      dateTime: Calendar.dayjs().add(2, 'day').format('DD/MM/YYYY') + ' 14:00',
    	    },
    	    color: {
    	      background: '#292929',
    	      foreground: '#f5f5f5',
    	    },
    	  }
    	];

    	const calendarElement = document.getElementById('calendar');
    	const calendarInstance = Calendar.getInstance(calendarElement);
    	calendarInstance.addEvents(events);
    </script>
    
    <script>
        // Line
      
    </script>
</html>