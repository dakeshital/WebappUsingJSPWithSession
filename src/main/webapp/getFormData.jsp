<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from facebook");
	while (rs.next()) {
		out.println(rs.getInt(1));
	}
	%>


</body>
</html>