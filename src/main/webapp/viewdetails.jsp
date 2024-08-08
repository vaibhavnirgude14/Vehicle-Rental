<%@page import="classfile.Mylib"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VehicleRentalWebApp</title>
<%@include file='head.jsp' %>
<%@include file='loginrestrict.jsp' %>
</head>
<body>

<%@include file='menu.jsp' %>

<%
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblvehicle where veid="+request.getParameter("id"));
%>
<div class="row">
<%
while(rs.next()){
	%>
	<div class="col-md-4">
	<table class="table">
	<tr>
	
	<tD colspan=2 align=center>
	<img height=200px src="vimg/<%out.println(rs.getString("vimage")); %>">
	</tD>
	</tr>
	<tr>
	<td>
    Name
	</td>
	<tD>
	<%out.println(rs.getString("vname")); %>
	</tD>
	</tr>
	<tr>
	<td>
	 Price
	</td>
	<tD>
	₹<strike><%out.println(rs.getString("vprice")); %></strike>/-
	</tD>
	
	</tr>
	<tr>
	<td>
	 Discount Price
	</td>
	<tD>
	₹<%out.println(rs.getString("vdprice")); %>/-
	</tD>
	</tr>
	<tr>
	<td>
	 Description
	</td>
	<tD>
	<%out.println(rs.getString("vdesc")); %>
	</tD>
	</tr>
	<tr>
	<td>
	 Address
	</td>
	<tD>
	<%out.println(rs.getString("address")); %>
	</tD>
	</tr>
	<form method="post">
	<tr>
	<tD>
	No Of Days
	</tD>
	<td>
	<input type="number" name="cmbqty" class="form-control">
	</td>
	</tr>
	<tr>
	<td>
	<input type="submit" name="btnaddcart" value="BOOK" class="btn btn-primary">
	</td>
	</tr>
	</form>
	</table></div>
	
	<%
}
rs.close();
stmt.close();
con.close();

if(request.getParameter("btnaddcart")!=null){
	int days=Integer.parseInt(request.getParameter("cmbqty"));
	Mylib l1=new Mylib();
	Statement stmt1=null;
	Connection con1=null;
	ResultSet rs1=null;
	Class.forName("org.postgresql.Driver");
	con1=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
	stmt1=con1.createStatement();
	rs1=stmt1.executeQuery("select * from tblvehicle where veid="+request.getParameter("id"));
	
	if(rs1.next()){
		if(rs1.getInt("vstock")>=0){
			l1.dml("insert into tblcart(uid,veid,days,status) values('"+session.getAttribute("uid")+"','"+request.getParameter("id")+"','"+days+"','0')");
			int total=rs1.getInt("vstock")-1;
			l1.dml("update tblvehicle set vstock='"+total+"' where veid='"+request.getParameter("id")+"'");
			%>
			<script>
			alert("Car Booked!");
			</script>
			<%
		}
		else{
			%>
			<script>
			alert("Out Of Stock");
			</script>
			<%
		}
	}
	rs.close();
	stmt.close();
	con.close();

	
	
}
%>
</div>
    <!-- Vendor Start -->
    <div class="container-fluid py-2">
        <div class="container py-2">
            <div class="owl-carousel vendor-carousel">
                <div class="bg-light p-4">
                    <img src="img/vendor-1.png" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="img/vendor-2.png" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="img/vendor-3.png" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="img/vendor-4.png" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="img/vendor-5.png" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="img/vendor-6.png" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="img/vendor-7.png" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="img/vendor-8.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->
<%@include file='footer.jsp' %>
</body>
</html>