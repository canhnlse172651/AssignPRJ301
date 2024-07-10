<%-- 
    Document   : accountManage
    Created on : Jul 3, 2024, 3:20:57 PM
    Author     : LA DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/web/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Category - SB Admin</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrQd2mkvkXj9O0MWkHi5D0qS6WldFf3djoXKXYrGV4rOvvf6hM4MZ4gJ8HlRBET5+t2x1hX0+3qI6rb+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="web/view/admin/styleAdmin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/Grocery/Logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">USER MANAGE</div>
                            <a class="nav-link" href="/Grocery/AccountServlet">
                                <div class="sb-nav-link-icon"><i class="fas fa-user fa-bounce"></i></div>
                                Account
                            </a>
                            <div class="sb-sidenav-menu-heading">STORE MANAGE</div>
                            <a class="nav-link" href="/Grocery/AdminCategoryServlet">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns fa-bounce"></i></div>
                                Category
                            </a>

                            <a class="nav-link" href="/Grocery/AdminProductServlet">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-mug-saucer fa-bounce"></i></div>
                                Product
                            </a>
                            <a class="nav-link" href="/Grocery/AdminOrderServlet">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-truck fa-bounce"></i></div>
                                Order
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Admin
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">ORDER MANAGE</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">ORDER MANGE</li>
                        </ol>

                        <div class="my-3 orderDetail">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                Launch demo modal
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            ...
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Order Manage
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Customer</th>
                                            <th>Order Date</th>
                                            <th>Delivery Date</th>
                                            <th>Total</th>
                                            <th>Status</th>
                                            <th>Payment Type</th>
                                            <th>Payment Status</th>
                                            <th>View Detail</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="order" items="${listOrder}">
                                            <tr>
                                                <td>${order.orderId}</td>
                                                <td>${order.fullName}</td>
                                                <td>${order.orderDate}</td>
                                                <td>${order.deliveryDate!= null ? order.deliveryDate : "Not yet"}</td>
                                                <td>${order.totalPrice}</td>
                                                <td>
                                                    <div class="d-flex justify-content-start">
                                                        <c:choose>
                                                            <c:when test="${order.status == 0}">
                                                                <i style="color:#0000FF"> Delivering</i>
                                                            </c:when>
                                                            <c:when test="${order.status == 1}">
                                                                <i style="color: #33FF33"> Succeed</i>
                                                            </c:when>
                                                            <c:when test="${order.status == 2}">
                                                                <i style="color: #FF6666"> Cancelled</i>
                                                            </c:when>                                                            
                                                            <c:otherwise>
                                                                <i style="color: orange"> Order status</i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex justify-content-start">
                                                        <c:choose>
                                                            <c:when test="${order.paymentType eq 'Credit Card'}">
                                                                <span> <i class="fa-solid fa-credit-card" style="color: #b95ee4;"></i>  Credit Card</span> 
                                                            </c:when>                                                                                
                                                            <c:otherwise>
                                                                <span> <i class="fa-solid fa-money-bill-wave" style="color: #63E6BE;"></i>  Cash</span> 

                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </td>
                                                <td>${order.paymentStatus==1 ? "Paid": "Unpaid"}</td>
                                                <td>
                                                    <div class="hidden-sm hidden-xs btn-group">                                                       
                                                        <button class="btn btn-xs btn-sm" data-toggle="modal" data-target="#exampleModalCenter">
                                                            <i class="fa-solid fa-pen-to-square fa-beat fa-lg" style="color: #24f59a;"></i>
                                                        </button>     
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="web/view/admin/styleAdmin/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="web/view/admin/styleAdmin/assets/demo/chart-area-demo.js"></script>
        <script src="web/view/admin/styleAdmin/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="web/view/admin/styleAdmin/js/datatables-simple-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
