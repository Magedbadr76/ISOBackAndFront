<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <%@page session="true"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NCR</title>

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
    	  tableAutoSize:true,imagesByReference:true
    });
 var dd = {
    		  content:val.content,
    		  images:val.images
    		}
 
 console.log(dd);
    pdfMake.createPdf(dd).download();
  }
  </script>
<body>
<jsp:include page="NavBar.jsp">
         <jsp:param name="param1" value="Dashboardli"/>
     </jsp:include>
     <div class="page-content d-flex align-items-stretch"> 
       <jsp:include page="SideNave.jsp">
         <jsp:param name="param1" value="NCRLi"/>
     </jsp:include>
     
<div style="display:none" id="HTMLReport">
     <p>&nbsp;&nbsp;</p>

<table border="1" cellpadding="1" cellspacing="0" style="width:691px; border-collapse: collapse;  ">
	<tbody>
		<tr>
			<td rowspan="2" width="20%">
			<img style="display:block; width:135px;height: 135px;"   src="data:image/jpeg;base64,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"></i></td>
			<td rowspan="2" style="text-align:center"><span style="font-size:16px"><strong>Non-conformity report (NCR)<br />
			CORRECTIVE ACTION</strong></span></td>
			<td style="width:291px"><span style="font-size:16px"><strong>NCR SN# : </strong></span> ${schedule.ID} </td>
		</tr>
		<tr>
			<td style="width:291px">Page 1 of 1</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<table border="1" cellpadding="1" cellspacing="0" style="width:800px; border-collapse: collapse; ">
	<tbody>
		<tr>
			<td style="width:379px"><strong>Department :</strong> ${schedule.ncr_dept_name}</td>
			<td style="width:300px"><strong>Date:</strong>${schedule.ncr_date}</td>
		</tr>
		<tr>
			<td style="width:379px"><strong>Source : Internal Audit External Audit Customer complaint<br /></strong>
			${schedule.ncr_source}</td>
			<td style="width:300px"><strong>Procedure ref:<br />
			(for audit findings only or if applicable )</strong></br>
			${schedule.ncr_other}</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:#ffcc99; width:681px"><span style="font-size:16px"><strong>NONCONFORMANCE</strong></span></td>
		</tr>
		<tr>
			<td colspan="2" style="width:681px">
			${schedule.ncr_desc}
			<br />
			<br />
			
			Initiator:</strong>${schedule.ncr_initiator}</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:#ffcc99; width:681px"><span style="font-size:16px"><strong>ROOT CAUSE (to be completed by the concerned Head of Department)</strong></span></td>
		</tr>
		<tr>
			<td colspan="2" style="width:681px">
			${schedule.ncr_root_cause}
			<br />
			<br />
			&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:#ffcc99; width:681px"><span style="font-size:16px"><strong>CORRECTIVE ACTION (to be completed by the concerned HoD)</strong></span></td>
		</tr>
		<tr>
			<td colspan="2" style="width:681px">
			${schedule.ncr_corrective_action}

			<br />
			Agreed Completion Date:</strong>
			${schedule.ncr_completion_date}
			</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:#ffcc99; width:681px"><span style="font-size:16px"><strong>VERIFICATION (to be completed by the system admin )</strong></span></td>
		</tr>
		<tr>
			<td colspan="2" style="width:681px"><strong>Verification of closure of corrective actions<br />
			 	${schedule.ncr_verfication_notes}
			<br />
			Date:</strong>${schedule.ncr_verfication_date}</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
     </div>
     
