/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import za.ac.tut.bl.CafeteriaFacadeLocal;
import za.ac.tut.entity.Cafeteria;
import za.ac.tut.entity.Orders;

@MultipartConfig
public class LogicServ extends HttpServlet {

    @EJB CafeteriaFacadeLocal cf;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
         String op = request.getParameter("op");
        String url ="";
        
        if(op.equalsIgnoreCase("Student")){
            url ="Stud_outcome.jsp";
        }else if(op.equalsIgnoreCase("Barista")){
            url ="bari_outcome.jsp";
        }else if(op.equalsIgnoreCase("add")){
            
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String fName = request.getParameter("fName");
            String price = request.getParameter("price");
            Part photo = request.getPart("photo");
            
            byte[] a = getByte(photo);
            
            Cafeteria ca = new Cafeteria(name, surname,fName, price, a);
            cf.create(ca);
            
            url ="add_outcome.jsp";
            
        }else if(op.equalsIgnoreCase("remove")){
            String fName = request.getParameter("fName");
            
            List<Cafeteria> ca = cf.findAll();
            
            for(int i=0;i<ca.size();i++){
                if(ca.get(i).getFood().equalsIgnoreCase(fName)){
                    Long id = ca.get(i).getId();
                    
                    Cafeteria c = cf.find(id);
                    cf.remove(c);
                    
                    url ="remove_outcome.jsp";
                }
            }
            
            
        }else if(op.equalsIgnoreCase("view")){
            
            List<Cafeteria> ca = cf.findAll();
            
            request.setAttribute("ca",ca);
            
            url ="view_outcome.jsp";
            
        }else if(op.equalsIgnoreCase("menu")){
            
            List<Cafeteria> ca = cf.findAll();
            
            request.setAttribute("ca",ca);
            
            url ="views_outcome.jsp";
            
        }else if(op.equalsIgnoreCase("order")){
            
            url ="order_income.jsp";
        }else if(op.equalsIgnoreCase("orders")){
    
    String num = request.getParameter("num");
    String fName = request.getParameter("fname");
    
    Orders ord = new Orders(num, fName);
    
    Cafeteria c = new Cafeteria();
    
    List<Orders> or = c.getOrder();
    
    if (or == null) {
        or = new ArrayList<>();
    }
    
    or.add(ord);
    c.setOrder(or);
    
    cf.create(c);
    
    url = "orders_outcome.jsp";
}

        
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
        
    }

    private byte[] getByte(Part photo) throws IOException {
        InputStream in = photo.getInputStream();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] a = new byte[1024];
        int i= 0;
        while((i = in.read(a))!= -1){
            out.write(a, 0, i);
        }
        return out.toByteArray();
    }
}
