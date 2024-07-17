<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/logo.png" type="image/png">
        <title>GroceryMart</title>
        <link rel="stylesheet" href="web/view/HomePage/homePageStyle.css">

        <!-- Bao g?m CSS c?a Slick -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>

        <!-- Bao g?m JavaScript c?a Slick -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            .navigation {
                gap: 50px;
            }
        </style>
    </head>
    <body>
        <header class="header row">
            <div class="container Logo">
                <img src="web/view/HomePage/image/logo.png" alt="logo">
                <div class="Logo-word">grocerymart</div>
            </div>
            <div class="navigation">
                <a href="/Grocery/HomeServlet"> Home </a>
                <a href="/Grocery/AccountServlet">
                    Manage
                </a>
                <a href="/Grocery/Contact">Contact</a>

            </div>
            <div class="user-info">
                <span class="user-profile">
                    <div class="cart">
                        <a href="MainServlet?btn=viewCart" > <img src="web/view/HomePage/image/cart.png" alt=cart></a>
                    </div>
                    <img src="web/view/HomePage/image/user.png" alt="User"/> 
                </span>
                <a href="/Grocery/Logout"><div class="back-logout" ><i class="fa-solid fa-right-from-bracket fa-xl" style=" color: #000000; margin-left: 10px; cursor : pointer" title="Logout"></i></div> </a>
            </div>
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
                <div class ="product-slider" >
                    <button class="slick-prev">Previous</button>
                    <div class="product-list">
                        <c:forEach var="product" items="${productLists}">
                            <form action="MainServlet" method="post">
                                <div class="product-card" style="padding: 40px; width: 200px; height: 350px; margin-top: 30px">
                                    <img src=${product.image} alt="${product.name}">
                                    <h3><span >${product.name}</span></h3>
                                    <div class="Branch">
                                        <p style="text-align: center" >Lava highland</p>
                                    </div>
                                    <div class="price-rating" style="display: block" >
                                        <div style="margin-top: 10px" class="price">Price: ${product.price}</div>
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

                                <div class="product-card" style="padding: 40px; width: 200px; height: 350px; margin-top: 30px">
                                    <img src=${product.image} alt="${product.name}">
                                    <h3><span >${product.name}</span></h3>
                                    <div class="Branch">
                                        <p style="text-align: center" >Lava highland</p>
                                    </div>
                                    <div class="price-rating" style="display: block" >
                                        <div style="margin-top: 10px" class="price">Price: ${product.price}</div>
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
                        <button class="slick-next">Next</button>
                    </div>

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

        <script>
            $(document).ready(function () {
                $('.product-list').slick({
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 2000,
                    responsive: [
                        {
                            breakpoint: 768,
                            settings: {
                                slidesToShow: 2
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1
                            }
                        }
                    ]
                });

                // Kích ho?t các nút ?i?u khi?n
                $('.slick-prev').click(function () {
                    $('.product-list').slick('slickPrev');
                });

                $('.slick-next').click(function () {
                    $('.product-list').slick('slickNext');
                });
            });
        </script>
    </body>
</html>


