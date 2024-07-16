<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/logo.png" type="image/png">
        <title>GroceryMart</title>
        <link rel="stylesheet" href="web/view/HomePage/homePageStyle.css">

  <style>
     .search > div:after {
          content: "";
          background: black;
          width: 4px;
          height: 20px;
          position: absolute;
          top: 22px;
          right: -2px;
          transform: rotate(140deg);
      }
    </style>
    </head>
    <body>
        <header class="header">
            <div class="container Logo">
                <img src="web/view/HomePage/image/logo.png" alt="logo">
                <div class="Logo-word">grocerymart</div>
            </div>
            <div class="navigation">

                <p>
                    Departments  
                </p>
                <img src="web/view/HomePage/image/down-arrow-5.png" alt="logo">

                <p>
                    Grocery
                </p>
                <img src="web/view/HomePage/image/down-arrow-5.png" alt="logo"> 
                <p>
                    Beauty
                </p>
                <img src="web/view/HomePage/image/down-arrow-5.png" alt="logo">
            </div>
            <span class="user-info">
                <div class="flexbox">
                    <div class="search">
                        <div>
                            <input style="width: 5px; height: 5px;" type="text" placeholder="Search . . ." required>
                        </div>
                    </div>
                </div>

                <span class="user-profile">
                    <div class="cart">
                        <a href="MainServlet?btn=viewCart" > <img src="web/view/HomePage/image/cart.png" alt=cart></a>
                        <span>03</span>
                        <span>$65.42</span>
                    </div>
                    <img src="web/view/HomePage/image/user.png" alt="User">
                </span>
            </span>
        </header>
        <div class="container">
            <aside class="sidebar">
                <h1>Categories</h1>
                <ul class="categories">
                    
                    <c:forEach items="${categories}" var="category">
                        <li class="category-item">
                            <a style="gap: 15px; width: 100%; display: flex; align-items: center;" href="HomeServlet?category_id=${category.categoryId}">
                                <img src="web/view/HomePage/image/coffee-cup-logo-template-vector-icon-design_preview_rev_1.png" alt="">
                                <span>${category.name}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </aside>

            <main class="content">

                <div class="banner-image">
                    <img src="web/view/HomePage/image/item-1.png" alt="Coffee Beans">
                </div>

                <div class="fliter">
                    <p style="margin: 15px 0" >List Product By Category</p>

                </div>
                <div class="product-list">
                    <c:forEach var="product" items="${productLists}">
                        <form action="MainServlet" method="post">
                            <div class="product-card" style="padding: 40px; width: 200px; height: 350px;">
                                <img src="web/view/HomePage/image/coffe3.png" alt="${product.name}">
                                <h3><span >${product.id}</span></h3>
                                <div class="Branch">
                                    <p>Lava highland</p>
                                </div>
                                <div class="price-rating">
                                    <div class="price">Price: ${product.price}</div>
                                </div>
                                <input type="hidden" name="productId" value="${product.id}">
                                <button style="
                                        cursor: pointer;
                                        background-color: #4CAF50;
                                        color: white; /* White text */
                                        border: none; /* Remove borders */
                                        padding: 10px 20px; /* Add some padding */
                                        font-size: 16px; /* Increase font size */
                                        margin-bottom: 10px;
                                        transition-duration: 0.4s; /* Animation duration */
                                        border-radius: 8px; /* Rounded corners */
                                        " type="submit" name="btn" value="productDetail">
                                    View Details
                                </button>
                            </div>
                        </form>
                    </c:forEach>
                </div>

            </main>
        </div>
        <footer>
            <div class="footer-container">
                <div class="footer-column">
                    <div class="footer-logo">
                        <img src="web/view/HomePage/image/logo.png" alt="Grocery Mart Logo">
                        <h2>grocerymart</h2>
                    </div>
                    <p>We are one and only</p>
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
                       
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>CONTACT US</h3>

                    <p style="margin-bottom: 10px;">Email: contact@grocerymart.com</p>
                    <p style="margin-bottom: 10px;">Hotline: 18008888</p>

                    <div class="social-icons">

                        <a href="#"><img src="web/view/HomePage/image/youtube.png" alt="YouTube"></a>

                        <a href="#"><img src="web/view/HomePage/image/twet.png" alt="Twitter"></a>
                        <a href="#"><img src="web/view/HomePage/image/link.jpeg" alt="LinkedIn"></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2010 - 2025 Grocery Mart. All rights reserved.</p>
            </div>
        </footer>
        <script src="web/view/HomePage/js.js" ></script>
    </body>
</html>


