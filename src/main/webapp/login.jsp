<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Login</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
    .login-container { width: 300px; margin: 100px auto; padding: 20px; background: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    h2 { text-align: center; }
    .form-group { margin-bottom: 15px; }
    label { display: block; margin-bottom: 5px; }
    input[type="text"], input[type="password"] { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
    input[type="submit"] { width: 100%; padding: 10px; background-color: #5cb85c; border: none; color: white; border-radius: 4px; cursor: pointer; }
    input[type="submit"]:hover { background-color: #4cae4c; }
  </style>
</head>
<body>
<div class="login-container">
  <h2>Admin Login</h2>
  <form action="loginServlet" method="post">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
    </div>
    <input type="submit" value="Login">
  </form>
</div>
</body>
</html>