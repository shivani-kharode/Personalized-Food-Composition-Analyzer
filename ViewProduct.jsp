<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>View Products</title>

  <!-- Bootstrap Core CSS -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />

  <!-- Fonts Style -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />

  <!-- Custom Styles for this template -->
  <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('images/vb.jpg') no-repeat center center fixed;
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

    /* Table Styling */
    table {
      width: 80%;
      margin: 30px auto;
      border-collapse: collapse;
      background-color: rgba(255, 255, 255, 0.7);
    }

    th, td {
      padding: 15px;
      text-align: left;
      border: 1px solid #ddd;
    }

    th {
      background-color: #4169e1;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #ddd;
    }

    /* H1 Styling */
    h1 {
      color: #228B22;
      text-align: center;
      font-weight: bold;
      margin-top: 120px;
    }
  </style>
  
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
  
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
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="<%= request.getContextPath() %>/AdminDashboard.jsp">Home</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="AddProduct.jsp">Add Product</a>
                </li>
                <li class="nav-item active">
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

  <h1>View Products</h1>

  <table>
    <thead>
      <tr>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Launch Date</th>
        <th>Product Ingredient</th>
        <th>Calories</th>
        <th>Sodium</th>
        <th>Potassium</th>
        <th>Cholesterol</th>
        <th>Protein</th>
        <th>Product Barcode</th>
         <th>Action</th>
        
        
        
      </tr>
    </thead>
    <tbody>

    <% 
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personalized_food_composition_analyzer", "root", "root");

            // SQL query to fetch all products
            String query = "SELECT * FROM AddProduct";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                String productName = rs.getString("ProductName");
                String productDescription = rs.getString("ProductDescription");
                String productPrice = rs.getString("ProductPrice");
                Date productLaunchDate = rs.getDate("ProductLaunchDate");
                String productIngredient = rs.getString("ProductIngredient");
                String productCalories = rs.getString("ProductCalories");
                String productSodium = rs.getString("ProductSodium");
                String productPotassium = rs.getString("ProductPotassium");
                String productCholesterol = rs.getString("ProductCholesterol");
                String productProtein = rs.getString("ProductProtein");
                String productBarcode = rs.getString("ProductBarcode");
                String pid=rs.getString("uid");
                
    %>

      <tr>
        <td><%= productName %></td>
        <td><%= productDescription %></td>
        <td><%= productPrice %></td>
        <td><%= productLaunchDate %></td>
        <td><%= productIngredient %></td>
        <td><%= productCalories %></td>
        <td><%= productSodium %></td>
        <td><%= productPotassium %></td>
        <td><%= productCholesterol %></td>
        <td><%= productProtein %></td>
        <td><%= productBarcode %></td>
         <td><a href="UploadImage1.jsp?pid=<%=pid%>"><button>Upload Image</button> </a></td>
      </tr>

    <% 
            }
        } catch (Exception e) {
            out.println("<h3 class='alert alert-danger'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>

    </tbody>
  </table>

  <!-- Load JavaScript Files -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>

</html>
