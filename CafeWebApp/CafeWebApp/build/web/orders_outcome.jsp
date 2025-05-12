<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                color: #2c3e50;
                text-align: center;
                margin: 20px;
            }
            h1 {
                color: #2ecc71;
                font-size: 28px;
                margin-bottom: 20px;
            }
            .confirmation-message {
                font-size: 20px;
                font-weight: bold;
                color: #27ae60;
                background: #e0fbe0;
                padding: 15px;
                border-radius: 5px;
                display: inline-block;
                margin-bottom: 20px;
            }
            a {
                display: inline-block;
                padding: 10px 15px;
                border-radius: 5px;
                background: #3498db;
                color: white;
                text-decoration: none;
                font-weight: bold;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            }
            a:hover {
                background: #2980b9;
            }
        </style>
    </head>
    <body>
        <h1>Order Confirmed!</h1>

        <p class="confirmation-message">Your food order has been successfully placed.</p>

        <p><a href="menu.jsp">Back to Menu</a></p>
    </body>
</html>