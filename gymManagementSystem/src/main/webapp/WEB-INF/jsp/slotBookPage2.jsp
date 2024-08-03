<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Booking Page</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #00c6ff, #0072ff);
        margin: 0;
        padding: 50px 0px 0px 0px;
        display: flex;
        justify-content: center;
        color: #333;
        background-image: url("/images/gymReport.jpg");
    	background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: 100% 100%;
    }
    .container {
        background: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        width: 80%;
        max-width: 600px;
        text-align: left;
    }
    .container h2, .container h3 {
        margin-bottom: 10px;
        color: black;
    }
    .container h3 {
        font-size: 1.2em;
    }
   
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #0072ff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    button {
        padding: 10px 20px;
        background-color: #28a745;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #218838;
    }
    .reset-button {
        background-color: #dc3545;
    }
    .reset-button:hover {
        background-color: #c82333;
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
    //<a href="/index" class="return">Return</a>
}
    }
    .return:hover{
    background-color: #2f8db4;
    }
    
    
</style>
</head>
<body>
<div class="container">
    <h3>BOOKING FOR:</h3>
    <h2>SLOT ID: ${slot.slotId}	&nbsp; SLOT TIMING: ${slot.slotTime} &nbsp; SLOT PRICE: ${slot.pricing}</h2>
    <form:form method="post" action="/slot-book">
        <input type="hidden" value="${slot.slotId}" name="slot_id"/>
        <input type="hidden" value="0" name="userId"/>
       
        <table>
            <tr>
                <th>Item No</th>
                <th>Item Name</th>
                <th>Total Seat</th>
                <th>Available Seat</th>
                <th>Select</th>
            </tr>
            <c:forEach items="${itemList}" var="item">
                <tr>
                    <td>${item.itemId}</td>
                    <td>${item.itemName}</td>
                    <td>${item.totalSeat}</td>
                    <td>${item.seatVacant}</td>
                    <td><input name="selectItem" type="radio" value="${item.itemId}"/></td>
                </tr>
            </c:forEach>
        </table>
        <div style="text-align: center;">
            <button type="submit">BOOK</button>
            <button type="reset" class="reset-button">RESET</button><br/>
           <a href="/index" class="return">Return</a>
        </div>
    </form:form>
</div>

</body>
</html>
