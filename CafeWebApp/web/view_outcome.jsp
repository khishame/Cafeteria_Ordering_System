<%-- 
    Document   : view_outcome
    Created on : 27 Apr 2025, 7:48:35 PM
    Author     : neo
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entity.Cafeteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Food name</th>
                    <th>Food price</th>
                    <th>Food photo</th>
                </tr>
            </thead>
            <tbody>
                
        
        
        
        <%
        List<Cafeteria> ca =(List<Cafeteria> ) request.getAttribute("ca");
        
        for(int i =0;i<ca.size();i++){
            
            String food = ca.get(i).getFood();
            String price = ca.get(i).getPrice();
            String photo = Base64.getEncoder().encodeToString(ca.get(i).getPhoto());
            %>
            
            <tr>
                    <td><%=food%></td>
                    <td><%=price%></td>
                    <td><img src="data:image/jpng;Base64,<%=photo%>"</td>
                </tr>
            
            <%
        }
        
        %>
            </tbody>
        </table>

    </body>
</html>