<div class="content-inner">
<div class="card mb-4 wow fadeIn" style="visibility: visible; animation-name: fadeIn;">
 <form class="d-flex">
                     <img alt="" src="resources/img/Icon.png" style="height: fit-content;"/>
                      <h4 class="mb-2 mb-sm-0 pt-1">
                         <span> &nbsp Non-confirmity report (NCR)<br>&nbsp CORRECTIVE ACTION</span>
                         
                      </h4>
                    </form>

                <!--Card content-->
                <div class="card-body d-sm-flex justify-content-between">

                     
                   
                   <c:choose>
             <c:when test="${schedule.ncr_status == 'CLOSED'}">
                 

                   

                </div>

            </div>
          <div class="container">
  
  <button class="btn btn-info " 
                   style="margin-left: 70%" onclick="EXPORT_TO_PDF()"> Export PDF</button>
				   </c:when>
				   </c:choose>
  
  <form:form role="form" action="saveNCR" method="post"  modelAttribute="schedule" style="width:100%;">
    <form:hidden path="ID"/>
     <div class="form-row">
          
          <div class="col">
          <div class="form-group">
            <label class="control-label">Department</label>
			<c:choose>
			   <c:when test="${schedule.ncr_status != 'NEW'}">
          <form:select  class="form-control " path="ncr_dept_id" items="${listAuditAreas}" readonly="true" itemValue="audit_area_id" itemLabel="aUDIT_AREA_NAME" />
          </c:when>
            </c:choose>
			<c:choose>
			   <c:when test="${schedule.ncr_status == 'NEW'}">
          <form:select  class="form-control " path="ncr_dept_id" items="${listAuditAreas}" itemValue="audit_area_id" itemLabel="aUDIT_AREA_NAME" />
          </c:when>
            </c:choose>
			
		 </div>
          </div>
          <div class="col">
          <div class="form-group">
            <label class="control-label">Date  </label>
            <form:input maxlength="100" type="date" class="form-control" placeholder="Date" path="ncr_date" readonly="${schedule.ncr_status != 'NEW'}"/>
          </div>
          </div>
          </div>
          <div class="form-row">
          <div class="col">
          <div class="form-group">
            <label class="control-label">Other Source</label>
            <form:input maxlength="100" type="text" path="ncr_source" required="required" class="form-control" placeholder="this can be used for data analysis" readonly="${schedule.ncr_status != 'NEW'}"/>
          </div>
          </div>
          <div class="col">
          <div class="form-group">
            <label class="control-label">Procedure ref</label>
        <form:input maxlength="100" type="text" path="ncr_other" required="required" class="form-control" placeholder="(for audit findings only or if applicable)" readonly="${schedule.ncr_status != 'NEW'}"/>
          </div>
          </div>
          
      
    </div>
    
 
   
    
    <div class="card">
    <div class="card-header text-white bg-info">
    <a class="text-white" data-toggle="collapse" href="#ExcutiveBody" aria-expanded="false" aria-controls="ExcutiveBody">
    NONCONFORMANCE
  </a>
    </div>
    <div class="card-body" id="ExcutiveBody">
    <form:textarea required="required" path="ncr_desc" class="form-control" placeholder="Describe the nonconfirmity..." readonly="${schedule.ncr_status != 'NEW'}"></form:textarea>
   <div class="form-group col-md-6">
            <label class="control-label">Initiator :</label>
        <form:input maxlength="100" path="ncr_initiator" type="text" readonly="true" class="form-control" placeholder="(can be auditor or system admin)" />
          </div>
    </div>
     <div class="form-group col-md-6">
            <label class="control-label">Auditee :</label>
			  <c:choose> 
  <c:when test="${schedule.ncr_status != 'NEW'}">
            
             <form:select  class="form-control " path="ncr_assigned_to" items="${listUsers}" itemValue="uSER_NAME" itemLabel="uSER_NAME" readonly="readonly"/> 
  </c:when>
  <c:otherwise>
               <form:select  class="form-control " path="ncr_assigned_to" items="${listUsers}" itemValue="uSER_NAME" itemLabel="uSER_NAME" /> 
  
  </c:otherwise>
