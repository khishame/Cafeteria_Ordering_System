<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
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
                font-size: 32px;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            li {
                background: #2ecc71;
                margin: 10px auto;
                padding: 10px;
                width: 250px;
                border-radius: 5px;
            }
            a {
                text-decoration: none;
                color: white;
                font-weight: bold;
            }
            a:hover {
                color: #ecf0f1;
            }
        </style>
    </head>
    <body>
        <h1>Menu</h1>
        
        <ul>
            <li><a href="add.jsp">➕ Add New Food</a></li>
            <li><a href="delete.jsp">❌ Delete Food</a></li>
            <li><a href="view.jsp">📜 View Current Menu</a></li>
            <li><a href="ord.jsp">🛒 View Current Orders</a></li>
        </ul>
    </body>
</html>