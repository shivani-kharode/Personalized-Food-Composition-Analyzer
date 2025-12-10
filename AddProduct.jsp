<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Cryptop - Add Product</title>

  <!-- Slider Stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- Bootstrap Core CSS -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />
  <!-- Fonts Style -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet" />
  <!-- Custom Styles for this template -->
  <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('images/vc.jpg') no-repeat center center fixed;
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

    .add-product-container {
      max-width: 600px;
      width: 100%;
      padding: 30px;
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
      margin-top: 20px;
      position: absolute;
      top: 100px;
      right: 160px;
    }

    .add-product-container h1 {
      font-size: 28px;
      margin-bottom: 20px;
      text-align: center;
      color: #333;
    }

    .add-product-container .form-group input,
    .add-product-container .form-group textarea {
      border-radius: 5px;
      padding: 15px;
      font-size: 16px;
    }

    .add-product-container .form-group {
      margin-bottom: 20px;
    }

    .add-product-container button {
      background-color: #008080;
      color: white;
      padding: 15px;
      border: none;
      font-size: 16px;
      border-radius: 5px;
      width: 100%;
      cursor: pointer;
    }

    .add-product-container button:hover {
      background-color: #0056b3;
    }

    h1 {
      font-weight: bold;
    }

    #videoElement {
      width: 100%;
      height: auto;
      margin-top: 20px;
    }

    #capturedImage {
      width: 40%;
      height: auto;
      margin-top: 20px;
      display: none;
    }

    #barcodeResult {
      font-size: 18px;
      margin-top: 20px;
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
  
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
  
</head>

<body>
  <div class="hero_area">
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">
            <span>Custom Food Profile</span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="<%= request.getContextPath() %>/AdminDashboard.jsp">Home</a>
                </li>
                <li class="nav-item active">
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

  <div class="add-product-container">
    <h1>Add New Product</h1>
    <form method="post" action="AddProduct.jsp">

      <!-- Product Name -->
      <div class="form-group">
        <input type="text" id="productName" name="ProductName" class="form-control" placeholder="Product Name" required="required" />
      </div>

      <!-- Product Description -->
      <div class="form-group">
        <textarea id="productDescription" name="ProductDescription" class="form-control" placeholder="Product Description" rows="2" required="required"></textarea>
      </div>

      <!-- Product Price -->
      <div class="form-group">
        <input type="number" id="productPrice" name="ProductPrice" class="form-control" placeholder="Product Price" required="required" />
      </div>

      <!-- Product Launch Date -->
      <div class="form-group">
        <input type="date" id="productLaunchDate" name="ProductLaunchDate" class="form-control" required />
      </div>

      <!-- Product Ingredient -->
      <div class="form-group">
        <input type="text" id="productIngredient" name="ProductIngredient" class="form-control" placeholder="Product Ingredient" required="required" />
      </div>

      <!-- Product Calories -->
      <div class="form-group">
        <input type="text" id="productCalories" name="ProductCalories" class="form-control" placeholder="Product Calories" required="required" />
      </div>

      <!-- Product Sodium -->
      <div class="form-group">
        <input type="text" id="productSodium" name="ProductSodium" class="form-control" placeholder="Product Sodium" required="required" />
      </div>

      <!-- Product Potassium-->
      <div class="form-group">
        <input type="text" id="productPotassium" name="ProductPotassium" class="form-control" placeholder="Product Potassium" required="required" />
      </div>

      <!-- Product Cholesterol -->
      <div class="form-group">
        <input type="text" id="productCholesterol" name="ProductCholesterol" class="form-control" placeholder="Product Cholesterol" required="required" />
      </div>

      <!-- Product Protein -->
      <div class="form-group">
        <input type="text" id="productProtein" name="ProductProtein" class="form-control" placeholder="Product Protein" required="required" />
      </div>

      <!-- Product Barcode -->
      <div class="form-group">
        <input type="text" id="productBarcode" name="ProductBarcode" class="form-control" placeholder="Product Barcode" readonly required />
      </div>

      
    <button type="submit" class="btn btn-primary">Add Product</button>
