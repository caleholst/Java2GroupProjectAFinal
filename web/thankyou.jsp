<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Thank you page">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>Group A Project: Thank you!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="/styles/main.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header><jsp:include page="includes/header.jsp"/></header>
        <div class="container d-flex flex-column">
            <p class="p-5">Thank you for your purchase! An email with more information will be sent shortly.</p>
            <a class="text-dark nav-link" href="/GroupAProject/shop/index">Back to Homepage</a>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
