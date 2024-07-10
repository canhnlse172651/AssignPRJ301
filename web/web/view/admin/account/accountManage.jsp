<%-- 
    Document   : accountManage
    Created on : Jul 3, 2024, 3:20:57 PM
    Author     : LA DAT
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/web/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrQd2mkvkXj9O0MWkHi5D0qS6WldFf3djoXKXYrGV4rOvvf6hM4MZ4gJ8HlRBET5+t2x1hX0+3qI6rb+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="web/view/admin/styleAdmin/css/styles.css" rel="stylesheet" />
        <link href="web/view/admin/account/accountManage.css" rel="stylesheet" />
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
                        <h1 class="mt-4">ACCOUNT MANAGE</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">TOP 3 LOYAL CUSTOMERS</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">
                                        <div><b>Top 1: </b> ${top[0].fullName}<span>       </span>  <i class="fa-solid fa-trophy fa-2xl" style="color: #FFC717;"></i></div>
                                        <div><b>Phone: </b>${top[0].phone}</div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                       <div>${top[0].numberOrdered} Orders</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card text-white mb-4" style="background-color: #ffcc66;">
                                    <div class="card-body">
                                        <div><b>Top 2: </b> ${top[1].fullName} <span>       </span>  <i class="fa-solid fa-trophy fa-2xl" style="color: #c1c5cd;"></i></div> 
                                        <div><b>Phone: </b>${top[1].phone}</div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <div>${top[1].numberOrdered} Orders</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                         <div><b>Top 3: </b> ${top[2].fullName} <span>       </span>  <i class="fa-solid fa-trophy fa-2xl" style="color: #bb8438;"></i></div> 
                                        <div><b>Phone: </b>${top[2].phone}</div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                         <div>${top[2].numberOrdered} Orders</div>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="my-3 mt-5">
                            <a href="<c:url value='/MainServlet?btn=adminAddAccount'/>">
                            <button type="button" class="btn btn-success">Add new account</button>
                            </a>
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Account Manage
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>User ID</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>Number Ordered</th>
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Address</th>
                                            <th>Role</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="user" items="${listUser}">
                                            <tr>
                                                <td>${user.userId}</td>
                                                <td>${user.userName}</td>
                                                <td>${user.password}</td>
                                                <td>${user.fullName}</td>
                                                <td>${user.email}</td>
                                                <td>${user.numberOrdered}</td>
                                                <td>${user.phone}</td>
                                                <td>${user.status ? "active": "deleted" }</td>
                                                <td>${user.address}</td>
                                                <td >${user.role ? "admin":"customer"}</td>
                                                <td>
                                                    <div class="hidden-sm hidden-xs btn-group">
                                                        <a href="<c:url value='/MainServlet?btn=adminGetUpdateAccount&userId=${user.userId}'/>">
                                                            <button class="btn btn-xs btn-sm">
                                                                <i class="fa-solid fa-pen-to-square fa-beat fa-lg" style="color: #24f59a;"></i>
                                                            </button>
                                                        </a>
                                                        <a href="<c:url value='/MainServlet?btn=adminGetDeleteAccount&userId=${user.userId}'/>">
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
    </body>
</html>
