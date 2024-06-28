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
           .hero {
            background-image: url('/static/Images/Index.jpg'); 
            background-size: cover;
            color: black;
            padding: 100px 0;
            text-align: center;
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
  background-color: #fde7df;
}

    </style>
</head>
<body >

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
    <a href="#contact">Contact</a>
    <div class="navbar-right">
        <a href="/logout">Logout</a>
    </div>
</div>



    <!-- Your home page content goes here -->
<footer>
    <p>&copy; 2024 Gym Management System. All rights reserved.</p>
</footer>

</body>
</html>