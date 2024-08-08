<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VehicleRentalWebApp</title>
<%@include file='head.jsp' %>
</head>
<body>

<%@include file='menu.jsp' %>
 <div class="container-fluid py-3">
        <div class="container pt-3">
<form method="post">
<table class="table">
<Tr>
<td>
	Area Name
	</td>
	<td>
	<input type="text" name="txtarea" class="form-control">
	</td>
	</Tr>
	<Tr>
<td>
	City Name
	</td>
	<td>
	<input type="text" name="txtcity" class="form-control">
	</td>
	</Tr>
<tr>
<tD>
Nearby
</tD>
<td>
<textarea name="txtnearby" class="form-control"></textarea>

</td>
</tr>
<Tr>
<td>
Pincode
	</td>
	<td>
	<input type="text" name="txtpincode" class="form-control">
	</td>
	</Tr>
<tR>
<tD>
<input type="submit" name="btnaddaddress" value="Add Address" class="btn btn-success">
</tD>
</tR>
</table>
</form>
</div>
</div>
<%
if(request.getParameter("btnaddaddress")!=	null){
	String fno=request.getParameter("txtarea");
	String building=request.getParameter("txtcity");
	String nearby=request.getParameter("txtnearby");
	String pincode=request.getParameter("txtpincode");
	Mylib l1=new Mylib();
	l1.dml("insert into tbladdress(area,city,nearme,pin,uid)values('"+fno+"','"+building+"','"+nearby+"','"+pincode+"','"+session.getAttribute("uid")+"')");
	%>
	<script>
	alert("Address Added Successfully");
	window.location.href="address.jsp";
	</script>
	<%
}
%>
<%@include file='footer.jsp' %>
</body>
</html>