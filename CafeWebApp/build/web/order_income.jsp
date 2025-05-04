<%-- 
    Document   : order_income
    Created on : 28 Apr 2025, 11:03:29 AM
    Author     : neo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="LogicServ.do" method="POST">
            <table>
                    <tr>
                        <td>Enter your Student Number :</td>
                        <td><input type="text" name="num" /></td>
                    </tr>
                    <tr>
                        <td>Enter food name :</td>
                        <td><input type="text" name="fname"/></td>
                    </tr>
            </table>
            <input type="submit" name="op" value="orders"/>
        </form>
        
    </body>
</html>
