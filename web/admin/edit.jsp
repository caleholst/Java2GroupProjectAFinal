<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="edit products">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>Group A Project: Edit Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="/styles/main.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header><jsp:include page="../includes/header.jsp"/></header>
        <fmt:setLocale value = "en_US"/>
        <div class="container">
            <div class="d-flex flex-column align-items-center p-5">
                <h1>Edit Product</h1>
                <form action="editProduct" method="post" class="d-flex flex-column align-items-center">
                    <input type="hidden" name="productId"
                           value="${product.id}"/>
                    <label>Product Name:</label>
                    <input type="text" name="productName"
                           value="${product.name}" required/><br>
                    <label>Description:</label>
                    <input type="text" name="productDesc"
                           value="${product.desc}" required/><br>
                    <label>Image Path:</label>
                    <input type="text" name="productImagePath"
                           value="${product.imagePath}" required/><br>
                    <label>Price:</label>
                    <input type="number" step="0.01" name="productPrice"
                           value="${product.price}" required/><br>
                    <label>&nbsp;</label>
                    <input type="submit" value="Update"/><br>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>