<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>View News</title>

  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('<%= request.getContextPath() %>/images/') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
      position: relative;
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

    .suggestion-section {
      position: fixed; /* Make it fixed to the bottom right */
      bottom: 190px;
      right: 210px;
      width: 700px; /* Limit the width */
      background: white; /* Warm white background */
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .suggestion-section h2 {
      font-size: 20px;
      margin-bottom: 15px;
    }

    .suggestion-section .form-group {
      margin-bottom: 15px; /* Space below the form group */
    }

    .suggestion-section button {
      width: 100%; /* Make the button full width */
    }
    
      <---- active line---->
    .navbar-nav .nav-link {
    color: white !important;
    font-size: 18px;
    margin-right: 20px;
    position: relative; /* Needed for the underline effect */
}

.nav-item.active .nav-link {
    border-bottom: 2px solid white; /* Underline for active link */
}

  </style>
</head>

<body>

  <div class="hero_area">
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="index.html">
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
                  <a class="nav-link" href="Dashboard.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                
                <li class="nav-item ">
                  <a class="nav-link" href="UserResult.jsp">Scan Barcode<span class="sr-only">(current)</span></a>
                </li>
                
                <li class="nav-item ">
                  <a class="nav-link" href="UpdateProfile.jsp">Update Health Parameters <span class="sr-only">(current)</span></a>
                </li>
                
				  <li class="nav-item active">
                  <a class="nav-link" href="Suggest_Videos.jsp">Yoga Videos<span class="sr-only">(current)</span></a>
                </li>
                
                 <li class="nav-item ">
                  <a class="nav-link" href="ViewNews.jsp">Food News<span class="sr-only">(current)</span></a>
                </li>
                

				<li class="nav-item ">
                  <a class="nav-link" href="index.jsp">LOGOUT</a>
                </li>
                          
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
  </div>

  <div class="suggestion-section">
    <h1>Get Video Suggestions</h1>
    <form action="" method="post">
      <div class="form-group">
        <label for="categoryInput">Enter Video Based On:</label>
        <input type="text" id="categoryInput" name="video_based_on" class="form-control" required placeholder="Enter a category">
      </div>
    <button type="submit" class="btn btn-primary" style="width: auto;">Get Suggestions</button>
    
    </form>
<br/>
    <div id="suggestions">
      <h3>Suggested Videos:</h3>
      <ul>
        <%
          if ("POST".equalsIgnoreCase(request.getMethod())) {
            String categoryInput = request.getParameter("video_based_on");

            // Database connection variables
            String url = "jdbc:mysql://localhost:3306/personalized_food_composition_analyzer"; // Update with your database
            String user = "root"; // Update with your username
            String password = "root"; // Update with your password

            try {
              // Connect to the database
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn = DriverManager.getConnection(url, user, password);
              String sql = "SELECT link FROM yoga_videos WHERE video_based_on = ?";
              PreparedStatement statement = conn.prepareStatement(sql);
              statement.setString(1, categoryInput);
              ResultSet resultSet = statement.executeQuery();

              while (resultSet.next()) {
                String videoLink = resultSet.getString("link");
                out.println("<li><a href='" + videoLink + "' target='_blank'>" + videoLink + "</a></li>");
              }
              conn.close();
            } catch (Exception e) {
              e.printStackTrace();
              out.println("<div class='alert alert-danger'>Error retrieving video suggestions!</div>");
            }
          }
        %>
      </ul>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
</body>

</html>
