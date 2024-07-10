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
                        <h1 class="mt-4">CATEGORY MANAGE</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">TOP 4 CATEGORIES</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <span class="col-12">${top[0].name!=null ? top[0].name :"Primary Card"} (${top[0].status!=null ? "Active" :"Deleted"}) </span>
<!--                                            <image style="width: 40px; height: 40px;" src="${top[0].image!=null ? top[0].image :"Primary Card"}"/>-->
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div class="col-4">${top[0].productNumber!=null ? top[0].productNumber :0} Products</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <span class="col-12">${top[1].name!=null ? top[1].name :"Category"} (${top[1].status!=null ? "Active" :"Deleted"})</span>
<!--                                            <image style="width: 40px; height: 40px;" src="${top[0].image!=null ? top[0].image :"Primary Card"}"/>-->
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div class="col-4">${top[1].productNumber!=null ? top[1].productNumber :0} Products</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <span class="col-12">${top[2].name!=null ? top[2].name :"Category"} (${top[2].status!=null ? "Active" :"Deleted"}) </span>
<!--                                            <image style="width: 40px; height: 40px;" src="${top[0].image!=null ? top[0].image :"Primary Card"}"/>-->
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div class="col-4">${top[2].productNumber!=null ? top[2].productNumber :0} Products</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <span class="col-12">${top[3].name!=null ? top[3].name :"Category"} (${top[3].status!=null ? "Active" :"Deleted"}) </span>
<!--                                            <image style="width: 40px; height: 40px;" src="${top[0].image!=null ? top[0].image :"Primary Card"}"/>-->
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div class="col-4">${top[3].productNumber!=null ? top[3].productNumber :0} Products</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-8">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Category Chart
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart1" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="my-3">
                            <a href="<c:url value='/MainServlet?btn=adminAddCategory'/>">
                                <button type="button" class="btn btn-primary">Add new category</button>
                            </a>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Category Manage
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Category ID</th>
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="category" items="${listCate}">
                                            <tr>
                                                <td>${category.categoryId}</td>
                                                <td>${category.name}</td>
                                                <td>${category.status ? "Active": "Deleted"}</td>
                                                <td>
                                                    <div class="hidden-sm hidden-xs btn-group">
                                                        <a href="<c:url value='/MainServlet?btn=adminGetUpdateCategory&categoryId=${category.categoryId}'/>">
                                                            <button class="btn btn-xs btn-sm">
                                                                <i class="fa-solid fa-pen-to-square fa-beat fa-lg" style="color: #24f59a;"></i>
                                                            </button>
                                                        </a>
                                                        <a href="<c:url value='/MainServlet?btn=adminGetDeleteCategory&categoryId=${category.categoryId}'/>">
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

            /// Biểu đồ cột.

            var barChartData = {

                labels: [<c:forEach var="item" items="${top}">'${item.name}',</c:forEach>'', ],
                        datasets: [
                            {
                                fillColor: "#47d4f7",
                                label: 'Category Name',
                                data: [<c:forEach var="item" items="${top}">${item.productNumber},</c:forEach>0, ],
                                backgroundColor: 'rgb(71, 212, 247)'
                            }]

            };
            new Chart(document.getElementById("myBarChart1").getContext("2d"), {
                type: 'bar',
                data: barChartData

            });
        </script>
    </body>
</html>
