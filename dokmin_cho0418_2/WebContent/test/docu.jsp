<%@page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="com.mysql.jdbc.Driver";
String user="root";
String pass="1234";
String dbURL="jdbc:mysql://localhost/beom";


String sql;
String rtn_xml;

Connection connection;
Statement stmt 	= null;
ResultSet rs 	= null;
rtn_xml = "";

try{
	Class.forName(driver);
	connection=DriverManager.getConnection(dbURL,user,pass);
	
	sql = "select * from customer";
	
	stmt = connection.createStatement();
	rs = stmt.executeQuery(sql);		
%>							
<customer>
<%
	while (rs.next()){		
		out.println("<person>");
		out.println("<name>" + rs.getString("name") + " </name>");
		out.println("<age>" + rs.getString("age") +  "</age>");
		out.println("<tel>" + rs.getString("tel") +  "</tel>");
		out.println("<addr>" + rs.getString("addr") +  "</addr>");
		out.println("</person>");		
	}		
%>
</customer>
<%
}
catch(ClassNotFoundException cne){
	
}catch(SQLException se){
}
%>