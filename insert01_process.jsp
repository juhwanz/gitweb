<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
<style>
    *{
        background-color: lightblue;
    }
</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

Statement stmt = null;
try {
    String sql = "INSERT INTO Member(id, passwd) VALUES('" + id + "','" + passwd + "')";
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
    out.println("회원가입이 성공했습니다.");
    } catch (SQLException ex) {
    out.println("회원가입이 실패했습니다.<br>");
    out.println("SQLException: " + ex.getMessage());
    } finally {
    if (stmt != null)
    stmt.close();
    if (conn != null)
    conn.close();
    }
    %>
    <form>
        <button type="button" onclick="returnlogin();">확인</button>
    </form>
    
    <script type = "text/javascript">
        function returnlogin(){
            window.location.href="loginpage.jsp";
        }
    </script>
    </body>
    </html>