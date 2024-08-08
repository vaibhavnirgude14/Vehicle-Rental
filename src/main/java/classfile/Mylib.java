package classfile;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Mylib{
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
public void conOpen() {
	try {
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
	}
	catch(Exception ex) {
		
	}

}
public void conClose() {
	try {
	stmt.close();
	con.close();
	}
	catch(Exception ex) {
		
	}
}
public void dml(String qry) {
	try {
		conOpen();
		stmt=con.createStatement();
		stmt.executeUpdate(qry);
		conClose();
	} catch (Exception e) {
		conClose();
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
public Boolean exists(String qry) throws SQLException {
	try {
		conOpen();
		stmt=con.createStatement();
		rs=stmt.executeQuery(qry);
		if(rs.next()) {
			rs.close();
			conClose();
			return true;
		}
		else {
			rs.close();
			conClose();
			return false;
		}
		
		
		
	}
	catch(Exception ex) {
		rs.close();
		conClose();
		return false;
	}
}

public void filldropdown(String name,String svalue, String dvalue, String qry) {
	try {
		conOpen();
		stmt=con.createStatement();
		rs=stmt.executeQuery(qry);
		while(rs.next()) {
			System.out.println(""+rs.getString(dvalue));
		}
		conClose();
	}
	catch(Exception ex) {
		
	}
}

}