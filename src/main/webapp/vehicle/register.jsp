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
<%
if(request.getParameter("btnsave")!=null){
	String name=request.getParameter("txtname");
	String pass=request.getParameter("txtpass");
	String email=request.getParameter("txtemail");
	String phone=request.getParameter("txtphone");
	String address=request.getParameter("txtaddress");
	Mylib l1=new Mylib();
	l1.dml("insert into tblvendor(vname,vpass,vemail,phone,address)values('"+name+"','"+pass+"','"+email+"','"+phone+"','"+address+"')");
	%>
	<script>
	alert("Registration Success");
	window.location.href="login.jsp";
	</script>
	<%
}

%>
<div class="container-fluid py-3">
        <div class="container pt-3">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<form method="post">
<table class="table">
<tr>
<td>
Name
</td>
<td>
<input type="text" name="txtname" pattern="[a-zA-Z]+(?: [a-zA-Z]+)*"  required class="form-control">
</td>
</tr>
<tr>
<td>
Password
</td>
<td>
<input type="password" name="txtpass" required class="form-control">
</td>
</tr>
<tr>
<td>
Email
</td>
<td>
<input type="email" pattern="^[a-z]*[0-9]*@[a-z]*[0-9]*\.[a-z]{2,3}$" name="txtemail" required class="form-control">
</td>
</tr>
<tr>
<td>
Phone
</td>
<td>
<input type="text" name="txtphone" pattern="\d{10}" required class="form-control">
</td>
</tr>


<tr>
<td>
Address
</td>
<td>
<textarea class="form-control" name="txtaddress"></textarea>
</td>
</tr>
<tr>
<td colspan=2 align=center>
<input type="reset" name="btnsave" value="Clear" class="btn-outline-secondary" data-mdb-ripple-init data-mdb-ripple-color="dark">
<input type="submit" name="btnsave" value="Create Account" class="btn btn-success">
</td>
</tr>
</table>
</form>
</div>
<div class="col-md-3"></div>
</div>
</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>