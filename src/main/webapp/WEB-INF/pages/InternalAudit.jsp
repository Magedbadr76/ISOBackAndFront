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
<title><fmt:message key="label.InternalAudit" /></title>

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
  <script src="https://cdn.jsdelivr.net/npm/html-to-pdfmake/browser.js"></script>

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
  <script>
  
  function EXPORT_TO_PDF(){
	  var ht=document.getElementById("HTMLReport").innerHTML;
    var val = htmlToPdfmake(ht, {
    	  tableAutoSize:true
    });
    var dd = {content:val};
    pdfMake.createPdf(dd).download();
  }
  </script>

<body>
<jsp:include page="NavBar.jsp">
         <jsp:param name="param1" value="Dashboardli"/>
     </jsp:include>
     <div class="page-content d-flex align-items-stretch"> 
       <jsp:include page="SideNave.jsp">
         <jsp:param name="param1" value="InternalAuditli"/>
     </jsp:include>
<div class="content-inner">


<div style="display:none" id="HTMLReport">
<p style="text-align:center"><fmt:message key="label.InternalAuditReport" /></p>



<table border="1" cellpadding="1" cellspacing="1" style="width:500px; border-collapse: collapse;">
	<tbody>
		<tr>
			<td style="background-color:#ffcc99; width:144px"><fmt:message key="label.ReportCreatedBy" /></td>
			<td style="width:344px">${schedule.SCHEDULE_AUDITOR_ID}</td>
		</tr>
		<tr>
			<td style="background-color:#ffcc99; width:144px"><fmt:message key="label.Date" /></td>
			<td style="width:344px">${schedule.SCHEDULE_DATE}</td>
		</tr>
		<tr>
			<td style="background-color:#ffcc99; width:144px"><fmt:message key="label.ProcessName" /></td>
			<td style="width:344px">&nbsp; <fmt:message key="label.InternalAudit" /></td>
		</tr>
		<tr>
			<td style="background-color:#ffcc99; width:144px"><fmt:message key="label.Auditee" /></td>
			<td style="width:344px">${schedule.SCHEDULE_AUDITEE_ID}</td>
		</tr>
		<tr>
			<td style="background-color:#ffcc99; width:144px"><fmt:message key="label.AuditArea" /></td>
			<td style="width:344px">${schedule.SCHEDULE_AUDITAREA_NAME}</td>
		</tr>
	</tbody>
</table>



<p><span style="display:none">&nbsp;</span></p>

<table border="1" cellpadding="1" cellspacing="1" style="width:700px; border-collapse: collapse;">
	<tbody>
	<tr>
			<td style="background-color:#ffcc99; width:700px"><strong>participants</strong></td>
		</tr>
		<tr>
			<td style="width:700px"><br />
			<table border="1" cellpadding="1" cellspacing="1" style="width:700px; border-collapse: collapse;">
			<thead>
             <tr style="width:300px;">
             <th ><strong>Name</strong></th>
             <th><strong>Department</strong></th>
             </tr>
            </thead>
			<tbody>
			  <c:forEach var="Check" items="${Partis.lstParticipants}" varStatus="status">
			  <tr >
             <td>${Check.participant_name}</td>
             <td>${Check.department_name}</td>
             </tr>
			  </c:forEach>
			 
		    <tbody>
			</table>
			&nbsp;</td>
		</tr>
	
		<tr>
			<td style="background-color:#ffcc99; width:700px"><strong>Executive Summary</strong></td>
		</tr>
		<tr>
			<td style="width:700px">
			
			${trans.trans_executive_summery}</td>
		</tr>
		<tr>
			<td style="background-color:#ffcc99; width:700px"><strong>Audit Findings :</strong><span style="display:none">&nbsp;</span><span style="display:none">&nbsp;</span><span style="display:none">&nbsp;</span></td>
		</tr>
		<tr>
			<td style="width:700px">
			${trans.trans_audit_findings}</td>
		</tr>
		<tr>
			<td style="background-color:#ffcc99; width:700px"><strong>Reviewed Records :</strong></td>
		</tr>
		<tr>
			<td style="width:700px">
			
			${trans.trans_reviewed_records}</td>
		</tr>
		<tr>
			<td style="background-color:#ffcc99; width:700px"><strong>Audit CheckList</strong></td>
		</tr>
		<tr>
			<td style="width:700px"><br />
			<table border="1" cellpadding="1" cellspacing="1" style="width:700px; border-collapse: collapse;">
			<thead>
             <tr style="width:300px;">
             <th ><strong>Checkpoint</strong></th>
             <th><strong>Result</strong></th>
             </tr>
            </thead>
			<tbody>
			  <c:forEach var="Check" items="${checkList.lstCheckpoints}" varStatus="status">
			  <tr >
             <td>${Check.QS}</td>
             <td>${Check.RESULT}</td>
             </tr>
			  </c:forEach>
			 
		    <tbody>
			</table>
			&nbsp;</td>
		</tr>
	
		
	</tbody>
