<%-- 
    Document   : products
    Created on : Oct 26, 2024, 12:25:05 PM
    Author     : lilen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="page for all products">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>Group A Project: Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href=" stylesheet.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header><jsp:include page="header.html"/></header>
        <div class="container d-flex flex-column p-3">
            <!--<input type="button" value="Add Product" onclick="window.location.href='./product_page.jsp'">-->
            <!-- For each product in products  -->
            <div class="card border-info border-3" style="width: 18rem;">
                <img class="card-img-top" src="product_image.png" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Product info</p>
                    <div class="d-flex flex-row">
                        <input type="button" class="btn btn-primary align-self-start m-1" value="Edit Product">
                        <input type="button" class="btn btn-primary align-self-start m-1" value="Delete Product">
                    </div>
                </div>
            </div>
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
