<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: url("/images/gymReport.jpg");
        background-repeat: no-repeat;
        background-attachment: fixed; 
        background-size: 100% 100%;
    }
    .container {
        background: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 800px;
        text-align: center;
    }
    h1 {
        font-size: 24px;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ccc;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #007BFF;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    a {
        text-decoration: none;
        color: #007BFF;
        font-size: 16px;
    }
    a:hover {
        text-decoration: underline;
    }
       .return {
    padding: 0px 8px;
    background-color: #00b4ff;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    
    }
    .return:hover{
    background-color: #2f8db4;
    }
</style>
</head>
<body>
  <div class="container">
    <h1>My Bookings</h1>
    <table>
      <tr>
        <th>Booking ID</th>
        <th>Username</th>
        <th>Slot ID</th>
        <th>Item ID</th>
        
        
      </tr>
      <c:forEach items="${bookings}" var="booking">
        <tr>
        
          <td>${booking.bookingId}</td>
          <td>${booking.username}</td>
          <td>${booking.slotId}</td>
          <td>${booking.itemId}</td>
		  <td><a href="/cancel-booking/${booking.bookingId}">Cancel Booking</a></td>          
          
        </tr>
      </c:forEach>
    </table>
    <a href="/index" class="return">Return to Home</a>
  </div>

</body>
</html>