</table>

<p>&nbsp;</p>

<p>Internal Auditor Signature</p>

<p>.......................</p>


</div>


<div class="card mb-4 wow fadeIn" style="visibility: visible; animation-name: fadeIn;">

                <!--Card content-->
                <div class="card-body d-sm-flex justify-content-between">

                      <form class="d-flex justify-content-center">
                     <img alt="" src="resources/img/Icon.png" />
                      <h4 class="mb-2 mb-sm-0 pt-1">
                         <span> &nbsp <fmt:message key="label.InternalAuditReport" /></span>
                         
                      </h4>
                    </form>
                   <c:choose>
             <c:when test="${schedule.SCHEDULE_STATE == 'SUBMITTED'}">
                   <button class="btn btn-info" 
                  
                   style="margin-left: 70%" onclick="EXPORT_TO_PDF()"> <fmt:message key="label.ExportPDF" /></button>
				   </c:when>
				   </c:choose>
                   
                   

                </div>

            </div>
          <div class="container">
  

  
  <form:form role="form" action="" method="post" modelAttribute="schedule">
    
    
          
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.ReportCreatedby" /></label>
            <input  maxlength="100" type="text" class="form-control" placeholder="Report Created by" readonly="true" value="${pageContext.request.userPrincipal.name}"  />
          </div>

          
          <div class="form-group">
            <label ><fmt:message key="label.AuditArea" /></label>
          <form:select  class="form-control " path="SCHEDULE_AUDITAREA" items="${listAuditAreas}" itemValue="audit_area_id" itemLabel="aUDIT_AREA_NAME" readonly="readonly"/>          
          </div>
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Auditor" />  </label>
               <form:select  class="form-control " path="SCHEDULE_AUDITOR_ID" items="${listUsers}" itemValue="uSER_NAME" itemLabel="uSER_NAME" readonly="readonly"/> 
            </div>
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Auditee" /> </label>
            <form:select  class="form-control " path="SCHEDULE_AUDITEE_ID" items="${listUsers}" itemValue="uSER_NAME" itemLabel="uSER_NAME" readonly="readonly"/>
          </div>
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Date" /></label>
          <form:input maxlength="100" type="Date" path="SCHEDULE_DATE" required="required" class="form-control" placeholder="Enter The Date" readonly="true" />
           </div>
  </form:form>
   <div class="card">
    <div class="card-header text-white bg-info">
    <a class="text-white" data-toggle="collapse" href="#CheckPoints" aria-expanded="false" aria-controls="CheckPoints">
    <fmt:message key="label.CheckPoints" />
  </a>
    </div>
      <div class="card-body" id="CheckPoints">
    <a   data-toggle="modal" data-target=".bd-example-modal-sm" <c:if test="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"> hidden </c:if> >      
  <i class="fa fa-plus" ></i>  <fmt:message key="label.addNewCheckPoint" /> </a>
