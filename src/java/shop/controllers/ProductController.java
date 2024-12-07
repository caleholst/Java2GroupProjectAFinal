package shop.controllers;

import shop.business.*;
import shop.data.ProductDb;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProductController extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart());
        }
        Cart tempCart = (Cart) session.getAttribute("cart");
        
        request.setAttribute("cartSize", tempCart.cartSize());
        
        String action = request.getPathInfo().substring(1);
        String url = "";
        switch (action) {
            case "index" -> url = "/index.jsp";
            case "products" -> url = products(request, response);
            case "checkout" -> url = checkout(request, response);
            case "admin/" -> url = admin(request, response);
            case "admin/add" -> url = "/admin/add.jsp";
            case "admin/edit" -> url = editProductGet(request, response);
            default -> {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
        }

        getServletContext().getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Cart tempCart = (Cart) session.getAttribute("cart");
        
        request.setAttribute("cartSize", tempCart.cartSize());
        
        String action = request.getPathInfo().substring(1);
        String url = "";
        switch (action) {
            case "addToCart" -> url = addToCart(request, response);
            case "removeFromCart" -> url = removeFromCart(request, response);
            case "purchase" -> url = purchase(request, response);
            case "admin/editProduct" -> url = editProductPost(request, response);
            case "admin/deleteProduct" -> url = deleteProduct(request, response);
            case "admin/addProduct" -> url = addProduct(request, response);
            default -> {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
        }

        getServletContext().getRequestDispatcher(url)
                .forward(request, response);
    }

    private String products(HttpServletRequest request,
            HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        Cart tempCart = (Cart) session.getAttribute("cart");
        
        List productList = ProductDb.selectAllProducts();
        
        request.setAttribute("productList", productList);
        request.setAttribute("cartSize", tempCart.cartSize());
        
        return "/products.jsp";
    }

    private String checkout(HttpServletRequest request,
            HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        Cart tempCart = (Cart) session.getAttribute("cart");
        
        request.setAttribute("cart", tempCart.getCart());
        request.setAttribute("subtotal", tempCart.getSubTotal());
        request.setAttribute("total", tempCart.getTotal());
        request.setAttribute("cartSize", tempCart.cartSize());
        
        return "/checkout.jsp";
    }

    private String addToCart(HttpServletRequest request,
            HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        Cart tempCart = (Cart) session.getAttribute("cart");
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = ProductDb.selectProduct(productId);
        String reply = tempCart.addItem(product);
        
        session.setAttribute("cart", tempCart);
        request.setAttribute("reply", reply);
        
        return products(request, response);
    }

    private String removeFromCart(HttpServletRequest request, //TO-DO
            HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        Cart tempCart = (Cart) session.getAttribute("cart");
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        String reply = tempCart.removeItem(productId);
        
        session.setAttribute("cart", tempCart);
        request.setAttribute("reply", reply);
        
        return checkout(request, response);
    }

    private String purchase(HttpServletRequest request,
            HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        session.setAttribute("cart", new Cart()); // An actual site would process this information different, but for this assignment, simply reset cart
        Cart tempCart = (Cart) session.getAttribute("cart");
        
        request.setAttribute("cart", tempCart.getCart());
        request.setAttribute("cartSize", tempCart.cartSize());
        
        return "/thankyou.jsp";
    }

    private String admin(HttpServletRequest request,
            HttpServletResponse response) {
        
        List productList = ProductDb.selectAllProducts();
        
        request.setAttribute("productList", productList);
        
        return "/admin/admin.jsp";
    }

    private String addProduct(HttpServletRequest request,
            HttpServletResponse response) {
        
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("productDesc");
        String productImagePath = request.getParameter("productImagePath");
        Double productPrice = Double.valueOf(request.getParameter("productPrice"));
        
        Product product = new Product(productName, productDesc, productImagePath, productPrice);
        
        ProductDb.addProduct(product);
        
        return admin(request, response);
    }

    private String editProductGet(HttpServletRequest request,
            HttpServletResponse response) {
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = ProductDb.selectProduct(productId);
        
        request.setAttribute("product", product);
        
        return "/admin/edit.jsp";
    }

    private String editProductPost(HttpServletRequest request,
            HttpServletResponse response) {
        
        long productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("productDesc");
        String productImagePath = request.getParameter("productImagePath");
        Double productPrice = Double.valueOf(request.getParameter("productPrice"));
        
        Product product = new Product(productId, productName, productDesc, productImagePath, productPrice);
        
        ProductDb.editProduct(product);
        
        return admin(request, response);
    }

    private String deleteProduct(HttpServletRequest request,
            HttpServletResponse response) {
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDb.deleteProduct(productId);
        
        return admin(request, response);
    }
}