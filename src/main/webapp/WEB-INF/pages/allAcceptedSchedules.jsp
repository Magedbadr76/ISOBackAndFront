<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
    
    <%@page session="true"%>
    <% response.setCharacterEncoding("UTF-8");%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="label.AuditsSchedule" /></title>

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
<style>
tfoot {
    display: table-header-group;
}
.dt-buttons{
 margin-left:25px !important;
 
}
.form-inline{
display:-ms-flexbox !important;
}
.dataTables_length{
 margin-left:10px !important;

}
</style>
<script>
$(document).ready(function() {

   var table= $('#ScheduleTable').DataTable({
    	responsive:true,
    	fixedHeader:true,
    	colReorder:true,
    	buttons:[
    		{
    			extend: 'collection',
            text: 'Actions',
            className:'btn-sm dt-buttons',
            autoClose: true,
           
           buttons: [
           {extend:'colvis',
        	   className:'btn-sm',
        	   text: 'Visibilty'
        	   }, 
           {
        	   className:'btn-sm',
               extend: 'collection',
               text: 'Export',
               buttons: [
                   'copy',
                   'excel',
                   'csv',
                   'pdf',
                   'print'
               ]
           },
           
           {
        	   className:'btn-sm',
                text: 'Upload',
                action: function ( e, dt, node, config ) {
                  //  alert( 'Button activated' );
                    var fileupload = document.getElementById("FileUpload1");
                    var filePath = document.getElementById("spnFilePath");
                    //var button = document.getElementById("btnFileUpload");
                    //button.onclick = function () {
                        fileupload.click();
                    //};
                    fileupload.onchange = function () {
                        var fileName = fileupload.value.split('\\')[fileupload.value.split('\\').length - 1];
                        filePath.innerHTML = "<b>Selected File: </b>" + fileName;
                       
                        var in2 = document.querySelectorAll("input[type=file]")[0];
                        var file22 = in2.files[0];
                       // function uploadFile(file){
                            var url = 'http://192.168.0.42:8080/FileUploader/FileUploader';
                            var xhr = new XMLHttpRequest();
                            var fd = new FormData();
                            xhr.open("POST", url, true);
                            xhr.onreadystatechange = function() {
                                if (xhr.readyState == 4 && xhr.status == 200) {
                                    // Every thing ok, file uploaded
                                    console.log(file22); // handle response.
                                    console.log(xhr.responseText); // handle response.
                                }
                            };
                            //fd.append("upload_file", fileupload);
                            fd.append("SelectedFile",file22);
                            fd.append('Path',3);
                            fd.append('DocType','Candidate_Attachments');
                            fd.append('ObjectFileName','Users');
                            xhr.send(fd);
                        //}
                        /* dt.button().add( 1, {
                            text: 'Button 1',
                            action: function () {
                                this.remove();
                            }
                        } );*/
                    };
                }
           }
        ]}],
        initComplete: function () {
    		 this.api().columns([0 , 1 , 2 , 3]).every( function () {
                 var column = this;
                 var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="">All</option></select>')
                     .appendTo( $(column.footer()).empty() )
                     .on( 'change', function () {
                         var val = $.fn.dataTable.util.escapeRegex(
                             $(this).val()
                         );
  
                         column
                             .search( val ? '^'+val+'$' : '', true, false )
                             .draw();
                     } );
  
                 column.data().unique().sort().each( function ( d, j ) {
                     select.append( '<option value="'+d+'">'+d+'</option>' )
                 } );
             } );
    		 
    		    $('.js-example-basic-single').select2({

    		    });
         }
    });
   /* $('a.toggle-vis').on( 'click', function (e) {
        e.preventDefault();
 
        // Get the column API object
        var column = table.column( $(this).attr('data-column') );
 
        // Toggle the visibility
        column.visible( ! column.visible() );
    } );*/
    
   table.buttons().container()
   .appendTo( '#ScheduleTable_wrapper .col-md-6:eq(0)' );
    
   $('#builder').queryBuilder({
	    filters: [{
	    id: 'department',
	    label: 'Department',
	    type: 'string'
	  }, {
	    id: 'date',
	    label: 'Date',
	    type: 'string',
	   
	    operators: ['equal', 'not_equal', 'in', 'not_in', 'is_null', 'is_not_null']
	  }, {
	    id: 'auditor',
	    label: 'Auditor',
	    type: 'string'
	    
	  }, {
	    id: 'auditee',
	    label: 'Auditee',
	    type: 'string'
	    
	  }]
	  });
   $('#btn-reset').on('click', function() {
	   $('#builder').queryBuilder('reset');
	 });
	 $('.parse-sql').on('click', function() {
	   var target = $(this).data('target');
	   var result = $('#builder').queryBuilder('getSQL', $(this).data('stmt'));
	   console.log(result.sql);
	   console.log(escape(result.sql));
	   window.location.href = "SearchEmployee?SearchSql="+escape(result.sql);
	   //$('#Search').attr("href",);
	   //$('#Search').trigger("click");
	   
	   
	 });
    
} );
</script>
</head>
<body>
<jsp:include page="NavBar.jsp">
         <jsp:param name="param1" value="Dashboardli"/>
     </jsp:include>
     <div class="page-content d-flex align-items-stretch"> 
       <jsp:include page="SideNave.jsp">
         <jsp:param name="param1" value="AuditAdminli3"/>
     </jsp:include>
