<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classfile.Mylib"%>
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
<%

if(request.getParameter("btnsave")!=null){
	String vname=request.getParameter("txtvname");
	String vprice=request.getParameter("txtvprice");
	String vdprice=request.getParameter("txtvdprice");
	String vstock=request.getParameter("txtstock");
	String vdesc=request.getParameter("ckeditor");
	String cid=request.getParameter("cmbcat");
	String txtfile=request.getParameter("txtfile");
	String txtaddress=request.getParameter("txtaddress");
	Mylib l1=new Mylib();
	l1.dml("insert into tblvehicle(vname,vprice,vdprice,vstock,vdesc,cid,vimage,vid,address)Values('"+vname+"','"+vprice+"','"+vdprice+"','"+vstock+"','"+vdesc+"','"+cid+"','"+txtfile+"','"+session.getAttribute("vid")+"','"+txtaddress+"')");
	%>
	<script>window.location.href="viewvehicle.jsp"</script>
	<%
}

%>
<div class="row">
<div class="col-md-12">
<form method="post">
<table class="table">
<tr>
<Td>
Choose Category
</Td>
<tD>
<select name="cmbcat" class="form-control">
<%
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblcategory");
while(rs.next()){
	%>
	<option value=<%out.println(rs.getString("cid")); %>><%out.println(rs.getString("cname")); %></option>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</select>
</tD>
</tr>
<tR>
<td>
Vehicle Name
</td>
<Td>
<input type="text" name="txtvname" class="form-control">
</Td>
</tR>
<tR>
<td>
Rent Price
</td>
<Td>
<input type="text" name="txtvprice" class="form-control">
</Td>
</tR>
<tR>
<td>
Discount Price
</td>
<Td>
<input type="text" name="txtvdprice" class="form-control">
</Td>
</tR>
<tR>
<td>
Vehicle Description
</td>
<Td>
<textarea class="ckeditor" id="ckeditor" name="ckeditor"></textarea>
</Td>
</tR>
<tR>
<td>
Vehicle Address
</td>
<Td>
<textarea class="form-control"  name="txtaddress"></textarea>
</Td>
</tR>
<tR>
<td>
Vehicle Stock
</td>
<Td>
<input type="text" name="txtstock" class="form-control">
</Td>
</tR>
<tR>
<td>
Vehicle Image
</td>
<Td>
<input type="file" name="txtfile" class="form-control">
</Td>
</tR>

<tr>
<td>
<input type="submit" name="btnsave" class="btn btn-success" value="Add Vehicle">
</td>
</tr>
</table>
</form>
</div>
</div>
</div>
</div>

</body>
</html>