</form>

    <h1>Barcode Scanner</h1>
    <button class="btn btn-info mt-2" onclick="openCamera()">Open Camera & Scan Barcode</button>

    <!-- Video element to display the camera feed -->
    <video id="videoElement" autoplay></video>

    <!-- Display the captured image -->
    <img id="capturedImage" src="" alt="Captured Image" />

    <!-- Display scanned barcode result -->
    <div id="barcodeResult"></div>
    
  </div>


  <script src="https://cdnjs.cloudflare.com/ajax/libs/quagga/0.12.1/quagga.min.js"></script> <!-- QuaggaJS for barcode scanning -->

  <script>
    let stream = null;

    async function openCamera() {
      try {
        // Attempt to access the camera
        stream = await navigator.mediaDevices.getUserMedia({ video: true });

        // Get the video element
        const videoElement = document.getElementById('videoElement');
        videoElement.srcObject = stream;

        // Initialize the barcode scanner
        startBarcodeScan(videoElement);
      } catch (error) {
        let errorMessage = 'An unknown error occurred while accessing the camera.';
        if (error.name === 'NotFoundError') {
          errorMessage = 'No camera found. Please ensure your device has a camera.';
        } else if (error.name === 'NotAllowedError') {
          errorMessage = 'Camera permission denied. Please enable camera access in your browser settings.';
        } else if (error.name === 'NotReadableError') {
          errorMessage = 'Camera is in use by another application. Please close other applications that might be using the camera.';
        } else if (error.name === 'OverconstrainedError') {
          errorMessage = 'No camera device matches the requested constraints.';
        } else if (error.name === 'SecurityError') {
          errorMessage = 'Camera access requires a secure context (HTTPS). Please ensure the page is served over HTTPS.';
        }
        console.error('Error accessing the camera:', error);
        alert(errorMessage);
      }
    }

    // Function to start barcode scanning
    function startBarcodeScan(videoElement) {
      // Configure QuaggaJS
      Quagga.init({
        inputStream: {
          name: "Live",
          type: "LiveStream",
          target: videoElement // Capture the video stream from the video element
        },
        decoder: {
          readers: ["code_128_reader", "ean_reader", "ean_8_reader", "upc_reader"] // Supported barcode formats
        }
      }, function(err) {
        if (err) {
          console.error('Error initializing Quagga: ', err);
          alert('Could not initialize barcode scanner.');
          return;
        }

        // Start scanning
        Quagga.start();
      });

      // Event listener for when a barcode is detected
      Quagga.onDetected(function(result) {
        const barcode = result.codeResult.code; // Extract the barcode data
        document.getElementById('barcodeResult').textContent = 'Scanned Barcode: ' + barcode;

        // Set the barcode in the product barcode input field
        document.getElementById('productBarcode').value = barcode;
        Quagga.stop(); // Stop the scanner once a barcode is detected
      });
    }
  </script>

<% 
    // Form submission logic
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form data
        String productName = request.getParameter("ProductName");
        String productDescription = request.getParameter("ProductDescription");
        String productPrice = request.getParameter("ProductPrice");
        String productLaunchDate = request.getParameter("ProductLaunchDate");
        String productIngredient = request.getParameter("ProductIngredient");
        String productCalories = request.getParameter("ProductCalories");
        String productSodium = request.getParameter("ProductSodium");
        String productPotassium = request.getParameter("ProductPotassium");
        String productCholesterol = request.getParameter("ProductCholesterol");
        String productProtein = request.getParameter("ProductProtein");
        String productBarcode = request.getParameter("ProductBarcode");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personalized_food_composition_analyzer", "root", "root");

            // SQL query to insert product data
            String query = "INSERT INTO AddProduct (ProductName, ProductDescription, ProductPrice, ProductLaunchDate, ProductIngredient, ProductCalories, ProductSodium, ProductPotassium, ProductCholesterol, ProductProtein, ProductBarcode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);

            // Set parameters for the PreparedStatement
            pst.setString(1, productName);
            pst.setString(2, productDescription);
            pst.setString(3, productPrice);
            pst.setString(4, productLaunchDate);
            pst.setString(5, productIngredient);
            pst.setString(6, productCalories);
            pst.setString(7, productSodium);
            pst.setString(8, productPotassium);
            pst.setString(9, productCholesterol);
            pst.setString(10, productProtein);
            pst.setString(11, productBarcode);

            // Execute the query
            int result = pst.executeUpdate();

            // Show success or failure message
            if (result > 0) {
                out.println("<h3 class='alert alert-success'>Product added successfully!</h3>");
            } else {
                out.println("<h3 class='alert alert-danger'>Error adding product!</h3>");
            }
        } catch (Exception e) {
            out.println("<h3 class='alert alert-danger'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>

</body>
</html>

