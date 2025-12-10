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
      background: url('images/r.webp') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
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
      background-color: black; /* Dark background color */
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
    .login-container {
      background-color: rgba(255, 255, 255, 0.6); /* Semi-transparent white background */
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
      width: 100%;
      max-width: 400px;
      margin-top: 100px;  /* Added top margin */
      margin-bottom: 50px; /* Added bottom margin */
      margin-left: 20px;   /* Added left margin */
      margin-right: 200px;  /* Added right margin */
    }

    .login-container h1 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 24px;
      color: #333;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-control {
      border: 1px solid #ccc;
      padding: 12px;
      font-size: 16px;
      border-radius: 5px;
      width: 100%;
    }

    /* Login Button Styling */
    .btn-primary {
      background-color: #228B22; /* Green color */
      border: none;
      padding: 12px;
      color: #fff;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
    }

    .btn-primary:hover {
      background-color: #218838; /* Darker green on hover */
    }


        .signup-link {
            text-align: center;
            margin-top: 10px;
        }

        .signup-link a {
            color: #007bff;
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
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
                <li class="nav-item active">
                  <a class="nav-link" href="login.jsp">User Login</a>
                </li>
                <li class="nav-item">
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
        <h1>Login</h1>
        <form method="post">
            <div class="form-group">
                <input type="email" id="email" name="email" class="form-control" placeholder="Your Email" required="required" />
            </div>

            <div class="form-group">
                <input type="password" id="password" name="password" class="form-control" placeholder="Your Password" required="required" />
            </div>

            <button class="btn btn-primary" type="submit">Login</button>
        </form>

        <p class="signup-link">Don't have an account? <a href="Registration.jsp">Register here</a></p>
    </div>

    <script>
        <% 
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                // Get form data
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rs = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Establish database connection
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personalized_food_composition_analyzer", "root", "root");

                    // SQL query to check if user exists
                    String query = "SELECT * FROM registration WHERE email=? AND password=?";
                    pst = con.prepareStatement(query);

                    // Set parameters for PreparedStatement
                    pst.setString(1, email);
                    pst.setString(2, password);

                    // Execute the query
                    rs = pst.executeQuery();

                    // Check if user exists
                    if (rs.next()) {
                        // Storing the user UID in session
                        int userId = rs.getInt("uid");
                        session.setAttribute("uid", userId); // Store UID in session

                        out.println("<script>alert('Login Successful!');</script>");
                        response.sendRedirect("Dashboard.jsp"); // Redirect to the dashboard or home page after successful login
                    } else {
                        out.println("<script>alert('Invalid email or password.');</script>");
                    }
                } catch (Exception e) {
                    out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
                    e.printStackTrace();
                } finally {
                    // Close database resources
                    try {
                        if (pst != null) pst.close();
                        if (rs != null) rs.close();
                        if (con != null) con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </script>
</body>

</html>
