<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gym Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }
        .navbar-right {
            float: right;
        }
        .content {
            padding: 16px;
            display: flex;
            justify-content: center;
           
            height: calc(100vh - 56px); 
            text-align: center;
        }
        .subnav {
            float: left;
            overflow: hidden;
        }
        .subnav .subnavbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: white;
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }
        .navbar a:hover, .subnav:hover .subnavbtn {
            background-color: red;
        }
        .subnav-content {
            display: none;
            position: absolute;
            left: 0;
            background-color: red;
            width: 100%;
            z-index: 1;
        }
        .subnav-content a {
            float: left;
            color: white;
            text-decoration: none;
        }
        .subnav-content a:hover {
            background-color: #eee;
            color: black;
        }
        .subnav:hover .subnav-content {
            display: block;
        }
        .hero h1 {
            font-size: 4em;
            margin: 0;
        }
        footer {      
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        body {
            background-image: url("/images/index.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed; 
            background-size: 100% 100%;
        }
        .message {
            color: green; /* Style the message */
            font-size: 16px;
            margin: 20px 0;
            background-color: #f0f0f0;
            border: 2px solid #4CAF50;
            padding: 10px;
            border-radius: 5px;
            width: 80%; 
            height:10px;
            max-width: 500px;
            position: relative;
        }
        .message .close-btn {
            position: absolute;
            top: 5px;
            right: 5px;
            background: none;
            border: none;
            color: #4CAF50;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
    <script>
        function removeMessage() {
            document.getElementById('messageBox').style.display = 'none';
        }
    </script>
</head>
<body>

<div class="navbar">
    <a class="active" href="/">Home</a>
    <div class="subnav">
        <button class="subnavbtn">Gym Item 
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="subnav-content">
            <a href="/gymitem">ADD ITEM</a>
            <a href="/gymitems">ITEM REPORT</a>
        </div>
    </div>
    <div class="subnav">
        <button class="subnavbtn">Slot 
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="subnav-content">
            <a href="/slot">ADD SLOT</a>
            <a href="/slots">DISPLAY SLOT</a>
        </div>
        
    </div>
     <div class="subnav">
            <a href="/admin-booking-detail">BOOKING DETAILS</a>
    </div>
    <a href="#contact">Contact</a>
    <div class="navbar-right">
        <a href="/logout">Logout</a>
    </div>
</div>

<div class="content">
    <c:if test="${not empty sessionScope.message}">
        <div id="messageBox" class="message">
            ${sessionScope.message}
            <button class="close-btn" onclick="removeMessage()">&times;</button>
        </div>
        <c:remove var="message" scope="session"/>
    </c:if>
</div>

<footer>
    <p>&copy; 2024 Gym Management System. All rights reserved.</p>
</footer>

</body>
</html>