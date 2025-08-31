<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
   <%@page session="true"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Schedules Calendar</title>
  <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="resources/vendor/calendar/calendar-gc.min.css">
  <style>
    html,
    body {
      margin: 0;
      overflow-x: hidden;
    }
    body { background: #fafafa; }
  </style>
</head>
<body>
<jsp:include page="NavBar.jsp">
         <jsp:param name="param1" value="Dashboardli"/>
     </jsp:include>
     <div class="page-content d-flex align-items-stretch"> 
       <jsp:include page="SideNave.jsp">
         <jsp:param name="param1" value="AuditAdminli2"/>
     </jsp:include>
<div class="content-inner">


<div class="card mb-4 wow fadeIn" style="visibility: visible; animation-name: fadeIn;">
 <div class="card-body d-sm-flex justify-content-between">

                    <h4 class="mb-2 mb-sm-0 pt-1">
                         <span>Schedule Calendar</span>
                    </h4>
 <div id="calendar" style="padding: 1rem;"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/vendor/calendar/calendar-gc.min.js"></script>
<script>
  $(function (e) {
    var calendar = $("#calendar").calendarGC({
      dayBegin: 0,
      prevIcon: '&#x3c;',
      nextIcon: '&#x3e;',
      onPrevMonth: function (e) {
        console.log("prev");
        console.log(e)
      },
      onNextMonth: function (e) {
        console.log("next");
        console.log(e)
      },
      events: [
        {
          date: new Date("2022-02-07"),
          eventName: "Holiday",
          className: "badge bg-danger",
          onclick(e, data) {
            console.log(data);
          },
          dateColor: "red"
        },
        {
          date: new Date("2022-02-07"),
          eventName: "Holiday with wife",
          className: "badge bg-danger",
          onclick(e, data) {
            console.log(data);
          },
          dateColor: "red"
        },
        {
          date: new Date("2022-02-08"),
          eventName: "Working day",
          className: "badge bg-success",
          onclick(e, data) {
            console.log(data);
          },
          dateColor: "green"
        }
      ],
      onclickDate: function (e, data) {
        console.log(e, data);
      }
    });
  })
</script>
</html>
