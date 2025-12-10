<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

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
    /* Setting background color to white */
    body {
      background-color: white;
    }

    /* Header Section */
    .header_section {
      position: fixed;
      width: 100%;
      top: 0;
      left: 0;
      background-color: black; /* Dark background color */
      z-index: 10;
      padding: 10px 0;
      margin-top: 20px; /* Added margin to move the header slightly down */
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

    /* Content Section */
    .content-section {
      text-align: center;
      margin-top: 120px; /* Increased margin-top to make space for the header */
    }

    .content-section img {
      max-width: 500px; /* Increased max-width to make the image larger */
      height: auto;
      margin-bottom: 20px;
    }

    .content-section h2 {
      font-size: 30px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .content-section p {
      font-size: 18px;
      max-width: 800px;
      margin: 0 auto;
      line-height: 1.6;
      text-align: justify; /* Added to justify the text */
    }
  </style>
</head>

<body>
  <!-- Header Section -->
  <div class="hero_area">
    <!-- Header Section -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
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
                <li class="nav-item active">
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

  <!-- Content Section -->
  <section class="content-section">
    <div class="container">
      <!-- Small Image Below Header --><br/>
      <img src="<%= request.getContextPath() %>/images/tru.jpg" alt="Food Analyzer" />

      <!-- Information About Personalized Food Composition Analyzer -->
      <h2>Personalized Food Composition Analyzer</h2>
      <p>
        Our Personalized Food Composition Analyzer is designed to provide you with detailed insights into your food intake.
        Whether you're looking to manage your diet, monitor nutritional values, or customize your meals for specific health goals,
        this tool can help you make more informed decisions. By analyzing the composition of various foods and suggesting tailored
        recommendations, it helps improve your overall health and well-being. Start making better food choices today with our
        innovative analyzer.
      </p>
      
      <br/>
      <br/>
    </div>
  </section>

  <!-- Footer Section -->
  <section class="container-fluid footer_section">
    <p>
      &copy; 2019 All Rights Reserved By
      <a href="https://html.design/">Free Html Templates</a>
    </p>
  </section>

  <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  
  <!-- Owl Carousel Script -->
  <script type="text/javascript">
    $(".owl-carousel").owlCarousel({
      loop: true,
      margin: 0,
      navText: [],
      center: true,
      autoplay: true,
      autoplayHoverPause: true,
      responsive: {
        0: {
          items: 1
        },
        1000: {
          items: 3
        }
      }
    });
  </script>
</body>

</html>
