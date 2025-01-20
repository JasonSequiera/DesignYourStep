<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="products.css">
    <script src="products.js"></script>
    <style>
        button {
    padding: 15px 25px;
    border: unset;
    border-radius: 15px;
    color: #212121;
    z-index: 1;
    background: #e8e8e8;
    position: relative;
    font-weight: 1000;
    font-size: 17px;
    -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
    box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
    transition: all 250ms;
    overflow: hidden;
    left: 900px;
    top: 85px;
   }
   
   button::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 0;
    border-radius: 15px;
    background-color: #212121;
    z-index: -1;
    -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
    box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
    transition: all 250ms
   }
   
   button:hover {
    color: #e8e8e8;
   }
   
   button:hover::before {
    width: 100%;
   }
    </style>
</head>
<body>
    <main>
    <section class="hero">
            <div class="hero-content">
                <h4>Air Jordan 1</h4>
                <h1>MID SE</h1>
                <p>Who said you can't have it all? With these bold colors, you will steal the show. And so comfortable that you always feel fast and fresh.</p>
                <br><button onclick="openCustomizer('model1')">Customize</button>
            </div>
            <div class="hero-image">
                <img src="images/RJ.jpeg" alt="Sneaker">
            </div>
        </section>
        <section class="hero">
            <div class="hero-content">
                <h4>Air Jordan 1</h>
                <h1>MID XLE</h1>
                <p>Who said you can't have it all? With these bold colors, you will steal the show. And so comfortable that you always feel fast and fresh.</p>
                <br><br><button onclick="openCustomizer('model2')">Customize</button><br>
            </div>
            <div class="hero-image">
                <img src="images/MJ.jpeg" alt="Sneaker">
            </div>
        </section>
        <section class="hero">
            <div class="hero-content">
                <h4>Air Jordan 1</h>
                <h1>MID XSE</h1>
                <p>Who said you can't have it all? With these bold colors, you will steal the show. And so comfortable that you always feel fast and fresh.</p>
            </div>
            <div class="hero-image">
                <img src="images/GJ.jpeg" alt="Sneaker">
            </div>
        </section>
        <section class="hero">
            <div class="hero-content">
                <h4>Air Jordan 1</h>
                <h1>MID FE</h1>
                <p>Who said you can't have it all? With these bold colors, you will steal the show. And so comfortable that you always feel fast and fresh.</p>
            </div>
            <div class="hero-image">
                <img src="images/MJ2.jpeg" alt="Sneaker">
            </div>
        </section>
        <section class="hero">
            <div class="hero-content">
                <h4>Air Jordan 1</h>
                <h1>MID XE</h1>
                <p>Who said you can't have it all? With these bold colors, you will steal the show. And so comfortable that you always feel fast and fresh.</p>
            </div>
            <div class="hero-image">
                <img src="images/BJ2.jpeg" alt="Sneaker">
            </div>
        </section>
        <div id="customizerModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeCustomizer()">&times;</span>
                <iframe id="customizerFrame" src="" width="100%" height="600px"></iframe>
            </div>
        </div>
    </main>
</body>
</html>
