<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Cryptop - Registration</title>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('images/ft.jpg') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }

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

    .register-container {
      max-width: 450px;
      width: 100%;
      padding: 30px;
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
      margin-top: 100px;
    }

    .register-container h1 {
      font-size: 28px;
      margin-bottom: 20px;
      text-align: center;
      color: #333;
    }

    .register-container .form-group input {
      border-radius: 5px;
      padding: 15px;
      font-size: 16px;
    }

    .register-container .form-group {
      margin-bottom: 20px;
    }

    .register-container button {
      background-color: #228B22;
      color: white;
      padding: 15px;
      border: none;
      font-size: 16px;
      border-radius: 5px;
      width: 100%;
      cursor: pointer;
    }

    .register-container button:hover {
      background-color: #0056b3;
    }

    .register-container .signup-link {
      text-align: center;
      margin-top: 20px;
    }

    .register-container .signup-link a {
      color: #007bff;
      text-decoration: none;
    }

    .register-container .signup-link a:hover {
      text-decoration: underline;
    }

    h1 {
      font-weight: bold;
    }
  </style>
</head>

<body>
  <div class="hero_area">
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="index.jsp">
            <span>Custom Food Profile</span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="team.jsp">Team</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="Registration.jsp">Registration</a>
                </li>
                <li class="nav-item">
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
  </div>

  <div class="register-container">
    <h1>Register Now</h1>
    <form method="post">
      <div class="form-group">
        <input type="text" id="name" name="name" class="form-control" placeholder="Full Name" required="required" />
      </div>

      <div class="form-group">
        <input type="email" id="email" name="email" class="form-control" placeholder="Your Email" required="required" />
      </div>

      <div class="form-group">
        <input type="text" id="contact" name="contact" class="form-control" placeholder="Your Contact Number" required="required" />
      </div>

      <div class="form-group">
        <input type="password" id="password" name="password" class="form-control" placeholder="Create a Password" required="required" />
      </div>

      <div class="form-group">
        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm Password" required="required" />
      </div>

      <button class="btn btn-primary" type="submit">Register</button>
    </form>

    <p class="signup-link">Already have an account? <a href="login.jsp">Login here</a></p>
  </div>

  
    // JavaScript to handle form submission and alert
 <% 
    String alertMessage = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            alertMessage = "Your password does not match the confirm password. Please create another registration.";
        } else {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personalized_food_composition_analyzer", "root", "root");

                String query = "INSERT INTO registration (name, email, contact, password) VALUES (?, ?, ?, ?)";
                pst = con.prepareStatement(query);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, contact);
                pst.setString(4, password); // Consider hashing this for security

                int result = pst.executeUpdate();

                if (result > 0) {
                    alertMessage = "Your registration is successful! Please try to log in.";
                } else {
                    alertMessage = "Error: Please try again later.";
                }
            } catch (Exception e) {
                alertMessage = "Error: " + e.getMessage();
                e.printStackTrace();
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>

<script>
    <% if (!alertMessage.isEmpty()) { %>
        alert('<%= alertMessage.replace("'", "\\'") %>');
    <% } %>


</script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
</body>

</html>
