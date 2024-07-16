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
        <div class="container Logo"  style ="margin-top: 15px">
            
            <div class="Logo-word">grocerymart</div>
        </div>
        <div class="navigation" style="margin-right: 00px" >
            <p>Home</p>
            <img src="web/view/AddToCart/image/down-arrow-5.png" alt="logo">
            <p>Manager</p>
            <img src="web/view/AddToCart/image/down-arrow-5.png" alt="logo"> 
            <p>Contact</p>
            <img src="web/view/AddToCart/image/down-arrow-5.png" alt="logo">
        </div>
        <span class="user-info">
            <div class="flexbox">
<!--                <div class="search">
                    <div>
                        <input style="width: 5px; height: 5px;" type="text" placeholder="Search . . ." required>
                    </div>
                </div>-->
            </div>
            <span class="user-profile">
                <div class="cart">
                    <img src="web/view/AddToCart/image/cart.png" alt="cart" style="margin-right: 10px"  >
                    <span style="margin-right: 10px" >${CART.size()}</span>
                   
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
                <c:forEach var="item" items="${CART}">
                    <div class="item">
                        <img src="${item.productImage}" alt="${item.productName}">
                        <div class="item-info">
                            <h3>${item.productName}</h3>
                            <p>$${item.price} <span class="in-stock">${item.stockQuantity > 0 ? "In stock" : "Out stock"}</span></p>
                            <div class="item-controls">
                                <select>
                                    <option>Trung Nguyên</option>
                                </select>
                                <input type="number" value="${item.quantity}" min="1">
                                <button class="save">Save</button>
                                <button class="delete">Delete</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
<!--            <div class="summary">
                <div class="subtotal">
                    <p>Subtotal (items): ${CART.size()}</p>
                    <c:set var="totalPrice" value="0" />
                    <c:forEach var="item" items="${CART}">
                        <c:set var="totalPrice" value="${totalPrice + (item.price * item.quantity)}" />
                    </c:forEach>
                    <p>Price (Total): $${totalPrice}</p>
                    <p>Shipping: $10.00</p>
                    <p id="total">Estimated Total: $${totalPrice + 10.00}</p>
                </div>
                <button class="checkout-btn">Continue to checkout</button>
                <div class="gift">
                    <p>Send this order as a gift.</p>
                    <p>Available items will be shipped to your gift recipient.</p>
                </div>
            </div>-->
        </div>
    </main>
  
    <script src="web/view/AddToCart/js.js"></script>
</body>

</html>
