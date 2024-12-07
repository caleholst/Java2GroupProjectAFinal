<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Homepage">
        <meta name="author" content="HTML & CSS modified by Brendan Coleman 11/1/2024">
        <title>Group A Project</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="/styles/main.css" rel="stylesheet" type="text/css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Parkinsans:wght@300..800&family=Playwrite+CU:wght@100..400&display=swap"
            rel="stylesheet">

        <style>
            .text-size-m {
                font-family: Verdana, sans-serif;
                font-size: 1em;
            }

            .text-size-l {
                font-family: "Parkinsans", Verdana, sans-serif;
                font-size: 1.5em;
                font: weight 300px;
                color:rgb(80, 224, 80)
            }

            .p-4 {
                font-family: "Parkinsans", Verdana, sans-serif;
                font-size: 3em;
                font-weight: bold;
                color:rgb(80, 224, 80)
            }

            p {
                font-family:Georgia, 'Times New Roman', Times, serif;
            }
        </style>
    </head>
    <body>
        <header><jsp:include page="includes/header.jsp"/></header>
        <div class="container d-flex flex-column">
            <h1 class="p-4">Welcome to your Local Produce Store!</h1>


            <div class="row mb-4">
                <div class="col-lg-8">
                    <p class="text-size-m">
                        Step into our family-owned produce wonderland, where every fruit and vegetable tells a story of
                        local dedication and farm-fresh goodness. Since 2020, we've been bringing the garden's best
                        straight to your table, partnering with farmers within 50 miles of our store.
                    </p>

                    <p class="text-size-m">
                        Whether you're searching for crisp morning apples, sun-ripened tomatoes, or the perfect
                        potatoes for your family dinner, our friendly staff is here to help you discover nature's
                        finest selections.
                    </p>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <h2 class="text-size-l">Visit Us</h2>
                    <p class="text-size-m">
                        📍 123 Harvest Lane, Green Valley<br>
                        📞 (555) 123-4567<br>
                        🕒 Monday - Saturday: 8:00 AM - 8:00 PM<br>
                        🕒 Sunday: 9:00 AM - 6:00 PM
                    </p>
                </div>

                <div class="col-md-6">
                    <h2 class="text-size-l">This Week's Highlights</h2>
                    <p class="text-size-m">
                        🥕 Fresh Local Carrots<br>
                        🍎 Honeycrisp Apples<br>
                        🥬 Organic Lettuce<br>
                        🥔 Farm-Fresh Potatoes
                    </p>
                </div>

            </div>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>