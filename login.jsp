<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*"%>
<html>
<head>
<title>로그인</title>
<style>
    body {
        background-color: lightblue;
    }
    .container {
        width: 50%;
        margin: auto;
        padding: 20px;
        background-color: white;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 100px;
    }
    h2 {
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .btn-submit {
        width: 100%;
        padding: 10px;
        font-size: 18px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn-submit:hover {
        background-color: #45a049;
    }
    .error-message {
        color: red;
        text-align: center;
        margin-top: 10px;
    }
</style>
</head>
<body>
<div class="container">
    <h2>로그인</h2>
    <%
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    
    if (id != null && passwd != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB", "id", "passwd");
            
            String sql = "SELECT * FROM Member WHERE id=? AND passwd=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // 로그인 성공 시 세션 생성
                session.setAttribute("id", id);
                response.sendRedirect("main.jsp"); // 로그인 성공 시 이동할 페이지
            } else {
                out.println("<div class='error-message'>아이디 또는 비밀번호가 일치하지 않습니다.</div>");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("<div class='error-message'>로그인 실패: " + ex.getMessage() + "</div>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                out.println("<div class='error-message'>DB 연결 해제 오류: " + ex.getMessage() + "</div>");
            }
        }
    }
    %>
    <form method="post" action="login.jsp">
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div class="form-group">
            <label for="passwd">비밀번호:</label>
            <input type="password" id="passwd" name="passwd" required>
        </div>
        <button type="submit" class="btn-submit">로그인</button>
    </form>
</div>
</body>
</html>
