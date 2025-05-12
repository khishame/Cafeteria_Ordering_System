<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entity.Cafeteria"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Views Page</title>
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
            table {
                width: 80%;
                margin: auto;
                border-collapse: collapse;
                background: white;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background: #3498db;
                color: white;
            }
            tr:nth-child(even) {
                background: #f2f2f2;
            }
            img {
                max-width: 100px;
                border-radius: 5px;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
            }
            .error {
                color: red;
                font-size: 18px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h1>Available Food Items</h1>

        <table>
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Food Price</th>
                    <th>Food Photo</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Cafeteria> ca = (List<Cafeteria>) request.getAttribute("ca");
                if (ca != null && !ca.isEmpty()) {
                    for (Cafeteria item : ca) {
                        String food = item.getFood();
                        String price = item.getPrice();
                        String photo = Base64.getEncoder().encodeToString(item.getPhoto());
                %>
                        <tr>
                            <td><%= food %></td>
                            <td><%= price %></td>
                            <td><img src="data:image/png;base64,<%= photo %>" alt="Food Image"></td>
                        </tr>
                <% 
                    }
                } else { 
                %>
                    <tr>
                        <td colspan="3" class="error">No food items found.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>