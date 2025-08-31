<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Contact</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>

<script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
<script src="https://cdn.datatables.net/colreorder/1.5.1/js/dataTables.colReorder.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" >
function getURLParameter(name) {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [null, ''])[1].replace(/\+/g, '%20')) || null;
  }
$(document).ready(function() {


	var a = document.getElementById('new_comment'); //or grab it by tagname etc
	a.href = "newComment?id="+getURLParameter("id");
	var saveComment = document.getElementById('saveComment'); //or grab it by tagname etc

	saveComment.action ="saveComment?id="+getURLParameter("id");

})
</script>
</head>
<body>
    <div align="center">
        <h1>New Comment</h1>
        <form:form  id="saveComment" action="saveComment" method="post" modelAttribute="comment">
        <table>
        
        <form:hidden path="ID"/>
        <form:hidden path="TICKET_ID"/>
        
            <tr>
                <td>Comment:</td>
                <td><form:input path="COMMENT_TXT" /></td>
            </tr>
           
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        
        
        
     
        </table>
        </form:form>
   
</div>
        
        
   
</body>
</html>