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
<title> VehicleRentalWebApp</title>
<%@include file='head.jsp' %>
</head>
<body>

<%@include file='menu.jsp' %>
<div class="container-fluid py-3">
        <div class="container pt-3">
        <h2 style="color:red";"><center>Orders</center></h2>
<table class="table">
<tr>
<Td>
Name
</Td>
<tD>
Email
</tD>
<tD>
Phone
</tD>
<TD>
Vehicle Id
</TD>
<td>
Vehicle Name
</td>
<Td>
Vehicle Price
</Td>
<tD>
No. Of Days
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
	rs=stmt.executeQuery("select * from tblcart,tblvehicle,tbluser where tbluser.uid=tblcart.uid and tblcart.veid=tblvehicle.veid  and status>=0");
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("uname"));%></tD>
		<tD><%out.println(rs.getString("email"));%></tD>
		<tD><%out.println(rs.getString("phone"));%></tD>
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
	<tR>
	<tD>
	Total
	</tD>
	<td>
	<% out.println(totalamt+""); %>
	</td>
	</tR>
	<%

}
catch(Exception ex){
	
}

%>
</table>
</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>