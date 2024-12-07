<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="admin page to modify items">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>Group A Project: Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="/styles/main.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header><jsp:include page="../includes/header.jsp"/></header>
        <fmt:setLocale value = "en_US"/>
        <div class="container">
            <div class="d-flex flex-column align-items-center p-2">
                <h1>Welcome Admin</h1>
                <a href="/GroupAProject/shop/admin/add" class="btn btn-info" role="button">Add Product</a>
            </div>
            <p class="d-flex justify-content-center pt-3">${reply}</p>
            <div class="d-flex flex-row flex-wrap justify-content-center">
                <!-- For each product in products  -->
                <c:forEach var="product" items="${productList}">
                <div class="card border-info border-3 m-3" >
                    <img class="card-img-top" src="${pageContext.request.contextPath}/images/${product.imagePath}" alt="${product.name}" style="width: 17rem; height: 17rem;">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <h5 class="card-title"><fmt:formatNumber value="${product.price}" type="currency"/></h5>
                        <p class="card-text">${product.desc}</p>
                        <div class="d-flex flex-row">
                            <form action="edit" method="get" class="m-1">
                                <input type="hidden" name="productId"
                                       value="${product.id}"/>
                                <input type="submit" value="Edit"/>
                            </form>
                            <form action="deleteProduct" method="post" class="m-1">
                                <input type="hidden" name="productId"
                                       value="${product.id}"/>
                                <input type="submit" value="Delete"/>
                            </form>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>