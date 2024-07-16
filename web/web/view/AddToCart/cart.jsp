<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="image/logo.png" type="image/png">
    <title>GroceryMart</title>
    <link rel="stylesheet" href="web/view/AddToCart/cart.css">
    
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
      <header class="header">
        <div class="container Logo">
            <img src="web/view/AddToCart/image/logo.png" alt="logo">
            <div class="Logo-word">grocerymart</div>
        </div>
        <div class="navigation">
            <p>Departments</p>
            <img src="web/view/AddToCart/image/down-arrow-5.png" alt="logo">
            <p>Grocery</p>
            <img src="web/view/AddToCart/image/down-arrow-5.png" alt="logo"> 
            <p>Beauty</p>
            <img src="web/view/AddToCart/image/down-arrow-5.png" alt="logo">
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
                    <img src="web/view/AddToCart/image/cart.png" alt="cart">
                    <span>03</span>
                    <span>$65.42</span>
                </div>
                <img src="web/view/AddToCart/image/user.png" alt="User">
            </span>
        </span>
    </header>
    
     <main class="container">
        <div class="breadcrumbs">
          
        </div>
        <div class="checkout">
            <div class="checkout-items">
                <div class="item">
                    <img src="web/view/AddToCart/image/coffe1.png" alt="Coffee Beans">
                    <div class="item-info">
                        <h3>Coffee Beans - Espresso Arabica and Robusta Beans</h3>
                        <p>$47.00 <span class="in-stock">In Stock</span></p>
                        <div class="item-controls">
                            <select>
                                <option>LavAzza</option>
                            </select>
                            <input type="number" value="1">
                            <button class="save">Save</button>
                            <button class="delete">Delete</button>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="web/view/AddToCart/image/coffe2.png" alt="Lavazza Coffee Blends">
                    <div class="item-info">
                        <h3>Lavazza Coffee Blends - Try the Italian Espresso</h3>
                        <p>$106.00 <span class="in-stock">In Stock</span></p>
                        <div class="item-controls">
                            <select>
                                <option>LavAzza</option>
                            </select>
                            <input type="number" value="2">
                            <button class="save">Save</button>
                            <button class="delete">Delete</button>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="web/view/AddToCart/image/coffe3.png" alt="Qualità Oro Mountain Grown">
                    <div class="item-info">
                        <h3>Qualità Oro Mountain Grown - Espresso Coffee Beans</h3>
                        <p>$38.65 <span class="in-stock">In Stock</span></p>
                        <div class="item-controls">
                            <select>
                                <option>LavAzza</option>
                            </select>
                            <input type="number" value="1">
                            <button class="save">Save</button>
                            <button class="delete">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="summary">
                <div class="subtotal">
                    <p>Subtotal (items): 3</p>
                    <p>Price (Total): $191.65</p>
                    <p>Shipping: $10.00</p>
                    <p id="total">Estimated Total: $201.65</p>
                </div>
                <button class="checkout-btn">Continue to checkout</button>
                <div class="gift">
                    <p>Send this order as a gift.</p>
                    <p>Available items will be shipped to your gift recipient.</p>
                </div>
            </div>
        </div>
    </main>
  
    <script src="web/view/AddToCart/js.js"></script>
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
