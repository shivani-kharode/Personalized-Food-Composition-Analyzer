<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

  <title>Cryptop</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />
  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('<%= request.getContextPath() %>/images/kk.jpg') no-repeat center center fixed;
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

    /* "Meet Our Team" Section Styling */
    .team-section {
      margin-top: 120px; /* To provide space below header */
      text-align: center;
      padding: 60px 20px;
    }

    .team-section h2 {
      font-size: 36px;
      font-weight: bold;
      color: #333;
    }

    .team-section img {
      max-width: 150px;
      margin-left: 20px;
      vertical-align: middle;
    }

    /* Boxes Styling */
    .team-boxes {
      display: flex;
      justify-content: center;
      gap: 30px;
      margin-top: 40px;
    }

    .team-box {
      width: 170px;
      height: 100px;
      background-color: rgba(244, 244, 244, 0.8); /* Semi-transparent background */
      display: flex;
      justify-content: center;
      align-items: center;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .team-box {
      font-weight: bold; /* Makes the text bold */
      font-size: 18px;   /* Increases the font size */
    }

    /* Footer Styling */
    .footer {
      background-color: black;
      color: white;
      text-align: center;
      padding: 20px 0;
      position: fixed;
      bottom: 0;
      width: 100%;
    }

  </style>
</head>

<body>

  <div class="hero_area">
    <!-- header section -->
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
              <ul class="navbar-nav  ">
                <li class="nav-item ">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="about.jsp"> About </a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="team.jsp"> Team </a>
                </li>
                 <li class="nav-item">
                  <a class="nav-link" href="Registration.jsp"> Registation</a>
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
    <!-- end header section -->

  </div>

  <!-- Meet Our Team Section -->
  <div class="team-section">
    <h2>Meet Our Team</h2><br/>
    <br/><br/><br/><br/><br/>
    <div class="team-boxes">
      <div class="team-box">Punam Shingade</div>
      <div class="team-box">Shivani Kharode</div>
      <div class="team-box">Isha Kharode</div>
      <div class="team-box">Rutuja Umak</div>
    </div>
  </div>

  <!-- Footer -->
  <div class="footer">
    <p>&copy; 2025 Custom Food Profile. All rights reserved.</p>
  </div>

  <!-- Load JavaScript Files -->
  <script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
</body>

</html>