<form:form method="post" action="saveallChecks" modelAttribute="checkList">

  
   <table class="table table-hover">
  <thead class="black white-text">
    <tr>
      <th scope="col">#</th>
      <th scope="col"><fmt:message key="label.CheckPointQS" /></th>
      <th scope="col"><fmt:message key="label.Result" /> </th>
      <th scope="col"><fmt:message key="label.Notes" /> </th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="Check" items="${checkList.lstCheckpoints}" varStatus="status">
    <tr>
      <th scope="row">${status.count}</th>
      <td>${Check.QS}</td>
      <td><select  name="lstCheckpoints[${status.index}].RESULT" value="${Check.RESULT}" class="form-control " <c:if test="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"> readonly </c:if> > 
         <option value=""></option>
          <option value="YES" <c:if test="${Check.RESULT == 'YES'}"> selected </c:if>><fmt:message key="label.YES" /></option>
          <option value="NO" <c:if test="${Check.RESULT == 'NO'}"> selected </c:if>><fmt:message key="label.NO" /></option>
      </select>
      </td>
      <td> <textarea  name="lstCheckpoints[${status.index}].NOTES" <c:if test="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"> readonly </c:if>  value="${Check.NOTES}" class="form-control" placeholder="Notes" 
    >${Check.NOTES}</textarea>
          
          <input type="hidden" name="lstCheckpoints[${status.index}].id" value="${Check.id}">
                    <input type="hidden" name="lstCheckpoints[${status.index}].QS" value="${Check.QS}">
                    <input type="hidden" name="lstCheckpoints[${status.index}].audit_id" value="${Check.audit_id}">
          
    </td>
    </tr>
  
  </c:forEach>
  
     </tbody>
</table>
<button type="submit" class="btn btn-primary" <c:if test="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"> hidden </c:if>>
  <i class="fa fa-floppy-o" aria-hidden="true"></i> Save
</button>
</form:form>   
    </div>
  </div>
  
<!-- PArtis Form  -->

   <div class="card">
    <div class="card-header text-white bg-info">
    <a class="text-white" data-toggle="collapse" href="#partis" aria-expanded="false" aria-controls="partis">
    Participants
  </a>
    </div>
    <div class="card-body" id="partis" >
    <a   data-toggle="modal" data-target=".bd-example-modal-m" <c:if test="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"> hidden </c:if> >      
  <i class="fa fa-plus" ></i> <fmt:message key="label.addNewParticipants" /> </a>
<form:form method="post" action="saveallChecks" modelAttribute="checkList">

   <table class="table table-hover">
  <thead class="black white-text">
    <tr>
      <th scope="col">#</th>
      <th scope="col"><fmt:message key="label.ParticipantName" /></th>
      <th scope="col"><fmt:message key="label.Depart" /></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="Check" items="${Partis.lstParticipants}" varStatus="status">
    <tr>
      <th scope="row">${status.count}</th>
      <td>${Check.participant_name}
      <input type="hidden" name="lstParticipants[${status.index}].audit_id" value="${Check.audit_id}">
      </td>
      <td>${Check.department_name}
      </td>
      
         </tr>
  
  </c:forEach>
  
     </tbody>
</table>

</form:form>   
    </div>
  </div>

