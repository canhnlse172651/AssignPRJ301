<%-- 
    Document   : accountManage
    Created on : Jul 3, 2024, 3:20:57 PM
    Author     : LA DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/web/common/taglib.jsp" %>
<%@ page import="MODEL.Cate_Model" %>
<%@ page import="MODEL.Product_Model" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product - SB Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrQd2mkvkXj9O0MWkHi5D0qS6WldFf3djoXKXYrGV4rOvvf6hM4MZ4gJ8HlRBET5+t2x1hX0+3qI6rb+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="web/view/admin/styleAdmin/css/styles.css" rel="stylesheet" />
        <link href="web/view/admin/account/accountManage.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Hi, Admin</a>
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
                        <h1 class="mt-4">PRODUCT MANAGE</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">TOP 3 BEST SELLING PRODUCTS</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">
                                        <div class="text-uppercase" style="font-size: 20px;">top 1: ${top[0].name!=null ? top[0].name :"Product"}</div>
                                        <div>Size: ${top[0].size!=null ? top[0].size :"Small"}</div>
                                        <div>Stock quantity: ${top[0].stockQuantity!=null ? top[0].stockQuantity :"0"} products</div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div>${top[0].count!=null ? top[0].count :"0"} products sold</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">
                                        <div class="text-uppercase" style="font-size: 20px;">top 2: ${top[1].name!=null ? top[1].name :"Product"}</div>
                                        <div>Size: ${top[1].size!=null ? top[1].size :"Small"}</div>
                                        <div>Stock quantity: ${top[1].stockQuantity!=null ? top[1].stockQuantity :"0"} products</div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div>${top[1].count!=null ? top[1].count :"0"} products sold</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <div class="text-uppercase" style="font-size: 20px;">top 3: ${top[2].name!=null ? top[2].name :"Product"}</div>
                                        <div>Size: ${top[2].size!=null ? top[2].size :"Small"}</div>
                                        <div>Stock quantity: ${top[2].stockQuantity!=null ? top[2].stockQuantity :"0"} products</div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div>${top[2].count!=null ? top[2].count :"0"} products sold</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <!--                            <div class="col-xl-3 col-md-6">
                                                            <div class="card bg-danger text-white mb-4">
                                                                <div class="card-body">Danger Card</div>
                                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                                    <a class="small text-white stretched-link" href="#">View Details</a>
                                                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Inventory Product Chart
                                    </div>
                                    <div class="card-body"><canvas id="StockChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Best-selling Product Chart
                                    </div>
                                    <div class="card-body"><canvas id="PriceChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="my-3">
                            <a href="<c:url value='/MainServlet?btn=adminAddProduct'/>">
                                <button type="button" class="btn btn-primary">Add new product</button>
                            </a>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Product Manage
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Product ID</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Size</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="product" items="${listProduct}">
                                            <tr>
                                                <td>${product.id}</td>
                                                <td>${product.name}</td>
                                                <td>${product.categoryName}</td>                                                
                                                <td>${product.size}</td>
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>${product.status ? "active": "deleted" }</td>
                                                <td>
                                                    <div class="hidden-sm hidden-xs btn-group">
                                                        <a href="<c:url value='/MainServlet?btn=adminGetUpdateProduct&productId=${product.id}'/>">
                                                            <button class="btn btn-xs btn-sm">
                                                                <i class="fa-solid fa-pen-to-square fa-beat fa-lg" style="color: #24f59a;"></i>
                                                            </button>
                                                        </a>
                                                        <a href="<c:url value='/MainServlet?btn=adminGetDeleteProduct&productId=${product.id}'/>">
                                                            <button class="btn btn-xs btn-sm">
                                                                <i class="fa-solid fa-trash fa-beat fa-lg" style="color: #fb2109;"></i>
                                                            </button>
                                                        </a>
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
        <script>
            var barChartData = {

            labels: [<c:forEach var="item" items="${top}">'${item.name} - ${item.size}',</c:forEach>'', ],
                        datasets: [
                        {
                        fillColor: "#FC8213",
                                label:'Sold',
                                data: [<c:forEach var="item" items="${top}">${item.count},</c:forEach>0, ],
                                backgroundColor:'rgb(0, 143, 251)'
                        }]

                };
                new Chart(document.getElementById("PriceChart").getContext("2d"), {
                type: 'bar',
                        data: barChartData

                });
                /// Biều đồ đường.

                var lineChartData = {
                labels: [<c:forEach var="item" items="${top}">'${item.name}',</c:forEach>],
                        datasets: [
                        {
                        //fillColor: "#FC8213",
                        label:'Inventory products',
                                fill: true,
                                backgroundColor: "transparent",
                                borderColor: "rgb(255, 69, 96)",
                                data: [<c:forEach var="item" items="${top}">${item.stockQuantity},</c:forEach>],
                        }
                        ]

                };
                new Chart(document.getElementById("StockChart").getContext("2d"), {
                type: 'line',
                        data: lineChartData
                });
        </script>
    </body>
</html>
