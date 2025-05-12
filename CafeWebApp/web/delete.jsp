<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Food Item</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                color: #2c3e50;
                text-align: center;
                margin: 20px;
            }
            h1 {
                color: #c0392b;
                font-size: 28px;
                margin-bottom: 20px;
            }
            form {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                display: inline-block;
                text-align: left;
            }
            table {
                width: 100%;
            }
            td {
                padding: 10px;
                font-size: 16px;
            }
            input[type="text"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="submit"] {
                background: #e74c3c;
                color: white;
                border: none;
                padding: 12px 20px;
                cursor: pointer;
                font-weight: bold;
                border-radius: 5px;
                width: 100%;
                margin-top: 10px;
                transition: background 0.3s ease;
            }
            input[type="submit"]:hover {
                background: #c0392b;
            }
        </style>
    </head>
    <body>
        <h1>Delete Food Item</h1>
        
        <form action="LogicServ.do" method="POST">
            <table>
                <tr>
                    <td>Enter food item to remove from menu:</td>
                    <td><input type="text" name="fName" required/></td>
                </tr>
            </table>
            <input type="submit" name="op" value="Remove">
        </form>
    </body>
</html>