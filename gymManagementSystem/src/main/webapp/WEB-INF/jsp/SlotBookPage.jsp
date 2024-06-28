<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Booking Page</title>
</head>
<body>
<div class="container">
    <h1>Book Slot</h1>
    <div class="slot-container">
        <table>
            <tr>
                <th>Slot Id</th>
                <th>Slot Time</th>
                <th>Price</th>
            </tr>
            <tr>
                <td>${slot.slotId}</td>
                <td>${slot.slotTime}</td>
                <td>${slot.pricing}</td>
            </tr>
        </table>
    </div>
    <div class="form-container">
        <form:form>
        <input type="hidden" value="${slot.slotId}" name="slot_id"/>
        <table>
        <tr>
        <th>Item No</th>
        <th>Item Name</th>
        <th>Total Slot</th>
        <th>Available Seat</th>
        <th>Select</th>
        </tr>
        <c:forEach items="${itemList}" var="item">
        <tr>
        <td>${item.itemId}</td>
        <td>${item.itemName}</td>
        <td>${item.totalSeat}</td>
        <td>0</td>
        <td><input name="selectItem" type="radio" value="${item.itemId}"/></td>
        </tr>
        </c:forEach>
        </table>
        <a href="#"><button type="button">Submit</button></a>
        </form:form>
    </div>
</div>
</body>
</html>
