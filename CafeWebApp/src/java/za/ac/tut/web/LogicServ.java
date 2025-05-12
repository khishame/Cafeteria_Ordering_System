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
    private CafeteriaFacadeLocal cf;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op").toLowerCase();
        String url = getOutcomePage(op, request);

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private String getOutcomePage(String op, HttpServletRequest request) throws IOException, ServletException {
        switch (op) {
            case "student":
                return "Stud_outcome.jsp";
            case "barista":
                return "bari_outcome.jsp";
            case "add":
                handleAddOperation(request);
                return "add_outcome.jsp";
            case "remove":
                handleRemoveOperation(request);
                return "remove_outcome.jsp";
            case "view current menu":
            case "menu":
                request.setAttribute("ca", cf.findAll());
                return op.equals("view current menu") ? "view_outcome.jsp" : "views_outcome.jsp";
            case "order":
                return "order_income.jsp";
            case "orders":
                handleOrder(request);
                return "orders_outcome.jsp";
            case "view student orders":
                handleViewStudentOrders(request);
                return "view_student_orders_outcome.jsp";
            case "order completed":
                return "home.html";
            default:
                return "home.html";
        }
    }

    private void handleAddOperation(HttpServletRequest request) throws IOException, ServletException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String fName = request.getParameter("fName");
        String price = request.getParameter("price");
        Part photo = request.getPart("photo");

        byte[] photoBytes = getBytesFromPart(photo);
        Cafeteria ca = new Cafeteria(name, surname, fName, price, photoBytes);
        cf.create(ca);
    }

    private void handleRemoveOperation(HttpServletRequest request) {
        String fName = request.getParameter("fName");

        Optional<Cafeteria> cafeteriaToRemove = cf.findAll()
            .stream()
            .filter(c -> c.getFood().equalsIgnoreCase(fName))
            .findFirst();

        cafeteriaToRemove.ifPresent(cf::remove);
    }

   
private void handleOrder(HttpServletRequest request) {
    String num = request.getParameter("num");
    String fName = request.getParameter("fname");

    
    if (num == null || num.trim().isEmpty() || fName == null || fName.trim().isEmpty()) {
        request.setAttribute("error", "Student number and food name are required.");
        return;
    }

    Orders ord = new Orders(num.trim(), fName.trim());
    Optional<Cafeteria> optionalCafeteria = cf.findAll()
        .stream()
        .filter(c -> c.getFood().equalsIgnoreCase(fName.trim())) 
        .findFirst();

    if (optionalCafeteria.isPresent()) {
        Cafeteria cafeteria = optionalCafeteria.get();
        List<Orders> orderList = Optional.ofNullable(cafeteria.getOrder())
            .orElseGet(() -> new java.util.ArrayList<>());
        orderList.add(ord);
        cafeteria.setOrder(orderList);
        cf.edit(cafeteria);
        request.setAttribute("message", "Order placed successfully!");
    } else {
        request.setAttribute("error", "No cafeteria found for food: " + fName);
    }
}


    private void handleViewStudentOrders(HttpServletRequest request) {
    List<Cafeteria> cafeterias = cf.findAll();
    List<Orders> allOrders = new java.util.ArrayList<>();

    for (Cafeteria cafeteria : cafeterias) {
        List<Orders> orders = cafeteria.getOrder();
        if (orders != null && !orders.isEmpty()) {
            allOrders.addAll(orders);
        }
    }

    request.setAttribute("orders", allOrders.isEmpty() ? null : allOrders);
}

    private byte[] getBytesFromPart(Part photo) throws IOException {
        try (InputStream in = photo.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
            return out.toByteArray();
        }
    }
}
