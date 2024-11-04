<%-- 
    Document   : product_result
    Created on : Oct 26, 2024, 1:14:40 PM
    Author     : lilen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="result for product">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href=" stylesheet.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header><jsp:include page="header.html"/></header>
        <h1>Testing Page</h1>
        
        <label>Code: </label>
        <span>${product.code}</span><br>
        
        <label>Description: </label>
        <span>${product.description}</span><br>
        
        <label>Price: </label>
        <span>${product.price}</span><br>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
