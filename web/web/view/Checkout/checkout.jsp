<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/web/common/taglib.jsp" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/logo.png" type="image/png">
        <title>GroceryMart</title>
        <link rel="stylesheet" href="web/view/AddToCart/cart.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body{
                background-color: #eeeeee;
            }
            .text-small{
                font-size: 11px;
            }
            .textColor{
                color: #77DAE6;
            }
            .card {
                background-color: #f6feff ;
                border:1px solid #77DAE6;
            }
            .radio-label {
                cursor: pointer;
            }
            .hidden {
                display: none;
            }
            .borderCk{
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <div class="container Logo">
                <img src="web/view/AddToCart/image/logo.png" alt="logo">
                <div class="Logo-word pt-5">grocerymart</div>
            </div>
            <div class="navigation me-5 pt-3">
                <p>Home</p>
                <i class="fa-solid fa-chevron-down pt-1 px-1" style="color: #3b3d40;"></i>
                <p>Manager</p>
                <i class="fa-solid fa-chevron-down pt-1 px-1" style="color: #3b3d40;"></i>
                <p>Contact</p>
                <i class="fa-solid fa-chevron-down pt-1 px-1" style="color: #3b3d40;"></i>
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
            <form action="MainServlet" method="post">
                <div class="row">
                    <div class="col-9 pe-3">
                        <div class="row px-3 my-3 ">
                            <div class="borderCk shadow py-3 bg-white">
                                <h4 class="mb-3 textColor">Billing Address</h4>
                                <div class="input-group flex-nowrap mb-3">
                                    <span class="input-group-text" id="addon-wrapping">Name</span>
                                    <input type="text" class="form-control" placeholder="Full Name" aria-label="Full Name" aria-describedby="addon-wrapping"
                                           name="fullName" value="${USER.fullName}">
                                </div>
                                <div class="input-group flex-nowrap mb-3">
                                    <span class="input-group-text" id="addon-wrapping">Address</span>
                                    <input type="text" class="form-control" placeholder="Address" aria-label="Address" aria-describedby="addon-wrapping"
                                           name="address" value="${USER.address}">
                                </div>
                                <div class="input-group flex-nowrap mb-3">
                                    <span class="input-group-text" id="addon-wrapping">Phone</span>
                                    <input type="number" class="form-control" placeholder="Phone" aria-label="Phone" aria-describedby="addon-wrapping"
                                           name="phone" value="${USER.phone}"/>
                                </div>
                            </div>
                        </div>
                        <div class="row px-3 my-3">
                            <div class=" col-12 borderCk shadow py-3 bg-white">
                                <h4 class="textColor">Select shipping method</h4>
                                <div class="row">
                                    <div class="col-5 rounded-3 shadow py-1 card m-2">

                                        <label for="option1" class="radio-label">   

                                            <div class="row">
                                                <div class="col-1 pt-4">
                                                    <input type="radio" id="option1" name="shippingOption" class="radio-input" value="fast" checked onclick="updateTotalPrice()">
                                                </div >
                                                <div class="col-2 pt-4">
                                                    <i class="fa-solid fa-truck-fast fa-2xl" style="color: #0c83df;"></i>
                                                </div >
                                                <div class="col-8">
                                                    <h5 >Express Deliver</h5>
                                                    <div>Price: $5</div>
                                                    <div class="">Delivery in 10 days</div>
                                                </div>
                                            </div>                                           
                                        </label>
                                    </div>                                    
                                    <div class="col-5 borderCk shadow py-1 card my-2 ms-4">
                                        <label for="option2" class="radio-label">                                           
                                            <div class="row">
                                                <div class="col-1 pt-4">
                                                    <input type="radio" id="option2" name="shippingOption" class="radio-input" value="regular" onclick="updateTotalPrice()">
                                                </div >
                                                <div class="col-2 pt-4">
                                                    <i class="fa-solid fa-motorcycle fa-2xl" style="color: #0c83df;"></i>
                                                </div >
                                                <div class="col-9">
                                                    <h5 >Regular shipping</h5>
                                                    <div>Price: $2</div>
                                                    <div class="">Delivery in 15 days</div>
                                                </div>

                                            </div>

                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row px-3 my-3">
                            <div class="borderCk shadow py-3 bg-white">
                                <h4 class="textColor">Item detail</h4>
                                <div class=" my-3">
                                    <c:forEach var="item" items="${CART}">
                                        <div class="row my-2 border-bottom mx-3">
                                            <div class="col-2">
                                                <img class="w-75 h-75" src="${item.productImage}" alt="${item.productName}">
                                            </div>
                                            <div class="col-10">
                                                <h3>${item.productName}</h3>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <p>${item.price} <span class="text-success">${item.stockQuantity > 0 ? "In stock" : "Out stock"}</span></p>
                                                    </div>
                                                    <div class="col-4">
                                                        <p>x ${item.quantity} <span class="in-stock">items</span></p>
                                                    </div>
                                                    <div class="col-4 ">
                                                        <p class="text-warning"><span class="text-dark"> = $</span><b> ${item.price * item.quantity} </b></p>
                                                    </div>
                                                </div>                                                    
                                                <div class="item-controls">
                                                    <select>
                                                        <option>${item.size}</option>
                                                    </select>                                                     
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="row py-3 px-2">
                            <div class="payment-methods borderCk shadow py-3 bg-white">
                                <h4 class="textColor">Payment Method</h4>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentMethod" id="cash" value="cash" checked>
                                    <label class="form-check-label" for="cash">
                                        Pay in cash <i class="fa-solid fa-money-bill-1-wave fa-lg" style="color: #63E6BE;"></i>
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentMethod" id="card" value="card">
                                    <label class="form-check-label" for="card">
                                        Credit card <i class="fa-solid fa-credit-card fa-lg" style="color: #B197FC;"></i>
                                    </label>
                                </div>
                            </div>                            
                        </div>
                        <!-- Card Details -->
                        <div id="cardDetails" class="row hidden borderCk shadow py-3 bg-white px-3"  >
                            <div class="col-12 my-3">
                                <div class="input-group flex-nowrap mb-3">
                                    <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-id-card" style="color: #4d8efe;"></i></span>
                                    <input type="text" class="form-control" placeholder="Card Number" aria-label="Card Number"
                                           aria-describedby="addon-wrapping" name="cardNumber">
                                </div>
                                <div class="input-group flex-nowrap mb-3">
                                    <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-building-columns" style="color: #4d8efe;"></i></span>
                                    <input type="text" class="form-control" placeholder="Bank Name" aria-label="Expiry Date"
                                           aria-describedby="addon-wrapping" name="bankName">
                                </div>
                                <div class="input-group flex-nowrap mb-3">
                                    <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-user-tag" style="color: #4d8efe;"></i></span>
                                    <input type="text" class="form-control" placeholder="Owner" aria-label="CVV"
                                           aria-describedby="addon-wrapping" name="owner">
                                </div>
                            </div>
                        </div>

                        <div class="summary w-100 my-3">
                            <div class="subtotal mb-3">
                                <div class="row">
                                    <div class="col-6">Subtotal (items):</div>
                                    <div class="col-6 text-end"> <b>${Subtotal}</b> items</div>
                                </div>
                                <div class="row">
                                    <div class="col-6">Price (Total):</div>
                                    <div class="col-6 text-end"> $<b>${Total} </b></div>
                                </div>
                                <div class="row mb-1">
                                    <div class="col-6">Shipping:</div>
                                    <div class="col-6 text-end"> <b id='shipping'>$5 </b></div>
                                </div>
                                <div class="row px-3">---------------------------------------------------------</div>
                                <div class="row">
                                    <div class="col-6">Estimated Total:</div>
                                    <div class="col-6 text-end"  > $<b id='totalPrice' name='totalPrice'>${Total} </b></div>
                                    <input type="hidden" id="totalPriceValue" name="totalPriceValue">
                                </div>        

                            </div>

                            <button type="submit" class='checkout-btn'${Subtotal > 0 ?  '': 'disabled '}
                                    name="btn" value="CheckoutOrder">Checkout</button>
                            <div class="gift">
                                <div class="row">
                                    <div class="col-2 py-2"><i class="fa-solid fa-gift fa-2xl" style="color: #B197FC;"></i></div>
                                    <div class="col-10">
                                        <div class="text-start">Send this order as a gift.</div>
                                        <h6 class="text-start text-small">Available items will be shipped to your gift recipient.</h6>
                                    </div>
                                </div>                        
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </main>

        <script src="web/view/AddToCart/js.js"></script>
        <script>
                                                        document.addEventListener('DOMContentLoaded', function () {
                                                            const paymentMethods = document.querySelectorAll('input[name="paymentMethod"]');
                                                            const cardDetails = document.getElementById('cardDetails');

                                                            paymentMethods.forEach(method => {
                                                                method.addEventListener('change', function () {
                                                                    if (this.value === 'card') {
                                                                        cardDetails.classList.remove('hidden');
                                                                    } else {
                                                                        cardDetails.classList.add('hidden');
                                                                    }
                                                                });
                                                            });
                                                        });
        </script>
        <script type="text/javascript">
            function updateTotalPrice() {
                var basePrice = <%= request.getAttribute("Total")%>;// Giá cơ bản
                var totalPrice = basePrice;
                var ship = 50000;
                var shippingOptions = document.getElementsByName("shippingOption");

                for (var i = 0; i < shippingOptions.length; i++) {
                    if (shippingOptions[i].checked) {
                        if (shippingOptions[i].value === "fast") {
                            totalPrice += 5;
                            ship = 5;
                        } else if (shippingOptions[i].value === "regular") {
                            totalPrice += 2;
                            ship = 2;
                        }
                        break;
                    }
                }
                shipping
                document.getElementById("totalPrice").innerText = totalPrice;
                document.getElementById("totalPriceValue").value = totalPrice;
                document.getElementById("shipping").innerText = ship;
            }
        </script>
    </body>

</html>
