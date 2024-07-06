<%-- 
    Document   : accountManage
    Created on : Jul 3, 2024, 3:20:57 PM
    Author     : LA DAT
--%>

<%@page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/web/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Update Account - SB Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrQd2mkvkXj9O0MWkHi5D0qS6WldFf3djoXKXYrGV4rOvvf6hM4MZ4gJ8HlRBET5+t2x1hX0+3qI6rb+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="web/view/admin/styleAdmin/css/styles.css" rel="stylesheet" />
        <link href="web/view/admin/account/accountManage.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Hello Admin</a>
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
                            <a class="nav-link collapsed" href="/Grocery/AdminCategoryServlet" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns fa-bounce"></i></div>
                                Category
                            </a>

                            <a class="nav-link collapsed" href="/Grocery/AdminProductServlet" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-mug-saucer fa-bounce"></i></div>
                                Product
                            </a>
                            <a class="nav-link collapsed" href="/Grocery/AdminOrderServlet" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
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
                    <div class="container-fluid ">
                        <h1 class="mt-4 px-5">Update account</h1>
                        <form id="registrationForm" action="MainServlet" method="post">
                            <div class="row px-5 mb-3">
                                <div class="col-6">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" value="${userUpdate.userName}" readonly required>
                                </div>
                                <div class="col-6">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${userUpdate.userName}" required>
                                </div>
                            </div>
                            <div class="row px-5 mb-3">
                                <div class="col-6">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${userUpdate.email}" required>
                                </div>
                                <div class="col-6">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" value="${userUpdate.password}" required>
                                </div>
                            </div>
                            <div class="row px-5 mb-3">
                                <div class="col-6">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" value="${userUpdate.address}" required>
                                </div>
                                <div class="col-6">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="number" class="form-control" id="phone" name="phone" value="${userUpdate.phone}" required>
                                </div>

                            </div>    
                            <div class="row px-5 mb-3">
                                <div class="col-3">
                                    <label for="role" class="form-label">Role</label>
                                    <select class="form-control" id="role" name="role" required>
                                        <option value="0" ${!userUpdate.role ? "selected" : ""}>Customer</option>
                                        <option value="1" ${userUpdate.role ? "selected" : ""}>Admin</option>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <label for="status" class="form-label">Status</label>
                                    <select class="form-control" id="status" name="status" required>
                                        <option value="0" ${!userUpdate.status ? "selected" : ""}>Deleted</option>
                                        <option value="1" ${userUpdate.status ? "selected" : ""}>Active</option>
                                    </select>
                                </div>         

                            </div>    
                                        <input type="hidden" value="${userUpdate.user_id}" name="userId"/>
                            <div class="row mx-5">
                                <button type="submit" 
                                        class="btn btn-primary mt-3 col-1"
                                        name="btn" value="AdminUpdateAccount" >Save</button>
                            </div>
                        </form>


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
            document.getElementById('registrationForm').addEventListener('submit', function (event) {
                // Predefined list of existing usernames


                // Get form values
                const password = document.getElementById('password').value;
                const email = document.getElementById('email').value;
                const phone = document.getElementById('phone').value;
                const userName = document.getElementById('username').value;

                // Validation flags
                let isValid = true;

                const regex = /^[A-Za-z0-9]+$/;
                if (!regex.test(userName)) {
                    alert('User name does not contain special characters');
                    isValid = false;
                }

                // Email validation
                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(email)) {
                    alert('Invalid email address');
                    isValid = false;
                }

                // Phone number validation
                const phonePattern = /^\d{10}$/;
                if (!phonePattern.test(phone)) {
                    alert('Phone number must be exactly 10 digits');
                    isValid = false;
                }

                // Username validation
                if (password.length < 6) {
                    alert('Password must more than 6 char');
                    isValid = false;
                }

                // If any validation fails, prevent form submission
                if (!isValid) {
                    event.preventDefault();
                }
            });
        </script>

    </body>
</html>