<!-- End Partis -->
  
  <form:form role="form" action="saveScheduleTrans" method="post" modelAttribute="trans">
            <form:input  maxlength="100" path="trans_createdby_id" type="hidden" class="form-control" placeholder="Report Created by" readonly="true" />
              <form:input  maxlength="100" path="trans_date" type="hidden" class="form-control" placeholder="Report Created by" readonly="true"   />
              <form:input  maxlength="100" path="trans_process_name" type="hidden" class="form-control" placeholder="Report Created by" readonly="true"   />
              <form:input  maxlength="100" path="trans_auditee_id" type="hidden" class="form-control" placeholder="Report Created by" readonly="true"   />
               <form:input  maxlength="100" path="trans_schedule_id" type="hidden" class="form-control" placeholder="Report Created by" readonly="true"   />
               <form:input  maxlength="100" path="trans_id" type="hidden" class="form-control" placeholder="Report Created by" readonly="true"   />



    
    <div class="card">
    <div class="card-header text-white bg-info">
    <a class="text-white" data-toggle="collapse" href="#ExcutiveBody" aria-expanded="false" aria-controls="ExcutiveBody">
    <fmt:message key="label.ExcutiveSummary" />
  </a>
    </div>
    <div class="card-body" id="ExcutiveBody">
    <form:textarea path="trans_executive_summery" required="required" class="form-control" placeholder="Excutive Summary..." 
     readonly="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"
    ></form:textarea>
    </div>
  </div>
  <div class="card">
    <div class="card-header text-white bg-info">
    
     <a class="text-white" data-toggle="collapse" href="#Findings"  >
       <fmt:message key="label.AuditFindings" />
   
      </a>
        
       <c:choose>
             <c:when test="${schedule.SCHEDULE_STATE == 'ACCEPTED'}">
           <a class="text-white"  data-toggle="modal" data-target=".bd-example-modal-lg" style="margin-left: 70% !important;">      
  <i class="fa fa-plus" ></i> <fmt:message key="label.addNewNCR" /> </a>
            </c:when>
            </c:choose>
    

      
    </div>
    <div class="card-body" id="Findings">
    <form:textarea required="required" path="trans_audit_findings" class="form-control" placeholder="Audit Findings..."
    readonly="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"
     ></form:textarea>
    </div>
  </div>
  <div class="card">
    <div class="card-header text-white bg-info">
       <a class="text-white" data-toggle="collapse" href="#Reviewed" aria-expanded="false" aria-controls="Reviewed">
    <fmt:message key="label.ReviewedRecords" />
  </a>
     </div>
    <div class="card-body" id="Reviewed">
    <form:textarea path="trans_reviewed_records" required="required" class="form-control" placeholder="Reviewed Records..." 
     readonly="${schedule.SCHEDULE_STATE == 'SUBMITTED'}"
    ></form:textarea>
    </div>
  </div>
  
  
</div>
       <c:choose>
         <c:when test="${schedule.SCHEDULE_STATE=='ACCEPTED'}">
  
<form:input class="btn btn-info" path="Operation" type="submit" style="margin-left:40%;"  value="Save"/>
</c:when>
         </c:choose>
 <c:choose>
         <c:when test="${schedule.SCHEDULE_STATE=='ACCEPTED'}">
  
<form:input class="btn btn-info" path="Operation" type="submit"  value="Submit"/></c:when>
         </c:choose>
  
     </form:form>
   
   
   
   <div class="modal fade bd-example-modal-m" id="Paricipantwindow" tabindex="-1" role="dialog" aria-labelledby="myparticipantsWindow" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="height:100%">
    <div class="modal-header">
        <h5 class="modal-title" id="checkModal">    <fmt:message key="label.NewParticipants" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form:form role="form" action="saveParticipant" method="post" modelAttribute="NewPartis" autocomplete="off">
      
      <div class="modal-body">
      <div class="form-row">
          
          <div class="col">
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Depart" /></label>
      
       <form:input  class="form-control " path="department_name"  list="Departs" required="true"/> 
           
           <datalist id="Departs">
                    <c:forEach var="Departs" items="${listAuditAreas}">
                        <option value="${Departs.aUDIT_AREA_NAME}"/>
                    </c:forEach>
                </datalist>
      </div>
      </div>
      </div>   
      <div class="form-row">
          
          <div class="col">
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.ParticipantName" /></label>
           <form:input  class="form-control " path="participant_name"  list="lstUsers" required="true"/> 
           <datalist id="lstUsers">
                    <c:forEach var="lstUser" items="${listUsers}">
                        <option value="${lstUser.uSER_NAME}"/>
                    </c:forEach>
                </datalist>
                
          <form:input  class="form-control " type="hidden" path="audit_id" value="${NewPartis.audit_id}" />
          </div>
          </div>
         
          </div>
          

    </div>
 
             <input class="btn btn-info"  type="submit"/>
  
  
 
  
  
  
    </form:form >
  
      </div>
    </div>
  </div>	
   
   
   
    
