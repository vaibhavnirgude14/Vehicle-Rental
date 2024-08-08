<%@page import="classfile.Mylib"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<br>
<br>
  <div class="container-fluid py-3">
        <div class="container pt-3">
        <center><h3 style="color:green;">Bill</h3></center>
<table class="table">
<tr>
<Td>
Name
</Td>
<td>
<%out.println(session.getAttribute("uname")); %>
</td>
</tr>
<tr>
<Td>
Email
</Td>
<td>
<%out.println(session.getAttribute("email")); %>
</td>
</tr>
<tr>
<Td>
Address
</Td>
<%
try{
	Double totalamt=0.0;
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	Mylib l1=new Mylib();
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from tbladdress where uid="+session.getAttribute("uid"));
	while(rs.next()){
		%>
		<td><%out.println(rs.getString("area")+","+rs.getString("city")+","+rs.getString("nearme")+","+rs.getString("pin"));%></td>
		<%
	}
	%>
	<%
}
	catch(Exception ex){
	}
	%>
</tr>
</table>
<table class="table">
<tr>
<TD>
 Id
</TD>
<td>
 Name
</td>
<Td>
 Price
</Td>
<tD>
Days
</tD>
<td>
Total
</td>
</tr>

<%
try{
	Double totalamt=0.0;
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from tblcart,tblvehicle where tblcart.veid=tblvehicle.veid and status='0' and tblcart.uid="+session.getAttribute("uid"));
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("vid"));%></tD>
		<tD><%out.println(rs.getString("vname"));%></tD>
		<tD><%out.println(rs.getString("vdprice"));%></tD>
		<tD><%out.println(rs.getString("days"));%></tD>
		<td>
		<%
		Double d1=Double.parseDouble(rs.getString("vdprice"));
		Double d2=Double.parseDouble(rs.getString("days"));
		out.println(d1*d2);
		totalamt=totalamt+(d1*d2);
		%>
		</td>
		</tr>
		
		<%
		
	}
	%>
	<tr>
	<td>
	Total
	</td>
	<td>
	<% out.println(totalamt+""); %>
	</td>
	</tr>
	
	<tR>
	<tD>
	Total After Tax
	</tD>
	<td>
	<% out.println(totalamt+8/100*totalamt+""); %>
	</td>
	</tR>
	<%

}
catch(Exception ex){
	
}

%>
</table>
<form method="post">
<Table>
<tr>
<tD>
Type of Payment
</tD>
<td>
<select class="form-control" name="cmbpayment">
<option value="Online">Online Payment</option>
<option value="COD">Cash on delivery</option>
</select>
</td>
</tr>
<tr>
<td>
<button type="submit" class="btn btn-outline-dark btn-rounded" data-mdb-ripple-init  data-mdb-ripple-color="dark" name="btnpay"><a href="orders.jsp"> _PAY_ </a></button>
</td>
</tr>
</table>
<br>
<h6 style="color:red;margin:center;">%$WARNING!!The payment process are done here partially ....<br>**It is a just Prototype**</h6>
</form>

<%
if(request.getParameter("btnpay")!=null){
	String pay=request.getParameter("cmbpayment");
	Mylib l1=new Mylib();
	l1.dml("update tblcart set status='1' , tpayment='"+pay+"' where status='0' and uid="+session.getAttribute("uid"));
}

%>
</div>
</div>
<br>
<br>
<%@include file='footer.jsp' %>
</body>
</html>