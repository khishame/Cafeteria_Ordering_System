package za.ac.tut.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Optional;
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

    @EJB
  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op").toLowerCase();
        String url = getOutcomePage(op, request);

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);



   
}
