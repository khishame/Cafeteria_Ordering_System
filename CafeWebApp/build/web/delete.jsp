<%-- 
    Document   : delete
    Created on : 27 Apr 2025, 7:36:56 PM
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
                    <td>Enter a food to Remove from the menu</td>
                    <td><input type="text" name="fName"/></td>
                </tr>
        </table>
            <input type="submit" name="op" value="Remove"/>
</form>
    </body>
</html>
