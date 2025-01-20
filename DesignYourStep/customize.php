<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nike 2022 Collections</title>
    <style>
        body {
            background-color: #181818;
            color: white;
            font-family: sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 0;
        }

        .featured {
            text-align: center;
            margin-bottom: 40px;
        }

        .featured h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .featured p {
            font-size: 18px;
            line-height: 1.5;
        }

        .featured .image-container {
            position: relative;
            width: 300px;
            height: 300px;
            margin: 0 auto;
        }

        .featured .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .featured .image-container .discount {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background-color: #fff;
            color: #181818;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .featured .image-container .discount .percent {
            font-weight: bold;
            font-size: 14px;
        }

        .featured .image-container .discount .text {
            font-size: 12px;
        }

        .featured .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .featured .buttons button {
            background-color: #fff;
            color: #181818;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .categories {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .categories .category {
            text-align: center;
            width: calc(100% / 9);
        }

        .categories .category h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .categories .category p {
            font-size: 14px;
        }

        .products {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .product {
            width: calc(100% / 3 - 20px);
            background-color: #282828;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product .image-container {
            width: 100%;
            height: 200px;
            overflow: hidden;
            border-radius: 10px;
        }

        .product .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product .title {
            font-size: 18px;
            margin-top: 10px;
        }

        .product .price {
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }

        .product .rating {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .product .rating i {
            font-size: 14px;
            color: #ffc107;
        }

        .product .rating .count {
            font-size: 12px;
            margin-left: 5px;
        }

        .product .button {
            background-color: #fff;
            color: #181818;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .product .button:hover {
            background-color: #e9e9e9;
        }

        .we-provide {
            text-align: center;
            margin-bottom: 40px;
        }

        .we-provide h2 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .we-provide p {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .we-provide .button {
            background-color: #fff;
            color: #181818;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .we-provide .button:hover {
            background-color: #e9e9e9;
        }

        .just-dropped {
            text-align: center;
            margin-bottom: 40px;
        }

        .just-dropped h2 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .just-dropped p {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .just-dropped .products {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .just-dropped .product {
            width: calc(100% / 4 - 20px);
            background-color: #282828;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .just-dropped .product .image-container {
            width: 100%;
            height: 200px;
            overflow: hidden;
            border-radius: 10px;
        }

        .just-dropped .product .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .just-dropped .product .title {
            font-size: 18px;
            margin-top: 10px;
        }

        .just-dropped .product .price {
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }

        .just-dropped .product .rating {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .just-dropped .product .rating i {
            font-size: 14px;
            color: #ffc107;
        }

        .just-dropped .product .rating .count {
            font-size: 12px;
            margin-left: 5px;
        }

        .just-dropped .product .button {
            background-color: #fff;
            color: #181818;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .just-dropped .product .button:hover {
            background-color: #e9e9e9;
        }

        /* Footer */
        footer {
            background-color: #101010;
            padding: 20px 0;
            margin-top: 40px;
            text-align: center;
        }

        footer p {
            color: #808080;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="featured">
            <h1>NIKE 2022 COLLECTIONS</h1>
            <p>Inspiring the world's athletes, Nike delivers innovative products, experiences and services.</p>
            <div class="buttons">
                <button>Shop Now</button>
                <button>Add to Bag</button>
            </div>
            <div class="image-container">
                <img src="images/BJ2.jpeg" alt="Nike Shoe">
                <div class="discount">
                    <div class="percent">Get upto 30% off</div>
                    <div class="text">You can get 30% discount from here</div>
                </div>
            </div>
        </div>
        <div class="categories">
            <div class="category">
                <h2>GOLF</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2>FOOTBALL</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2>TRACING</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2>SOCCER</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2>WALKING</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2>TENNIS</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2>BASEBALL</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2>SKATEBOARDING</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category">
                <h2></h2>
                <p></p>
            </div>
        </div>
        <div class="we-provide">
            <h2>WE PROVIDE MODERN SHOES</h2>
            <p>Design for the way you live your life. Atoms are beautiful in their simplicity, supporting your feet with absolute comfert.</p>
            <div class="image-container">
                <img src="images/BJ2.jpeg" alt="Nike Shoe">
            </div>
            <button>Explore More</button>
        </div>
        <div class="just-dropped">
            <h2>JUST DROPPED</h2>
            <p>Design for the way you live your life. Atoms are beautiful in their simplicity, supporting your feet with absolute comfert.</p>
            <div class="products">
                <div class="product">
                    <div class="image-container">
                        <img src="images/BJ2.jpeg" alt="Nike Shoe">
                    </div>
                    <div class="title">NIKE AIR JORDAN 2 MED SE GS</div>
                    <div class="price">$127.45</div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span class="count">(4.5)</span>
                    </div>
                    <button>Add to Cart</button>
                </div>
                <div class="product">
                    <div class="image-container">
                        <img src="images/BJ2.jpeg" alt="Nike Shoe">
                    </div>
                    <div class="title">NIKE AIR JORDAN 2 MED SE GS</div>
                    <div class="price">$127.45</div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span class="count">(4.5)</span>
                    </div>
                    <button>Add to Cart</button>
                </div>
                <div class="product">
                    <div class="image-container">
                        <img src="images/BJ2.jpeg" alt="Nike Shoe">
                    </div>
                    <div class="title">NIKE AIR JORDAN 2 MED SE GS</div>
                    <div class="price">$127.45</div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span class="count">(4.5)</span>
                    </div>
                    <button>Add to Cart</button>
                </div>
                <div class="product">
                    <div class="image-container">
                        <img src="images/BJ2.jpeg" alt="Nike Shoe">
                    </div>
                    <div class="title">NIKE AIR JORDAN</div>
                    <div class="price"></div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span class="count">(4.5)</span>
                    </div>
                    <button>Add to Cart</button>
                </div>
            </div>
        </div>
        <footer>
            <p>&copy; 2023 Nike. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>