<div class="modal fade bd-example-modal-sm" id="Checkwindow" tabindex="-1" role="dialog" aria-labelledby="myCheckWindow" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="height:100%">
    <div class="modal-header">
        <h5 class="modal-title" id="checkModal"><fmt:message key="label.NewCheckPoint" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form:form role="form" action="saveCheck" method="post" modelAttribute="NewCheck">
      
      <div class="modal-body">
      <div class="form-row">
          
          <div class="col">
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Question" /></label>
                <form:textarea required="required" path="QS" class="form-control" placeholder="Describe the Question..." ></form:textarea>
            
          <form:input  class="form-control " type="hidden" path="audit_id" value="${NewCheck.audit_id}" />
          </div>
          </div>
         
          </div>
          

    </div>
 
             <input class="btn btn-info"  type="submit"/>
  
  
 
  
  
  
    </form:form >
  
  
  
  
      </div>
    </div>
  </div>	
	
	
	
<div class="modal fade bd-example-modal-lg" id="modalwindow" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="height:100%">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><fmt:message key="label.NewNCR" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form:form role="form" action="saveNCRSchedule" method="post" modelAttribute="NCR">
      
      <div class="modal-body">
       <div class="form-row">
          
          <div class="col">
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Department" /></label>
            <input  maxlength="100" type="text" class="form-control" placeholder="Department" readonly="true" value="${schedule.SCHEDULE_AUDITAREA_NAME}" />
          <form:input  class="form-control " type="hidden" path="ncr_dept_id" value="${schedule.SCHEDULE_AUDITAREA}" />
          </div>
          </div>
          <div class="col">
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Date" />  </label>
                        <form:input maxlength="100" type="date" class="form-control" placeholder="Date" path="ncr_date" />
            
          </div>
          </div>
          </div>
          <div class="form-row">
          <div class="col">
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.ncr_source" /> </label>
            <form:input maxlength="100" type="text" path="ncr_source" required="required" class="form-control" placeholder="this can be used for data analysis" />
          </div>
          </div>
          <div class="col">
          <div class="form-group">
            <label class="control-label"><fmt:message key="label.Procedureref" /></label>
        <form:input maxlength="100" type="text" path="ncr_other" required="required" class="form-control" placeholder="(for audit findings only or if applicable)" />
          </div>
          </div>
          
      
    </div>
    

  
  <div class="card">
    <div class="card-header text-white bg-info">
    <a class="text-white" data-toggle="collapse" href="#ExcutiveBody" aria-expanded="false" aria-controls="ExcutiveBody">
    <fmt:message key="label.NONCONFORMANCE" />
  </a>
    </div>
    <div class="card-body" id="ExcutiveBody">
    <form:textarea required="required" path="ncr_desc" class="form-control" placeholder="Describe the nonconfirmity..." ></form:textarea>
   <div class="form-group col-md-6">
            <label class="control-label"><fmt:message key="label.Initiator" />
             :</label>
                <form:input maxlength="100" path="ncr_initiator" type="text" readonly="true" class="form-control" placeholder="(can be auditor or system admin)" value="${pageContext.request.userPrincipal.name}" />
                <label class="control-label"><fmt:message key="label.Auditee" />
             :</label>
                <form:input maxlength="100" path="ncr_assigned_to" type="text" readonly="true" class="form-control" placeholder="(can be auditor or system admin)" value="${schedule.SCHEDULE_AUDITEE_ID}" />
                 
                          <form:input maxlength="100" type="hidden" path="ncr_schedule_id" required="required" class="form-control" value="${schedule.SCHEDULE_ID}"   />
        
          </div>
    </div>
  </div>
             <form:input class="btn btn-info" path="Operation" type="submit"  value="Save"/>
  
  
 
  
  
  
    </form:form >
  
  
  
  
      </div>
    </div>
  </div>
</div>
	
		

	</div>
	</div>
</body>
<script>
function closeModal() {
	  $('#modalwindow').hide();
	  var modalWindow = document.getElementById('iframeModalWindow');
	  modalWindow.src = "";
	}
</script>
</html>