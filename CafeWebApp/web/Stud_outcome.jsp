<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Category</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                color: #2c3e50;
                text-align: center;
                margin: 20px;
            }
            h1 {
                color: #3498db;
                font-size: 28px;
                margin-bottom: 20px;
            }
            form {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                display: inline-block;
                text-align: center;
            }
            input[type="submit"] {
                background: #2ecc71;
                color: white;
                border: none;
                padding: 12px 20px;
                cursor: pointer;
                font-weight: bold;
                border-radius: 5px;
                width: 200px;
                margin: 10px;
                transition: background 0.3s ease;
            }
            input[type="submit"]:hover {
                background: #27ae60;
            }
        </style>
    </head>
    <body>
        <h1>Student Category</h1>
        
        <form action="LogicServ.do" method="POST">
            <input type="submit" name="op" value="Menu">
            <input type="submit" name="op" value="Order">
        </form>
    </body>
</html>