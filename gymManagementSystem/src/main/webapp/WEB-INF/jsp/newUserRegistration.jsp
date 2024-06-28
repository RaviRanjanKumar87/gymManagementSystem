
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User Registration</title>
<style>
    body {
    	background-image:url(https://img.freepik.com/free-photo/low-angle-view-unrecognizable-muscular-build-man-preparing-lifting-barbell-health-club_637285-2497.jpg?t=st=1719400452~exp=1719404052~hmac=0d111ebfc2c4a262d072aeaf22d1ab300c2a6bdc2e3f9d0910766494ae126db6&w=900);
    	
        background-repeat:no-repeat;
        background-attachment: fixed;
        background-size:100% 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        
        margin: 0;
        padding: 0;
    }
    .container {
    	
        width: 100%;
        max-width: 400px;
        margin: 20px;
        border-radius: 4px;
        background-color:rgb(10, 10, 10);
        opacity: .8;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .container2{
    	display: flex;
    	justify-content: center;
        align-items: center;
        margin-bottom:10px;
    }
    h2 {
        text-align: center;
        color:white;
        margin-top:-10px;
        margin-bottom:5px;
    }
    form {
        display: flex;
        flex-direction: column;
        width 50%;
    }
    form:input, input[type="password"], input[type="text"], input[type="email"], input[type="phone_number"] {
        width: 100%;
        padding: 15px;
        margin: 1px 0;
        border: 1px solid #ccc;
        color:white;
        border-radius: 4px;
        text c
    }
    #id1 {
      color:white;
     
      margin-bottom:5px;
    }
    #id2 {
      color:white;
	   margin-top:-30px;
	   margin-bottom:5px;
    }
    #id3 {
      color:white;
       margin-top:-30px;
	   margin-bottom:5px;
    }
    #id4 {
      color:white;
       margin-top:-30px;
	   margin-bottom:5px;
	  
    }
    #id5 {
      color:white;
	   margin-top:-30px;
	   margin-bottom:5px;
    }
    #id6 {
      color:white;
	   margin-top:-30px;
	   margin-bottom:5px;
    }
    #id7 {
      color:white;
	   margin-top:-30px;
	   margin-bottom:5px;
    }
    #id8{
      color:white;
	   margin-top:-30px;
	   margin-bottom:5px;
    }
    #id9{
    	color:#08d5e7;
    	justify-content: center;
        align-items: center;
        margin-top:-30px;
	    margin-bottom:5px;
    	
    }
    button {
        width: 25%;
        height:10%;
        padding: 15px;
        margin-top:-30px;
        margin-bottom:5px;
        margin: 5px 0;
        border: none;
        border-radius: 4px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }
    button[type="reset"] {
        background-color: #f44336;
        margin-left:2px;
    }
    button:hover {
        opacity: 0.8;
    }
    .error-message {
        color: red;
        margin-top: 10px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function validateEmail(email) {
    var email = document.getElementById("email").value;
    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (emailRegex.test(email)) {
        return true;
    } else {
        return false;
    }
}
function validatePassword(password) {
    const minLength = 6;
    const uppercasePattern = /[A-Z]/;
    const lowercasePattern = /[a-z]/;
    const specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;

    if (password.length < minLength || !uppercasePattern.test(password) || !lowercasePattern.test(password) || !specialCharPattern.test(password)) {
        return false;
    }

    return true;
}

function passwordCheck() {
    var pass1 = document.getElementById("pass1").value;
    var pass2 = document.getElementById("pass2").value;
    

    if (!validatePassword(pass1)) {
        alert("Password must be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, and one special character.");
        return false;
    }

    if (pass1 !== pass2) {
        alert("Passwords do not match.");
        document.getElementById("pass1").style.borderColor = "#E34234";
        document.getElementById("pass2").style.borderColor = "#E34234";
        return false;
    }

    return true;
}

function validateForm() {
    var form = document.getElementById("registration-form");
    var inputs = form.querySelectorAll("input[required]");
    var email = document.getElementById("email").value;
    var isValid = true;
    
    if(!validateEmail(email)){
    	alert("Invalid email address format");
    	return false;
    }

    inputs.forEach(function(input) {
        if (!input.value) {
            input.style.borderColor = "#E34234";
            isValid = false;
        } else {
            input.style.borderColor = "#ccc";
        }
    });

    if (!isValid) {
        alert("Please fill out all required fields.");
        return false;
    }

    return passwordCheck();
}

</script>
</head>
<body>
<div class="container">
<h2>New User Registration</h2>
<form:form id="registration-form" method="post" onsubmit="return validateForm()" action="/register" modelAttribute="userRecord">
    <p id="id1">Enter first name: </p><form:input path="firstName" required="required"/>
    <br/><br/>
    <p id="id2">Enter last name:</p> <form:input path="lastName" required="required"/>
    <br/><br/>
    <p id="id3">Enter email:</p> <form:input path="email" id="email" required="required"/>
    <br/><br/>
    <p id="id4">Select User's Type:</p> <form:input list="types" name="type" path="type" required="required"/>
    <datalist id="types">
        <option value="Customer">
        <option value="Admin">
    </datalist>
    <br/><br/>
    <p id="id5">Enter user Id:</p> <form:input path="username" id="username" required="required"/>
    <br/><br/>
    <div id="error-message" class="error-message"></div>
    <p id="id6">Enter Phone No.:</p> <form:input path="phone_number" required="required"/>
    <br/><br/>
    <p id="id7">Enter password:</p> <form:input type="password" path="password" id="pass1" required="required"/>
    <br/><br/>
    <p id="id8">Re-type password:</p> <input type="password" id="pass2" required="required"/>
    <br/>
    <div class="container2">
      <button type="submit">Submit</button>
      <button type="reset">Reset</button>
    </div>
    <span align="center">Already registered? <a href="@{/login}"><p id ="id9">Login here</p></a></span>
</form:form>
</div>
</body>
</html>