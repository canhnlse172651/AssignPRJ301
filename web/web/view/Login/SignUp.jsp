<%-- 
    Document   : SignUp.jsp
    Created on : Jul 17, 2024, 6:20:18 PM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp</title>
        <link rel="stylesheet" href="web/view/Login/loginStyle.css">
    </head>
    
    <style>
        input{
          padding: 10px;
          margin-bottom: 15px;
        }
    </style>
    <body>
        
    <div class="container">
    <div class="left-section">
        <p>The best of luxury brand values, high quality products, and innovative services</p><br/>
    </div>
    <div class="right-section">
        <div class="form-container">
            <h2>Sign Up</h2>
            <p>Let's create your account and Shop like a pro and save money.</p>
            <form id="signup-form" action="MainServlet" method="post" onsubmit="return validateForm()">
                <input type="text" placeholder="User Name" name="txtUsername" id="txtUsername" value="bob_jackson">
                <input type="text" placeholder="Full name" name="txtFullName" id="txtFullName" value="">
                <input type="text" placeholder="Email" name="txtEmail" id="txtEmail" value="">
                <input type="text" placeholder="Phone" name="txtPhone" id="txtPhone" value="">
                <input type="password" placeholder="Password" name="txtPassword" id="txtPassword" value="passwordabc">
                <input type="password" placeholder="Confirm Password" name="txtConfirmPassword" id="txtConfirmPassword" value="">
                <button type="submit" name="btn" value="Create">Sign Up</button>
                <!-- <a href="MainServlet?btn=null">Sign In</a> -->
            </form>
        </div>
        <font style="text-align: center" > ${errorMessage} </font>
    </div>
</div>

<script>
    function validateForm() {
        var username = document.getElementById('txtUsername').value;
        var fullName = document.getElementById('txtFullName').value;
        var email = document.getElementById('txtEmail').value;
        var phone = document.getElementById('txtPhone').value;
        var password = document.getElementById('txtPassword').value;
        var confirmPassword = document.getElementById('txtConfirmPassword').value;

        var error = false;
        var errorMessage = "";

        if (username.trim() === '') {
            errorMessage += "Please enter a username.\n";
            error = true;
        }

        if (fullName.trim() === '') {
            errorMessage += "Please enter your full name.\n";
            error = true;
        }

        if (email.trim() === '' || !isValidEmail(email)) {
            errorMessage += "Please enter a valid email.\n";
            error = true;
        }

        if (phone.trim() === '' || !isValidPhoneNumber(phone)) {
            errorMessage += "Please enter a valid phone number.\n";
            error = true;
        }

        if (password.trim() === '') {
            errorMessage += "Please enter a password.\n";
            error = true;
        } else if (password !== confirmPassword) {
            errorMessage += "Passwords do not match.\n";
            error = true;
        }

        if (error) {
            alert(errorMessage);
            return false; // Prevent form submission
        }

        return true; // Allow form submission
    }

    function isValidEmail(email) {
        // Regular expression for validating email
        var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }

    function isValidPhoneNumber(phone) {
        // Regular expression for validating phone number (Vietnam)
        var regex = /^(0|\+84)\d{9}$/;
        return regex.test(phone);
    }
</script>

</body>
</html>
