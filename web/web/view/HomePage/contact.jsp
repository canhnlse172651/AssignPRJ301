<%-- 
    Document   : contact
    Created on : Jul 18, 2024, 12:37:50 AM
    Author     : LA DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
        <style>
            body{
                background-color: #eee;
                font-family: 'Roboto';
            }
            a{
                text-decoration: none;
                color: black;
            }
            .navigation{
                gap:30px;
                font-size: 18px;
            }
            .Logo1{
                color: #1A162E;
                font-weight: 800;
                font-size: 150%;
                padding-bottom: 4%;
            }
            .item{
                gap: 20px;
            }
            .hed{
                height: 70px;
            }
            .rounded4{
                border-radius: 10px;
                box-shadow: #eee;
            }
        </style>
    </head>
    <body>
        <header class="row bg-white rounded-4 hed" >
            <div class="col-1"></div>
            <div class="col-1 w-auto h-75">
                <img src="web/view/HomePage/image/logo.png" alt="logo" style="width: 60px; height: 70px;"  >
            </div>
            <div class="Logo1 col-2 mt-2 pt-3">grocerymart</div>
            <div class="navigation col-6 d-flex mt-3 pt-3">
                <a href="/Grocery/HomeServlet"> Home </a>
                <a href="/Grocery/AccountServlet">
                    Manage
                </a>
                <a href="/Grocery/Contact">Contact</a>
            </div>
            <div class="col-2 d-flex item mt-2 pt-3">
                <a class="text-right" href="MainServlet?btn=viewCart" > <img src="web/view/HomePage/image/cart.png" alt=cart style="width: 40px; height: 40px;"></a>
                <img class="text-right" src="web/view/HomePage/image/user.png" alt="User" style="width: 40px; height: 40px;"/> 
                <a class="text-right pt-2" href="/Grocery/Logout"><div class="back-logout" ><i class="fa-solid fa-right-from-bracket fa-xl" style=" color: #000000; margin-left: 10px; cursor : pointer" title="Logout"></i></div> </a>
            </div>
        </header>
        <div class="container">
            <div class="bg-white rounded4 my-4 p-5">
                <h2>Feedback</h2>
                <div class="mb-4 small">
                    Please provide your feedback in the form below
                </div>
                <form name="feedback_form" id="feedback_form" method="post">
                    <label>How do you rate your overall experience?</label>
                    <div class="mb-3 d-flex flex-row py-1">
                        <div class="form-check mr-3">
                            <input class="form-check-input" type="radio" name="rating" id="rating_bad" value="bad">
                            <label class="form-check-label" for="rating_bad">
                                Bad
                            </label>
                        </div>

                        <div class="form-check mx-3">
                            <input class="form-check-input" type="radio" name="rating" id="rating_good" value="good">
                            <label class="form-check-label" for="rating_good">
                                Good
                            </label>
                        </div>

                        <div class="form-check mx-3">
                            <input class="form-check-input"  type="radio" name="rating" id="rating_excellent" value="excellent">
                            <label class="form-check-label" for="rating_excellent">
                                Excellent!
                            </label>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label"  for="feedback_comments">Comments:</label>
                        <textarea class="form-control" required rows="6" name="comments" id="feedback_comments" ></textarea>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label class="form-label" for="feedback_name">Your Name:</label>
                            <input type="text" required name="name" class="form-control" id="feedback_name"/>
                        </div>

                        <div class="col mb-4">
                            <label class="form-label" for="feedback_email">Email:</label>
                            <input type="email" name="email" required class="form-control" id="feedback_email"/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success btn-lg" >Post</button>
                </form>
            </div>

        </div>
    </body>
</html>
