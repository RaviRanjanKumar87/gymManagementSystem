<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 20px;
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
        <h1>Booking Cancellation</h1>
        <p>${message}</p>
        <a href="/index" class="return">Return to Home</a>
    </div>

</body>
</html>