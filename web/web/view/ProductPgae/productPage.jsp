<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="image/logo.png" type="image/png">
    <title>GroceryMart</title>
    <link rel="stylesheet" href="web/view/ProductPgae/productPage.css">
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
    <header class="header">
        <div class="container Logo">
            <img src="web/view/ProductPgae/image/logo.png" alt="logo">
            <div class="Logo-word">grocerymart</div>
        </div>
        <div class="navigation">
            <p>Departments</p>
            <img src="web/view/ProductPgae/image/down-arrow-5.png" alt="logo">
            <p>Grocery</p>
            <img src="web/view/ProductPgae/image/down-arrow-5.png" alt="logo"> 
            <p>Beauty</p>
            <img src="web/view/ProductPgae/image/down-arrow-5.png" alt="logo">
        </div>
        <span class="user-info">
            <div class="flexbox">
                <div class="search">
                    <div>
                        <input type="text" placeholder="Search . . ." required>
                    </div>
                </div>
            </div>
            <span class="user-profile">
                <div class="cart">
                    <img src="web/view/ProductPgae/image/cart.png" alt="cart">
                    <span>03</span>
                    <span>$65.42</span>
                </div>
                <img src="web/view/ProductPgae/image/user.png" alt="User">
            </span>
        </span>
    </header>
    <div class="container">
        <div class="product-page">
            <div class="product-image">
                <img src="web/view/ProductPgae/image/coffe1.png" alt="${product.name}">
            </div>
            <div class="product-details">
                <h1  style="font-size: 28px; text-align: center;" >${product.name} - ${product.description}</h1>
                
                <div class="size-additional" style="display: flex; justify-content: space-evenly;" >
                    <div class="size-weight">
                        <h2>Size/Weight</h2>
                        <div class="dropdowns">
                            <select>
                                <option value="500">500g</option>
                                <option value="1000">1000g</option>
                                <option value="1500">1500g</option>
                            </select>
                            
                        </div>
                        <div class="sizes">
                            <button class="size-btn">Small</button>
                            <button class="size-btn">Medium</button>
                            <button class="size-btn">Large</button>
                        </div>
                    </div>
                    <div class="additional-options">
                        <div><span></span> Compare</div>
                        <div><span></span> Delivery 
                            <span>From $6 for 1-3 days</span></div>
                        <div><span></span> Pickup 
                            <span>Out of 2 stores, today</span></div>
                    </div>
                </div>
                <div class="price-box"  style="margin-left: 480px;" >
                    <div class="price-discount">
                        <div class="original-price">$500.00</div>
                        <div class="discount">10% off</div>
                    </div>
                    <div class="current-price">$${product.price}</div>
                    <button class="add-to-cart">Add to cart</button>
                </div>
            </div>
        </div>
    </div>
    <div class="tabs-head">
        <div class="description-section">
            <div class="tabs">
                <button class="tab-button active" data-tab="description">Description</button>
                <button class="tab-button" data-tab="features">Features</button>
                <button class="tab-button" data-tab="reviews">Reviews (1100)</button>
                <button class="tab-button" data-tab="similar">Similar</button>
            </div>
            <div class="tab-content active" id="description">
                
                <p>${product.description}</p>
                <div class="img-des">
                    <img src="web/view/ProductPage/image/${product.image}" alt="${product.name}">
                </div>
            </div>
            <div class="tab-content" id="features">
               
                <p style="font-size: 16px; font-family: 'Arial', sans-serif; line-height: 1.6;">Coffee packaging function: The process of coffee packaging involves carefully selecting
                    and preparing freshly roasted coffee beans. These beans are then measured, <br/> sealed, and labeled according to specific quantities and types. Packaging ensures 
                    the preservation of coffee's aroma, flavor, and freshness, maintaining quality until it reaches consumers</p>
            </div>
            <div class="tab-content" id="reviews">
                <h2>Customer Reviews</h2>
                <p>Read what our customers are saying...</p>
            </div>
            <div class="tab-content" id="similar">
                <h2>Similar Products</h2>
                <p>Check out similar products...</p>
            </div>
        </div>
    </div>
    <script src="web/view/ProductPgae/js.js"></script>
</body>
<footer>
    <div class="footer-container">
        <div class="footer-column">
            <div class="footer-logo">
                <img src="web/view/ProductPgae/image/logo.png" alt="Grocery Mart Logo">
                <h2>grocerymart</h2>
            </div>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam, maxime et veniam eligendi rem voluptatibus.</p>
            <div class="newsletter">
                <p>Receive product news and updates.</p>
                <form action="#">
                    <input type="email" placeholder="Email address" required>
                    <button type="submit">SEND</button>
                </form>
            </div>
        </div>
        <div class="footer-column">
            <h3>SHOP</h3>
            <ul>
                <li><a href="#">All Departments</a></li>
                <li><a href="#">Fashion Deals</a></li>
                <li><a href="#">Electronics Discounts</a></li>
                <li><a href="#">Home & Living Specials</a></li>
                <li><a href="#">Beauty Bargains</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>SUPPORT</h3>
            <ul>
                <li><a href="#">Store Locator</a></li>
                <li><a href="#">Order Status</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>COMPANY</h3>
            <ul>
                <li><a href="#">Customer Service</a></li>
                <li><a href="#">Terms of Use</a></li>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Affiliates</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>CONTACT</h3>
            <p>Email: contact@grocerymart.com</p>
            <p>Hotline: 18008888</p>
            <p>Address: No. 11D, Lot A10, Nam Trung Yen urban area, Yen Hoa Ward, Cau Giay District, City. Hanoi</p>
            <p>Hours: M - F 08:00am - 06:00pm</p>
            <div class="social-icons">
                <a href="#"><img src="web/view/ProductPgae/image/facebook.jpeg" alt="Facebook"></a>
                <a href="#"><img src="web/view/ProductPgae/image/youtube.png" alt="YouTube"></a>
                <a href="#"><img src="web/view/ProductPgae/image/tiktok.jpeg" alt="TikTok"></a>
                <a href="#"><img src="web/view/ProductPgae/image/twet.png" alt="Twitter"></a>
                <a href="#"><img src="web/view/ProductPgae/image/link.jpeg" alt="LinkedIn"></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2010 - 2025 Grocery Mart. All rights reserved.</p>
    </div>
</footer>
</html>