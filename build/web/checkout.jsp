    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="checkout page">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>Group A Project: Checkout</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/styles/main.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header><jsp:include page="includes/header.jsp"/></header>
        <fmt:setLocale value = "en_US"/>
        <div class="container d-flex flex-column">
            <p class="d-flex justify-content-center pt-3">${reply}</p>
            <!-- For each product in cart  -->
            <c:forEach var="product" items="${cart}">
                <div class="d-flex flex-row">
                    <img class="col-2" src="${pageContext.request.contextPath}/images/${product.imagePath}" alt="${product.name}" style="width: 5rem; height: 5rem;">
                    <div class="d-flex flex-column col-8">
                        <p class="text-size-l">${product.name}</p>
                        <p class="text-size-m">${product.desc}</p>
                    </div>
                    <p class="d-flex justify-content-end text-size-m col-3"><fmt:formatNumber value="${product.price}" type="currency"/></p>
                </div>
                <form action="removeFromCart" method="post" class="pb-3">
                    <input type="hidden" name="productId"
                           value="${product.id}"/>
                    <input type="submit" value="Remove From Cart"/>
                </form>
            </c:forEach>
            <div class="d-flex flex-column align-items-end pb-5">
                <p class="m-0 text-size-l">Subtotal: <fmt:formatNumber value="${subtotal}" type="currency"/></p>
                <p class="m-0 text-size-l">+ <fmt:formatNumber value="${total - subtotal}" type="currency"/></p>
                <p class="m-0 text-size-m">(tax)</p>
                <p class="m-0 text-size-l">Total: <fmt:formatNumber value="${total}" type="currency"/></p>
                <c:if test="${!cart.isEmpty()}">
                    <form action="purchase" method="post">
                        <input type="submit" value="Complete Purchase"/>
                    </form>
                </c:if>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
