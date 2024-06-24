<%@ page contentType = "text/html; charset=utf-8"%>
<html>
<head>

<title>Database SQL</title>

<style>
    *{
        font-family: fantasy;
        text-align: center;
        background-color: rgb(164, 182, 200);
        
    }

    p{
        font-size : 30px;
    }

    #submit{
        background-color: gray;
        color:black;
        padding : 10px 20px;
        margin: 5px 0;
        border : none;
        border-radius: 4px;
        cursor:pointer;
    }

    #submit:hover{
        background-color: #324534;
        color:azure;
    }
</style>
</head>
<body>
    <img src="image.png" width="300" height="200">
    <form method = "post" action="insert01_process.jsp">
        <p>아이디 : <input type="text" name="id" >
            <p>비밀번호 : <input type="password" name="passwd">
            
            <p><input type="submit" value="회원가입" id="submit">
            </form>
    <form>
        <button type="button" onclick="gotologin();">로그인</button>
    </form>
        <script type="text/javascript">
            function gotologin(){
                window.location.href="login.jsp";
            }
        </script>
        </body>
</html>