<%-- 
    Document   : add
    Created on : 27 Apr 2025, 6:39:47 PM
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
        
        <form action="LogicServ.do" method="POST" enctype="multipart/form-data">
            <table>
                    <tr>
                        <td>Enter Name:</td>
                        <td><input type="text" name="name"/></td>
                    </tr>
                    <tr>
                        <td>Enter surname :</td>
                        <td><input type="text" name="surname"/></td>
                    </tr>
                    <tr>
                        <td>Enter food name :</td>
                        <td><input type="text" name="fName"/></td>
                    </tr>
                    <tr>
                        <td>Enter Food price</td>
                        <td><input type="text" name="price"/></td>
                    </tr>
                    <tr>
                        <td>Enter food photo :</td>
                        <td><input type="file" name="photo" accept="image/*"</td>
                    </tr>
            </table>
            <input type="submit" name="op" value="ADD"/>
        </form>
    </body>
</html>
