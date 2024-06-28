<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GYM Login Page</title>
<style>
    body {
    	background-image:url(https://img.freepik.com/free-photo/3d-gym-equipment_23-2151114137.jpg);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f0f0f0; 
        font-family: Arial, sans-serif;
        
       	background-repeat: no-repeat;
      	background-attachment: fixed; 
     	background-size: 100% 100%;
    }
    .login-box {
        background:rgb(186 186 186 / 80%); 
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .login-box h3 {
        margin: 0px 0px 0px 2px;
    }
    .login-box input[type="text"],
    .login-box input[type="password"] {
        width: 80%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .login-box input[type="submit"] {
        width: 84%;
        padding: 10px;
        background-color: #007BFF;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }
    .login-box input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .login-box a {
        color: #ffffff;
        text-decoration: none;
    }
    .login-box a:hover {
        text-decoration: underline;
    }
    p{
    color:red;
    }
   
</style>
</head>
<body>
<c:url value="/login" var="login" />
<div class="login-box">
    
    <form:form action="${login}" method="post">
        <input type="text" name="username" placeholder="Enter User Id" />
        <br />
        <input type="password" name="password" placeholder="Enter Password" />
        <br />
        <input type="submit" value="Submit" />
    </form:form>
    <h3>
        <a href="/register" class="underline"> <p>REGISTER HERE</p></a>
    </h3>
</div>
</body>
</html>