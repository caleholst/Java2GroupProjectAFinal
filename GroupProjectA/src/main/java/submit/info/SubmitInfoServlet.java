/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package submit.info;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import music.business.Product;
import music.data.ProductIO;

@WebServlet("/confirm")
public class SubmitInfoServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // get parameters from the request
        String codeString = request.getParameter("code");
        String descriptionString = request.getParameter("description");
        String priceString = request.getParameter("price");

        // validate the parameters
        String url;
        String message;
        double priceDouble = 0;          
        try {
            priceDouble = Double.parseDouble(priceString);      
            message = "";
            url = "/product_result.jsp";
        }
        catch (NumberFormatException e) {
            message = "Please enter a valid number price.";
            url = "/index.jsp";
        }

        // store data in Product object
        Product product = new Product();
        product.setCode(codeString);
        product.setDescription(descriptionString);
        product.setPrice(priceDouble);
        
        request.setAttribute("product", product);
        request.setAttribute("message", message);
            
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }   
}