</c:choose>
          </div>
    </div>
  </div>
  <c:choose>
             <c:when test="${(schedule.ncr_status == 'Under Investigation' ||schedule.ncr_status == 'Under Revision'||schedule.ncr_status == 'CLOSED') && schedule.ID!=0 }">
    
  <div class="card">
    <div class="card-header text-white bg-info">
     <a class="text-white" data-toggle="collapse" href="#Findings" >
    Root CAUSE (to be completed by the concerned Head of Department)
  </a>
    </div>
    <div class="card-body" id="Findings">
    <form:textarea required="required" path="ncr_root_cause" class="form-control" placeholder="Describe the root cause of the nonconfirmity..." readonly="${schedule.ncr_status == 'CLOSED'||schedule.ncr_status == 'Under Revision'||schedule.ncr_assigned_to!=pageContext.request.userPrincipal.name}"></form:textarea>
    </div>
  </div>
  <div class="card">
    <div class="card-header text-white bg-info">
       <a class="text-white" data-toggle="collapse" href="#Reviewed" aria-expanded="false" aria-controls="Reviewed">
    CORRECTIVE ACTION (to be completed by the concerned HoD)
  </a>
     </div>
    <div class="card-body" id="Reviewed">
    <form:textarea required="required"  path="ncr_corrective_action" class="form-control" placeholder="(Describe the activity to be carried-out to correct the nonconfirmity)" readonly="${schedule.ncr_status == 'CLOSED'||schedule.ncr_status == 'Under Revision'||schedule.ncr_assigned_to!=pageContext.request.userPrincipal.name}"></form:textarea>
    <div class="form-group col-md-6">
            <label class="control-label">Agreed Completion Date :</label>
        <form:input maxlength="100" type="Date" path="ncr_completion_date" required="required" class="form-control" placeholder="Agreed Completion Date" readonly="${schedule.ncr_status == 'CLOSED'||schedule.ncr_status == 'Under Revision'||schedule.ncr_assigned_to!=pageContext.request.userPrincipal.name}"/>
          </div>
    </div>
  </div>
  		
    </c:when>
            </c:choose>
  <c:choose>
             <c:when test="${(schedule.ncr_status == 'Under Revision'||schedule.ncr_status == 'CLOSED')  && schedule.ID!=0 }">
  
    <div class="card">
    <div class="card-header text-white bg-info">
       <a class="text-white" data-toggle="collapse" href="#verification" aria-expanded="false" aria-controls="verification">
    VERIFICATION (to be completed by the system admin)
  </a>
     </div>
    <div class="card-body" id="verification">
    <label class="control-label">Verification of closure of corrective actions</label>
    <form:textarea required="required"  class="form-control" path="ncr_verfication_notes"  placeholder="NOTES..." readonly="${schedule.ncr_status == 'CLOSED'||schedule.ncr_initiator!=pageContext.request.userPrincipal.name}"></form:textarea>
   
    <div class="form-group col-md-6">
            <label class="control-label">Date :</label>
        <form:input maxlength="100" type="Date" path="ncr_verfication_date" required="required" class="form-control" placeholder="Date" readonly="${schedule.ncr_status == 'CLOSED'||schedule.ncr_initiator!=pageContext.request.userPrincipal.name}"/>
   
          </div>
                  <form:input maxlength="100" type="hidden" path="ncr_status" required="required" class="form-control" placeholder="Status" />
          
    </div>
          </c:when>
            </c:choose>
      <c:choose>
             <c:when test="${schedule.ncr_status != 'CLOSED' }">
           <form:input class="btn btn-info" path="Operation" type="submit"  value="Save"/>
             </c:when>
            </c:choose>
            
            <c:choose>
             <c:when test="${schedule.ncr_status == 'Under Investigation' && schedule.ncr_assigned_to==pageContext.request.userPrincipal.name  && schedule.ID>0 }">
          <form:input class="btn btn-info" path="Operation" type="submit"  value="Solved"/>
            </c:when>
            </c:choose>
            
            <c:choose>
             <c:when test="${schedule.ncr_status == 'Under Revision' && schedule.ncr_initiator==pageContext.request.userPrincipal.name  && schedule.ID>0 }">
          <form:input class="btn btn-info" path="Operation" type="submit"  value="Close"/>
          <form:input class="btn btn-info" path="Operation" type="submit"  value="Return To Auditee"/>
            </c:when>
            </c:choose>
            
  </div>
 </form:form>  
</div>


	     

	</div>
	</div>
</body>
</html>