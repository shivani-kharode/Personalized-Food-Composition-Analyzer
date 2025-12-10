<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Cryptop - Login</title>

  <!-- Slider Stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- Bootstrap Core CSS -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- Fonts Style -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />

  <!-- Custom Styles for this template -->
  <link href="css/style.css" rel="stylesheet" />

  <!-- Responsive Style -->
  <link href="css/responsive.css" rel="stylesheet" />

  <style>
    /* Custom Styles to Center Login Form */
    body {
      font-family: 'Roboto', sans-serif;
      background-color: #ffffff; /* White background */
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      position: relative;
    }

    /* Add the small image to the left side */
    .left-image {
      position: absolute;
      left: 400px;
      top: 65%;
      transform: translateY(-50%);
      width: 300px; /* Adjust the width as needed */
      height: auto;
    }

    .hero_area {
      width: 100%;
    }

    /* Header Styling */
    .header_section {
      position: fixed;
      width: 100%;
      height: 12%;
      top: 0;
      left: 0;
      padding: 10px 0;
      background-color: black;
      z-index: 10;
    }

    .navbar-brand {
      color: white;
      font-size: 30px;
      font-weight: bold;
      padding-left: 20px;
    }

    .navbar-nav .nav-link {
      color: white !important;
      font-size: 18px;
      margin-right: 20px;
    }

    .navbar-nav .nav-link:hover {
      color: #007bff !important;
    }

    .navbar-nav {
      margin-left: auto;
    }

    /* Login Box Styling */
    /* Login Box Styling */
.login-container {
  background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 450px;
  margin-top: 230px;
  margin-bottom: 50px;
  margin-right: 100px; /* Corrected margin-right */
}
    
    .login-container h1 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 28px;
      color: #333;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-control {
      border: 1px solid #ccc;
      padding: 14px;
      font-size: 16px;
      border-radius: 8px;
      width: 100%;
      transition: border-color 0.3s ease;
    }

    .form-control:focus {
      border-color: #4CAF50;
      box-shadow: 0 0 8px rgba(76, 175, 80, 0.6);
    }

    /* Login Button Styling */
    .btn-primary {
      background-color: #4CAF50; /* Green color */
      border: none;
      padding: 14px;
      color: #fff;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      width: 100%;
      transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #45a049;
    }

    .signup-link {
      text-align: center;
      margin-top: 10px;
    }

    .signup-link a {
      color: #007bff;
      text-decoration: none;
      font-size: 16px;
    }

    .signup-link a:hover {
      text-decoration: underline;
    }

    /* Error Message Styling */
    .error {
      color: red;
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }
  </style>
</head>

<body>
  <!-- Left Image (3.png) -->
  <img src="images/yt.png" alt="Left Image" class="left-image" />

  <!-- Hero Area Section -->
  <div class="hero_area">
    <!-- Header Section -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <!-- Brand Logo -->
          <a class="navbar-brand" href="index.jsp">
            <span>Custom Food Profile</span>
          </a>

          <!-- Navbar Toggler Button -->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav  ">
                <li class="nav-item ">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="about.jsp"> About </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="team.jsp"> Team </a>
                </li>
                 <li class="nav-item">
                  <a class="nav-link" href="Registration.jsp"> Registation</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="login.jsp">User Login</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="AdminLogin.jsp">Admin Login</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->

  </div>
  
  <!-- Login Form Section -->
  <div class="login-container">
    <h1>Admin Login</h1>

    <!-- Login Form -->
    <form action="AdminLogin.jsp" method="POST">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" class="form-control" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" class="form-control" required>
      </div>
      <input type="submit" value="Login" class="btn btn-primary">
    </form>

    <% 
      // Get username and password from the form
      String username = request.getParameter("username");
      String password = request.getParameter("password");

      // Check if the username and password match "admin"
      if (username != null && password != null && username.equals("admin") && password.equals("admin")) {
        // If correct, redirect to the dashboard.jsp page
        response.sendRedirect("AdminDashboard.jsp");
      } 
      else if (username != null && password != null) {
    %>
      <div class="error">Invalid username or password. Please try again.</div>
    <% 
      }
    %>
  </div>

  <!-- Load JavaScript Files -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
</body>

</html>
