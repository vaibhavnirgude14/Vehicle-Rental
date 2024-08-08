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
<br>
<br>
<br>


 <form method="post">
<table>
<tr>
<Td>
Choose Category
</Td>
<tD>
<select name="cmbcat" class="form-control">
<%
Statement stmt2=null;
Connection con2=null;
ResultSet rs2=null;
Class.forName("org.postgresql.Driver");
con2=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
stmt2=con2.createStatement();
rs2=stmt2.executeQuery("select * from tblcategory");
while(rs2.next()){
	%>
	<option value=<%out.println(rs2.getString("cid")); %>><%out.println(rs2.getString("cname")); %></option>
	<%
}
rs2.close();
stmt2.close();
con2.close();

%>
</select>
</tD>
</tr>
<tr>
<Td>
<input type="submit" name="btnsearchbycat" Value="Search">
</table>

</form>
<%
String qry=null;
if(request.getParameter("btnsearchbycat")!=null){
	String search=request.getParameter("cmbcat");
	 qry="select * from tblvehicle where cid = '"+search+"'";
}
else{
 qry="select * from tblvehicle";
}
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
stmt=con.createStatement();


rs=stmt.executeQuery(qry);
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
	<h6>Vehicle Name</h6>
	</td>
	<tD>
	<h6><%out.println(rs.getString("vname")); %></h6>
	</tD>
	</tr>
	<tr>
	<td>
	<h6>Vehicle Price</h6>
	</td>
	<tD>
	<h6>₹<strike><%out.println(rs.getString("vprice")); %></strike>/-</h6>
	</tD>
	
	</tr>
	<tr>
	<td>
	<h6>Vehicle Discount Price</h6>
	</td>
	<tD>
	<h6>₹<%out.println(rs.getString("vdprice")); %>/-</h6>
	</tD>
	</tr>
	<tR>
	<tD>
	<a href="viewdetails.jsp?id=<%out.println(rs.getString("veid"));%>"><input type="button" class="btn btn-success" value="View Details"></a>
	</tD>
	</tR>
	</table></div>
	
	<%
}
rs.close();
stmt.close();
con.close();


%>
</div>
          
  
        <!-- Banner Start -->
        
   <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row mx-0">
              
                <div class="col-lg-6 px-0">
                    <div class="px-5 bg-dark d-flex align-items-center justify-content-between" style="height: 350px;">
                        <div class="text-left">
                            <h3 class="text-uppercase text-light mb-3">Looking for a car?</h3>
                            <a class="btn btn-primary py-2 px-4" href="welcome.jsp">Start Now</a>
                        </div>
                        <img class="img-fluid flex-shrink-0 mr-n5 w-50 ml-4" src="img/banner-right.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

<%@include file="footer.jsp"%>
</body>
</html>