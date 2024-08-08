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
<form method="post">
<table>
<Tr>
<Td>
Choose Status
</Td>
<tD>
<select name="cmbstatus" class="form-control">
<option value="2">Dispatched</option>
<option value="3">Arriving Soon</option>
<option value="4">Arriving Today</option>
<option value="5">Delivered</option>
<option value="6">Cancelled</option>
</select>
</tD>
</Tr>
<Tr>
<tD>
<input type="submit" name="btnupdate" class="btn btn-primary" value="Update">
</tD>
</Tr>
</table>

</form>

<%
if(request.getParameter("btnupdate")!=null){
	String status=request.getParameter("cmbstatus");
	Mylib l1=new Mylib();
	l1.dml("update tblcart set status='"+status+"' where cartid='"+request.getParameter("id")+"'");
}

%>
</body>
</html>