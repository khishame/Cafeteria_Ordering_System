<%@page import="za.ac.tut.entity.Orders"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entity.Cafeteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Student Orders</title>
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
            .error {
                color: red;
                font-size: 18px;
                font-weight: bold;
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
                margin-top: 20px;
                transition: background 0.3s ease;
            }
            input[type="submit"]:hover {
                background: #27ae60;
            }
        </style>
    </head>
    <body>
        <h1>View Student Orders</h1>

        <table>
            <thead>
                <tr>
                    <th>Student Number</th>
                    <th>Food Name</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Orders> list = (List<Orders>) request.getAttribute("orders");
                if(list != null){
                for(int i=0;i<list.size();i++){
                    
                String student = list.get(i).getStudNum();
                String food =list.get(i).getFoodName();
                out.println(student);
                %>
                        <tr>
                            <td><%=student%></td>
                            <td><%=food%></td>
                        </tr>
                <% 
                        }
                    }else{
                %>
                    <tr>
                        <td colspan="2" class="error">No student orders found.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <form action="LogicServ.do" method="POST">
            <input type="submit" name="op" value="ORDER COMPLETED">
        </form>
    </body>
</html>