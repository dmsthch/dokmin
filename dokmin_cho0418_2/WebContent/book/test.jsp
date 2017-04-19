<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%

JSONArray jsonArray = new JSONArray();
JSONObject jsonObject = null;

String driver="com.mysql.jdbc.Driver";
String user="dokminid";
String pass="dokminpw";
String dbURL="jdbc:mysql://localhost:3306/dokmin?characterEncoding=euckr";
int selectGenre = Integer.parseInt(request.getParameter("b_genre"));
System.out.println(selectGenre);
String sql;
String rtn_xml;

Connection connection;
PreparedStatement stmt 	= null;
ResultSet rs 	= null;
rtn_xml = "";

try{
	Class.forName(driver);
	connection=DriverManager.getConnection(dbURL,user,pass);
	sql = "select * from genre ORDER BY genre_code ASC LIMIT ?,10";
	
	stmt=connection.prepareStatement(sql);
	stmt.setInt(1, selectGenre);
	rs = stmt.executeQuery();


	while(rs.next()){
		int genre_code = rs.getInt("genre_code");
		String genre_name = rs.getString("genre_name");
		jsonObject = new JSONObject();
		jsonObject.put("genre_code", genre_code);
		jsonObject.put("genre_name", genre_name);
		jsonArray.add(jsonObject);
		/* json = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("genre_code", rs.getInt("genre_code"));
		map.put("genre_name", rs.getString("genre_code"));
		json.putAll(map); */
	}
	
	out.print(jsonArray.toString());
	System.out.println(jsonArray.toString());
/* PrintWriter pw=response.getWriter();
pw.flush();
pw.close();
 */
}catch(Exception e){
	e.getStackTrace();
}finally{
	rs.close();
	stmt.close();
}
%>