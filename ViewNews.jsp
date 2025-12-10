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

    .news-container {
      max-width: 800px;
      margin: 140px auto 20px; /* Set top margin to 80px to create space from header */
      padding: 20px;
      background: #fef7e8; /* Warm white background */
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .news-title-box {
      font-size: 28px;
      font-weight: bold;
      color: #333;
      margin-bottom: 20px; /* Space below the title */
    }

    .news-item {
      border-bottom: 1px solid #eee;
      padding: 15px 0;
    }

    .news-item:last-child {
      border-bottom: none;
    }

    .news-title {
      font-size: 24px;
      font-weight: bold;
      color: #333;
    }

    .news-content {
      font-size: 16px;
      color: #666;
    }

    .news-date {
      font-size: 12px;
      color: #999;
      margin-top: 5px;
    }

    .bottom-image {
      position: absolute;
      top: 120px;
      right: 90px;
      width: 300px;
      height: 300px;
      margin-bottom: 10px;
      margin-right: 10px;
      object-fit: cover;
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
                
				  <li class="nav-item ">
                  <a class="nav-link" href="Suggest_Videos.jsp">Yoga Videos<span class="sr-only">(current)</span></a>
                </li>
                
                 <li class="nav-item active">
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

  <div class="news-container">
    <div class="news-title-box">News Articles</div>
    <%
      // Database connection variables
      String url = "jdbc:mysql://localhost:3306/personalized_food_composition_analyzer"; // Update with your database
      String user = "root"; // Update with your username
      String password = "root"; // Update with your password

      try {
          // Connect to the database
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection(url, user, password);
          String sql = "SELECT * FROM news"; // Select all news articles
          Statement statement = conn.createStatement();
          ResultSet resultSet = statement.executeQuery(sql);

          // Display news articles
          while (resultSet.next()) {
              String title = resultSet.getString("news_title");
              String content = resultSet.getString("news_content");
              Timestamp createdAt = resultSet.getTimestamp("created_at");

              out.println("<div class='news-item'>");
              out.println("<div class='news-title'>" + (title != null ? title : "No Title") + "</div>");
              out.println("<div class='news-content'>" + (content != null ? content : "No Content") + "</div>");
              out.println("<div class='news-date'>Posted on: " + createdAt + "</div>");
              out.println("</div>");
          }

          conn.close();
      } catch (Exception e) {
          e.printStackTrace();
          out.println("<div class='alert alert-danger'>Error retrieving news articles!</div>");
      }
    %>
  </div>

  <img src="<%= request.getContextPath() %>/images/news2.gif" alt="Description" class="bottom-image" />

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
</body>

</html>
