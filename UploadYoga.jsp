<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Cryptop</title>

  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('<%= request.getContextPath() %>/images/') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
    }

    .hero_area {
      width: 100%;
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

    .upload-section {
      margin-top: 200px;
      text-align: left;
      padding: 60px 20px;
      max-width: 500px;
      margin-left: 20px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
    }

    .upload-section h2 {
      font-size: 36px;
      font-weight: bold;
      color: #333;
    }
    
    .dropdown-menu {
      background-color: black; /* Black background */
      border: none; /* Remove default border */
    }

    .dropdown-item {
      color: white; /* White text */
    }

    .dropdown-item:hover {
      background-color: #575757; /* Darker background on hover */
      color: white; /* Keep text white on hover */
    }
  </style>
</head>

<body>

  <div class="hero_area">
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">
            <span>Custom Food Profile</span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="<%= request.getContextPath() %>/AdminDashboard.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AddProduct.jsp">Add Product</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="ViewProduct.jsp">View Product</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="ViewUser.jsp">View Users</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Scan.jsp">Scan</a>
                </li>
                <li class="nav-item dropdown active">
                  <a class="nav-link dropdown-toggle" id="contentDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Content
                  </a>
                  <div class="dropdown-menu" aria-labelledby="contentDropdown">
                    <a class="dropdown-item" href="UploadYoga.jsp">Upload Yoga Videos</a>
                    <a class="dropdown-item" href="UploadNews.jsp">News</a>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="<%= request.getContextPath() %>/index.jsp">LOGOUT</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
  </div>

  <div class="upload-section">
    <h2>Upload Yoga Video Link</h2>
    <form action="" method="post">
      <div class="form-group">
        <label for="videoLink">Video Link:</label>
        <input type="url" id="videoLink" name="link" class="form-control" required placeholder="Enter the video URL">
      </div>

      <div class="form-group">
        <label for="videoBasedOn">Video Based On:</label>
        <select id="videoBasedOn" name="video_based_on" class="form-control" required>
          <option value="" disabled selected>Select a category</option>
          <option value="cholesterol">Cholesterol</option>
          <option value="sodium">Sodium</option>
          <option value="diabetic">Diabetic</option>
          <option value="potassium">Potassium</option>
          <option value="calories">Calories</option>
          <option value="protein">Protein</option>
        </select>
      </div>

      <button type="submit" class="btn btn-primary">Upload</button>
    </form>

    <%
      if ("POST".equalsIgnoreCase(request.getMethod())) {
          String link = request.getParameter("link");
          String videoBasedOn = request.getParameter("video_based_on");

          // Database connection variables
          String url = "jdbc:mysql://localhost:3306/personalized_food_composition_analyzer"; // Update with your database
          String user = "root"; // Update with your username
          String password = "root"; // Update with your password

          try {
              // Connect to the database
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn = DriverManager.getConnection(url, user, password);
              String sql = "INSERT INTO yoga_videos (link, video_based_on) VALUES (?, ?)";
              PreparedStatement statement = conn.prepareStatement(sql);
              statement.setString(1, link);
              statement.setString(2, videoBasedOn);
              statement.executeUpdate();
              conn.close();
              
              out.println("<div class='alert alert-success'>Video link uploaded successfully!</div>");
          } catch (Exception e) {
              e.printStackTrace();
              out.println("<div class='alert alert-danger'>Error uploading video link!</div>");
          }
      }
    %>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
</body>

</html>
