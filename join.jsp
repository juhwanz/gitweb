<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!--데이터 확인 코드-->
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%
Connection conn = null;
try {
String url = "jdbc:mysql://localhost:3306/TestDB";
String user = "root";
String password = "1234";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
out.println("데이터베이스 연결이 성공했습니다.");
} catch (SQLException ex) {
out.println("데이터베이스 연결이 실패했습니다.<br>");
out.println("SQLException: " + ex.getMessage());
} finally {
if (conn != null)
conn.close();
}
%>
</body>
</html>
