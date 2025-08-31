<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="label.NewAuditSchedule" /></title>

<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"/>
<link href="resources/css/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.dataTables.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css"/>
<link rel="stylesheet" href="resources/css/BootIcons.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/js/mdb.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>

<script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
<script src="https://cdn.datatables.net/colreorder/1.5.1/js/dataTables.colReorder.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet" href="resources/AdvancedQuery/css/query-builder.default.min.css">
<script type="text/javascript" src="resources/AdvancedQuery/js/doT.min.js"></script>
<script type="text/javascript" src="resources/AdvancedQuery/js/jQuery.extendext.min.js"></script>
<script type="text/javascript" src="resources/AdvancedQuery/js/moment.min.js"></script>
<script type="text/javascript" src="resources/AdvancedQuery/js/query-builder.min.js"></script>
<script src="https://querybuilder.js.org/node_modules/sql-parser-mistic/browser/sql-parser.min.js"></script>

  
</head>
<style>
.stepwizard-step p {
    margin-top: 10px;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 50%;
    position: relative;
}
.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
}
.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}

</style>
<script>
$(document).ready(function () {

	  var navListItems = $('div.setup-panel div a'),
	          allWells = $('.setup-content'),
	          allNextBtn = $('.nextBtn');

	  allWells.hide();

	  navListItems.click(function (e) {
	      e.preventDefault();
	      var $target = $($(this).attr('href')),
	              $item = $(this);

	      if (!$item.hasClass('disabled')) {
	          navListItems.removeClass('btn-primary').addClass('btn-default');
	          $item.addClass('btn-primary');
	          allWells.hide();
	          $target.show();
	          $target.find('input:eq(0)').focus();
	      }
	  });

	  allNextBtn.click(function(){
	      var curStep = $(this).closest(".setup-content"),
	          curStepBtn = curStep.attr("id"),
	          nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
	          curInputs = curStep.find("input[type='text'],input[type='url']"),
	          isValid = true;

	      $(".form-group").removeClass("has-error");
	      for(var i=0; i<curInputs.length; i++){
	          if (!curInputs[i].validity.valid){
	              isValid = false;
	              $(curInputs[i]).closest(".form-group").addClass("has-error");
	          }
	      }

	      if (isValid)
	          nextStepWizard.removeAttr('disabled').trigger('click');
	  });

	  $('div.setup-panel div a.btn-primary').trigger('click');
	});
</script>
<body>
<jsp:include page="NavBar.jsp">
         <jsp:param name="param1" value="ObjectiveManagerli"/>
     </jsp:include>
     <div class="page-content d-flex align-items-stretch"> 
       <jsp:include page="SideNave.jsp">
         <jsp:param name="param1" value="ObjectiveManagerli"/>
     </jsp:include>
<div class="content-inner">
<div class="card mb-4 wow fadeIn" style="visibility: visible; animation-name: fadeIn;">

                <!--Card content-->
                <div class="card-body d-sm-flex justify-content-between">

                      <form class="d-flex justify-content-center">
                  
                      <h4 class="mb-2 mb-sm-0 pt-1">
                         <span> <i class="fa fa-calendar"></i> &nbsp <fmt:message key="label.TaskDetail" /></span>
                         
                      </h4>
                    </form>
                   

                   

                </div>

            </div>
          <div class="container">



  
  <form:form action="SaveTask" method="post" modelAttribute="Task" id="saveTask">
    <form:hidden path="id"/>
        <form:hidden path="created_by"/>
    
      <div class="col-xs-6 col-md-offset-3">
        <div class="col-md-6">
          
  
            <div class="form-group">
            <label class="control-label"><fmt:message key="label.TaskName" />  </label>
            
            
             <form:input  class="form-control " path="task_name" /> 
            </div>
			<div class="form-group">
            <label class="control-label"><fmt:message key="label.TaskDesc" />  </label>
            
            
             <form:textarea  class="form-control " path="task_desc" /> 
            </div>
 
                     <div class="form-group">
                  <label class="control-label"><fmt:message key="label.TaskExpectedEnd" />  </label>
       
             <form:input type="Date"  class="form-control " path="task_expected_end" /> 
            </div>
            
               <div class="form-group">
            <label class="control-label"><fmt:message key="label.task_Assigned" />  </label>
            
             <form:select  class="form-control " path="task_assigned_user" items="${listUsers}" 
             itemValue="uSER_NAME" itemLabel="uSER_NAME" /> 
            
            </div>
            
               <div class="form-group">
            <label class="control-label"><fmt:message key="label.taskpiriority" /> </label>
            
             <form:select  class="form-control " path="task_piriority"  value="${Task.task_piriority}">
                        
              <option value="High" <c:if test="${Task.task_piriority == 'High'}"> selected </c:if>>High</option>
               <option value="Medium" <c:if test="${Task.task_piriority == 'Medium'}"> selected </c:if>>Medium</option>
                <option value="Low" <c:if test="${Task.task_piriority == 'Low'}"> selected </c:if>>Low</option>
             </form:select> 
            
            </div>
        <button type="submit" class="btn btn-primary">Save</button>
    
  </form:form>
  

  

</div>
  <div class="card" <c:if test="${Task.id == null}"> hidden </c:if>>
    <div class="card-header text-white bg-info">
    <a class="text-white" data-toggle="collapse" href="#Comments" aria-expanded="false" aria-controls="Comments">
    <fmt:message key="label.Comments" />
  </a>
    </div>
    <div class="card-body" id="Comments">
   
  <div class="container my-5 py-5">
    <div class="row d-flex justify-content-center">
      <div class="col-md-12 col-lg-10 col-xl-8">
       <c:forEach var="comment" items="${lstcomments}">
       <div class="card">
          <div class="card-body">
            <div class="d-flex flex-start align-items-center">
              <img
                class="rounded-circle shadow-1-strong me-3"
                src="resources/img/avatar-1.jpg"
                alt="avatar"
                width="60"
                height="60"
              />
              <div>
                <h6 class="fw-bold text-primary mb-1">${comment.commented_by}</h6>
                <p class="text-muted small mb-0">
                 ${comment.COMMENT_TIME}
                </p>
              </div>
            </div>

            <p class="mt-3 mb-4 pb-2">
               ${comment.COMMENT_TXT}
            </p>

                  </div>      
                  </div>            
      </c:forEach>
        
                  
          <div class="card-footer py-3 border-0" style="background-color: #f8f9fa;">
            <div class="d-flex flex-start w-100">
              <img
                class="rounded-circle shadow-1-strong me-3"
                src="resources/img/avatar-1.jpg"
                alt="avatar"
                width="40"
                height="40"
              />
                <form:form action="addComment" method="post" modelAttribute="NewComment" id="saveCommet" style="width:100%;">
              
              <div class="form-outline w-100">
                 
                <form:textarea
                  class="form-control"
                  id="textAreaExample"
                  rows="4"
                  style="background: #fff;"
                  path="COMMENT_TXT"
                ></form:textarea>
                <form:input type="hidden"  class="form-control " path="COMMENT_TIME" value="<%= (new java.util.Date()).toLocaleString()%>" /> 
                <form:input type="hidden"  class="form-control " path="TICKET_ID" /> 
                <form:input type="hidden"  class="form-control " path="commented_by" /> 
              </div>
            </div>
            <div class="float-end mt-2 pt-1">
              <button type="submit" class="btn btn-primary btn-sm">Post comment</button>
            </div>
              </form:form>
            
          </div>
        </div>
      </div>
    </div>
  </div>
    </div>
  </div>	
		

	</div>
	</div>
	
	
	
</body>
</html>