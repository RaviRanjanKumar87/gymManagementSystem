<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Entry</title>

    <style>

        body {
            background-color: #e6e6e6;
            display: flex;
            align-items: center;
            height: 100vh;
            justify-content: center;
            flex-direction: column;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        textarea {
            padding: 5px;
            font-size: 15px;
            border-radius: 5px;
        }

        .form-container {
            background-color: white;
            border-radius: 5px;
            padding: 30px;
        }

        button {
            margin-top: 10px;
            padding: 8px 14px;
            border-radius: 5px;
            background-color: #4156f3;
            color: white;
            outline: none;
            border: none;
            cursor: pointer;
	        /* font-size: 18px; */
            font-size: 15px;
        }
        
        a {
            border: solid 1px #4156f3;
            border-radius: 5px;
            margin-left: 4px;
            padding: 6px 13px;
            text-decoration: none;
            font-size: 15px;
        }
        
    </style>
</head>
<body>
   <form action="/feedback" method="post">
    <div class="form-container">
        <label for="content">Share your feedback:</label> <br><br>
        <textarea name="content" id="" rows="5" cols="80" placeholder="Write your valueable feedback here..." required></textarea>
        <br>
        <button type="submit">Submit</button>
        <a href="/index">Return</a>
    </div>
   </form>
</body>
</html>