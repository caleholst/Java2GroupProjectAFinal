<%-- 
    Document   : product
    Created on : Oct 26, 2024, 12:29:29 PM
    Author     : lilen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="page for each product">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>Group A Project: Product Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href=" stylesheet.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header><jsp:include page="header.html"/></header>
        <h1>Add/Edit a Product</h1>
        <form action="confirm" method="post">
           <label>Product Code:</label>
            <input type="text" name="code"
                   value="${product.code}"/><br>

            <label>Product Description:</label>
            <input type="text" name="description"
                   value="${product.description}"/><br>

            <label>Product Price:</label>
            <input type="text" name="price"
                   value="${product.price}"/><br>

            <label>&nbsp;</label>
            <input type="submit" value="Add"/><br> 
        </form>     
     
      
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
