<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <title>Login Page</title>
    <style>
        * {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f2f2f2;
        }
        form {
            margin-top: 100px;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>
</body>
</html>