<div class="content-inner">


<div class="card mb-4 wow fadeIn" style="visibility: visible; animation-name: fadeIn;">

                <!--Card content-->
                <div class="card-body d-sm-flex justify-content-between">

                    <h4 class="mb-2 mb-sm-0 pt-1">
                         <span><fmt:message key="label.ScheduleList" /> </span>
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
	<div align="center">
		
    <span id="spnFilePath"></span>
    <input type="file" id="FileUpload1" style="display: none" />
 <p >
    <button class="btn btn-primary"  type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        <fmt:message key="label.AdvancedSearch" />
    </button>
</p>
<div class="collapse" id="collapseExample">
    <div class="card card-block">
<div id="builder" class="query-builder" style="display:-ms-flexbox !important;"   >
  </div>
  <div class="btn-group">
      <button id="btn-reset" class="btn btn-warning reset" ><fmt:message key="label.Reset" /> </button>
      <button id="btn-get-sql" class="btn btn-primary parse-sql" ><fmt:message key="label.Search" /> </button>
    </div>
    </div>
</div>
</br>


    <div class="modal fade" id="modalYT" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">

    <!--Content-->
    <div class="modal-content">

      <!--Body-->
      <div class="modal-body mb-0 p-0">

        <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
          <iframe class="embed-responsive-item" src="http://192.168.0.7:7001/BPM_INTEGRATION_API/processworkflow?INST_ProcessId=1348&INST_VersionNo=Version%201&USER=root" allowfullscreen></iframe>
        </div>
      </div>

      <!--Footer-->
      <div class="modal-footer justify-content-center">
        <span class="mr-4">Spread the word!</span>
        <a type="button" class="btn-floating btn-sm btn-fb"><i class="fa fa-facebook"></i></a>
        <!--Twitter-->
        <a type="button" class="btn-floating btn-sm btn-tw"><i class="fa fa-twitter"></i></a>
        <!--Google +-->
        <a type="button" class="btn-floating btn-sm btn-gplus"><i class="fa fa-google-plus"></i></a>
        <!--Linkedin-->
        <a type="button" class="btn-floating btn-sm btn-ins"><i class="fa fa-linkedin"></i></a>

        <button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4" data-dismiss="modal">Close</button>

      </div>

    </div>
    <!--/.Content-->

  </div>
</div>
    
    
		<table id ="ScheduleTable" class="table table-striped table-bordered" style="width:80%">
            
			 <thead>
			<tr>
			<th>        <fmt:message key="label.Department" /></th>
			<th><fmt:message key="label.Date" /></th>
			<th><fmt:message key="label.Auditor" /></th>
			<th><fmt:message key="label.Auditee" /></th>
			<th width="100" data-breakpoints="xs sm md lg"><fmt:message key="label.State" /></th>
			<th><fmt:message key="label.Action" /></th>
			</tr>
			</thead>
			<tfoot>
			<tr>
			<th><fmt:message key="label.Department" /></th>
			<th><fmt:message key="label.Date" /></th>
			<th><fmt:message key="label.Auditor" /></th>
			<th><fmt:message key="label.Auditee" /></th>
			<th><fmt:message key="label.State" /></th>
			<th></th>
			</tr>
			</tfoot>
            <tbody>
			<c:forEach var="schedule" items="${listSchedules}">
				<tr>

					<td>${schedule.SCHEDULE_AUDITAREA_NAME}</td>
					<td>${schedule.SCHEDULE_DATE}</td>
					<td>${schedule.SCHEDULE_AUDITOR_ID}</td>
					<td>${schedule.SCHEDULE_AUDITEE_ID}</td>
					<td>${schedule.SCHEDULE_STATE}</td>
					<td><a href="InternalAudit?id=${schedule.SCHEDULE_ID}"><fmt:message key="label.OpenReport" /></a>
						</td>

				</tr>
			</c:forEach>
			</tbody>
			
		</table>
		   
		</div>
		</div>
	</div>
</body>
</html>