<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css"/>


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.dataTables.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>

<script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
<script src="https://cdn.datatables.net/colreorder/1.5.1/js/dataTables.colReorder.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script><style>
    .modal_chart {
   /* display: none; /* Hidden by default */
   width:50%;
	height:50%;
	display:none;
	position:absolute;
	top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
      
    z-index: 1000;

    
}

/* Modal Content */
.modal_content_chart {
 
	width:70%;
    height:80%;
	padding:40px;
	position:absolute;
	top:50%;
	left:50%;
	-webkit-transform:translate(-50%, -50%);
	transform:translate(-50%, -50%);
	box-shadow:0px 2px 6px rgba(0,0,0,1);
	border-radius:3px;
	background:#fff;
}

/* The Close Button */
.close_modal_chart {
   width:30px;
	height:30px;
	padding-top:4px;
	display:inline-block;
	position:absolute;
	top:0px;
	right:0px;
	transition:ease 0.25s all;
	-webkit-transform:translate(50%, -50%);
	transform:translate(50%, -50%);
	border-radius:1000px;
	background:rgba(0,0,0,0.8);
	font-family:Arial, Sans-Serif;
	font-size:20px;
	text-align:center;
	line-height:100%;
	color:#fff;
}

.close_modal_chart:hover,
.close_modal_chart:focus {
    -webkit-transform:translate(50%, -50%) rotate(180deg);
	transform:translate(50%, -50%) rotate(180deg);
	background:rgba(0,0,0,1);
	text-decoration:none;
}
</style>

<script type="text/javascript" >
function getURLParameter(name) {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [null, ''])[1].replace(/\+/g, '%20')) || null;
  }
function closemodal()
{
	document.getElementById('myModal').style.display = "none"; 
}
function  ShowModelNewComment()

{
	console.log()
	console.log(document.getElementById('myModal'));
	document.getElementById('myModal').style.display = "block"; 
}
window.onclick = function(event) {
	if (event.target == document.getElementById('myModal')) {
		document.getElementById('myModal').style.display = "none";
	}
}

$(document).ready(function() {


	var a = document.getElementById('new_comment'); //or grab it by tagname etc
	//a.href = "newComment?id="+getURLParameter("id");
	var page_type = document.getElementById('page_type'); //or grab it by tagname etc
	var type=page_type.textContent;
	var h_newcomment = document.getElementById('h_newcomment'); //or grab it by tagname etc
	var saveComment = document.getElementById('saveComment'); //or grab it by tagname etc

	saveComment.action ="saveComment?id="+getURLParameter("id");
	if(type=="New Employee")
		{
		h_newcomment.style.display = 'none';
		}
	else
		{
		h_newcomment.style.display = 'block';

		}

})


</script>
<script>
$(document).ready(function() {
    $('#commentTable').DataTable({
    	responsive:true,
    	fixedHeader:true,
    	colReorder:true,
    	dom: 'Bfrtip',
        buttons: [
            'colvis'
        ]
    });
} );
</script>
</head>
<body>
<!-- The Modal -->
<div id="myModal" class="modal_chart">

  <!-- Modal content -->
  <div class="modal_content_chart" >
    <span class="close_modal_chart" onclick="closemodal();">&times;</span>
     <div align="center">
        <h1>New Comment</h1>
        <form:form class="needs-validation" id="saveComment" action="saveComment" method="post" modelAttribute="comment">
        <table>
        
        <form:hidden path="ID"/>
        <form:hidden  path="TICKET_ID"/>
        
            <tr>
                <td>Comment:</td>
                <td><form:input class="form-control" path="COMMENT_TXT" /></td>
            </tr>
           
            <tr>
                <td colspan="2" align="center"><input class="btn btn-primary" type="submit" value="Save"></td>
            </tr>
       
        </table>
        </form:form>
   
</div>
  </div>

</div>
<div align="center">
 <h1 id="page_type">${title}</h1>
         <form:form class="needs-validation" action="saveEmployee" method="post" modelAttribute="employee">
        <table>
            <form:hidden path="id"/>
            <tr>
                <td>Name:</td>
                <td><form:input class="form-control" path="name" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><form:input class="form-control" path="email" /></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><form:input class="form-control" path="address" /></td>
            </tr>
            <tr>
                <td>Telephone:</td>
                <td><form:input  class="form-control" path="telephone" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input  class="btn btn-primary" type="submit" value="Save"></td>
            </tr>
        </table>
               <div  class="panel panel-default" style="width: 500px; padding: 10px; margin: 10px" align="center">
    <div id="Tabs" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#comment" aria-controls="comment" role="tab" data-toggle="tab">
                Comments</a></li>
            <li><a href="#attachment" aria-controls="attachment" role="tab" data-toggle="tab">Attachment</a></li>
        </ul>
        
        <!-- Tab panes -->
        
        <div class="tab-content" style="padding-top: 20px">
            <div role="tabpanel" class="tab-pane active" id="comment">
            <h4 id="h_newcomment">New Comment <a href="#" onclick="ShowModelNewComment();" id="new_comment" >here</a>
		</h4>
		   
		
		<table id ="commentTable" class="table table-striped table-bordered" style="width:80%" >
            <thead>
			<th>TIME</th>
			<th>DESCRIPTION</th>
			<th>Action</th>
			</thead>
            <tbody>
			<c:forEach var="comment" items="${listComments}" varStatus="loopStatus">
				<tr>

					<td>${comment.COMMENT_TIME}</td>
					<td>${comment.COMMENT_TXT}</td>

					<td><a
						href="deleteComment?id=${comment.ID}">Delete</a></td>

				</tr>
			</c:forEach>
			</tbody>
		</table>
		

            </div>
            <div role="tabpanel" class="tab-pane" id="attachment">
               This is attachment Information Tab
            </div>
        </div>
        
    </div>
</div>

        </form:form>
   
        
        
    </div>
  
</body>
</html>