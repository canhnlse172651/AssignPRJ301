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
            <div class="breadcrumbs">
            </div>

            <div class="checkout">                
                <div class="checkout-items">

                    <c:forEach var="item" items="${CART}">
                        <form action="MainServlet" method="post">
                            <div class="item">
                                <img src="${item.productImage}" alt="${item.productName}">
                                <div class="item-info">
                                    <h3>${item.productName}</h3>
                                    <p>$${item.price} <span class="in-stock">${item.stockQuantity > 0 ? "In stock" : "Out stock"}</span></p>
                                    <div class="item-controls">
                                        <select>
                                            <option>Trung Nguyên</option>
                                        </select>
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.stockQuantity}">
                                        <input type="hidden" value="${item.productId}" name="productId"/>
                                        <button type="submit" class="save" name="btn" value="updateCartUser">Save</button>
                                        <button class="delete" name="btn" value="deleteCartUser">Delete</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>

                </div>


                <div class="summary">
                    <div class="subtotal mb-3">
                        <div class="row">
                            <div class="col-6">Subtotal (items):</div>
                            <div class="col-6 text-end"> <b>${Subtotal}</b> items</div>
                        </div>
                        <div class="row">
                            <div class="col-6">Price (Total):</div>
                            <div class="col-6 text-end"> <b>${Total} </b> VNĐ</div>
                        </div>
                        <div class="row mb-1">
                            <div class="col-6">Shipping:</div>
                            <div class="col-6 text-end"> <b>50 0000 </b> VNĐ</div>
                        </div>
                        <div class="row px-3">---------------------------------------------------------</div>
                        <div class="row">
                            <div class="col-6">Estimated Total:</div>
                            <div class="col-6 text-end"> <b>${Total + 50000} </b> VNĐ</div>
                        </div>          

                    </div>
                        <form action="MainServlet" method="post">
                            <button type="submit" class='checkout-btn'${Subtotal > 0 ?  '': 'disabled '}
                                    name="btn" value="CheckoutCart">Continue to checkout</button>
                        </form>    
                    

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
            <!--            <div class="row px-3 mb-3">
                            <div class="col-9 rounded-2 shadow pb-3">
                                <h4 class="mb-3">Billing Address</h4>
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
                        </div>-->
        </main>

        <script src="web/view/AddToCart/js.js"></script>
    </body>

</html>
