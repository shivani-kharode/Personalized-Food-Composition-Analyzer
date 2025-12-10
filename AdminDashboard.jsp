<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Cryptop</title>

  <!-- CSS Links -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('<%= request.getContextPath() %>/images/uo.png') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
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
                <li class="nav-item active">
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
                
                 <li class="nav-item dropdown ">
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

  <!-- Load JavaScript Files -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
</body>

</html>
