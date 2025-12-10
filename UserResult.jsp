<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Health Check</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('images/') no-repeat center center fixed;
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
            position: relative;
        }

        .nav-item.active .nav-link {
            border-bottom: 2px solid white;
        }

        .content {
            padding-top: 100px;
            text-align: center;
        }

        .btn-open-camera {
            background-color: #4169e1;
            color: white;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 30px;
        }

        #videoElement {
            width: 40%;
            height: auto;
            margin-top: 20px;
            display: none;
        }

        #capturedImage {
            width: 40%;
            height: auto;
            margin-top: 20px;
            display: none;
        }

        .result-image {
            margin-top: 20px;
        }

        .unhealthy-image {
            width: 30%;
            height: 30%;
        }

        .barcode-display {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/quagga/0.12.1/quagga.min.js"></script>
</head>

<body>

    <div class="header_section">
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
                                <a class="nav-link" href="Dashboard.jsp">Home</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="UserResult.jsp">Scan Barcode</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="UpdateProfile.jsp">Update Health Parameters</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="Suggest_Videos.jsp">Yoga Videos</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="ViewNews.jsp">Food News</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="index.jsp">LOGOUT</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div class="content">
        <h2 style="font-weight: bold;">Smart Food Checker</h2>

        <button class="btn-open-camera" onclick="openCamera()">Scan Barcode</button>

        <video id="videoElement" autoplay></video>
        <img id="capturedImage" alt="Captured Image" />

        <div class="barcode-display" id="barcodeDisplay"></div>

        <%
        String imagepath="";
            String dbURL = "jdbc:mysql://localhost:3306/personalized_food_composition_analyzer";
            String dbUser = "root";
            String dbPass = "root";

            String healthMessage = "";
            String healthStatus = "";
            String detailedMessage = "";
            String ingredients = "";
            boolean isHealthy = false;
            String scannedBarcode = "";

            // Retrieve user ID from session
            Integer userId = (Integer) session.getAttribute("uid");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return; // Stop further execution
            }

            if (request.getMethod().equalsIgnoreCase("POST")) {
                scannedBarcode = request.getParameter("barcode");

                Connection conn = null;
                PreparedStatement psProduct = null;
                PreparedStatement psHealthDetails = null;
                ResultSet rsProduct = null;
                ResultSet rsHealthDetails = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    String productQuery = "SELECT ProductIngredient,ProductImagePath,ProductSodium FROM addproduct WHERE ProductBarcode = ?";
                    psProduct = conn.prepareStatement(productQuery);
                    psProduct.setString(1, scannedBarcode);
                    rsProduct = psProduct.executeQuery();

                    if (rsProduct.next()) {
                        ingredients = rsProduct.getString("ProductIngredient");
                        String sodium = rsProduct.getString("ProductSodium");
                        imagepath=rsProduct.getString("ProductImagePath");

                        String healthQuery = "SELECT diabetic, bpLevel, healthCondition FROM health_detail WHERE uid = ?";
                        psHealthDetails = conn.prepareStatement(healthQuery);
                        psHealthDetails.setInt(1, userId); // Use dynamic user ID
                        rsHealthDetails = psHealthDetails.executeQuery();

                        String diabetic = "", bpLevel = "", healthCondition = "";
                        if (rsHealthDetails.next()) {
                            diabetic = rsHealthDetails.getString("diabetic");
                            bpLevel = rsHealthDetails.getString("bpLevel");
                            healthCondition = rsHealthDetails.getString("healthCondition");
                        }

                        isHealthy = true;

                        // Health checks (same as before)
                        if (diabetic.equalsIgnoreCase("yes") && ingredients.toLowerCase().contains("sugar")) {
                            isHealthy = false;
                            detailedMessage = "The product contains sugar, which is unhealthy for you.";
                        }

                        if (bpLevel.equalsIgnoreCase("high")) {
                            int productSodium = Integer.parseInt(sodium.replaceAll("[^0-9]", ""));
                            if (productSodium > 500) {
                                isHealthy = false;
                                detailedMessage = "The sodium content exceeds 500 mg, which is unhealthy for you.";
                            }
                        }

                        if (healthCondition.equalsIgnoreCase("bad")) {
                            if (ingredients.toLowerCase().contains("palm oil") || 
                                ingredients.toLowerCase().contains("artificial flavor") || 
                                ingredients.toLowerCase().contains("sugar")) {
                                isHealthy = false;
                                detailedMessage = "The product contains unhealthy ingredients, making it unsuitable for you.";
                            }
                        }

                        // Set health message
                        if (isHealthy) {
                            healthMessage = "The product is healthy for you.";
                            healthStatus = "healthy";
                        } else {
                            healthMessage = "The product is unhealthy for you.";
                            healthStatus = "unhealthy";
                        }
                    } else {
                        healthMessage = "Product not found in database.";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    healthMessage = "Error occurred: " + e.getMessage();
                } finally {
                    // Close resources
                    try { if (rsProduct != null) rsProduct.close(); } catch (SQLException e) {}
                    try { if (rsHealthDetails != null) rsHealthDetails.close(); } catch (SQLException e) {}
                    try { if (psProduct != null) psProduct.close(); } catch (SQLException e) {}
                    try { if (psHealthDetails != null) psHealthDetails.close(); } catch (SQLException e) {}
                    try { if (conn != null) conn.close(); } catch (SQLException e) {}
                }
            }
        %>

        <div>
            <p style="font-size: 24px; font-weight: bold; color: #333;">
                <%= healthMessage %>
                <% if (!scannedBarcode.isEmpty()) { %>
                    <br>Barcode: <%= scannedBarcode %>
                <% } %>
            </p>
            <% if (!detailedMessage.isEmpty()) { %>
                <p style="font-size: 20px; color: #666;"><%= detailedMessage %></p>
            <% } %>
            <% if (!ingredients.isEmpty()) { %>
                <p style="font-size: 20px; color: #666;">
                    Ingredients: <br>
                    <strong><%= ingredients.replaceAll(",", ",<br>") %></strong>
                </p>
            <% } %>
            <% if ("healthy".equals(healthStatus)) { %>
                <img src="images/r.gif" alt="Healthy Product" class="result-image" style="max-width: 100%; height: auto;" />
            <% } else if ("unhealthy".equals(healthStatus)) { %>
                <img src="images/rt.gif" alt="Unhealthy Product" class="unhealthy-image" />
            <% } %>
            <img src="<% out.println("images/"+imagepath);%>">
        </div>

    </div>

    <script>
        let stream = null;

        async function openCamera() {
            try {
                stream = await navigator.mediaDevices.getUserMedia({ video: true });
                const videoElement = document.getElementById('videoElement');
                videoElement.style.display = 'block';
                videoElement.srcObject = stream;
                startBarcodeScan(videoElement);
            } catch (error) {
                alert('Error accessing the camera: ' + error);
            }
        }

        function startBarcodeScan(videoElement) {
            Quagga.init({
                inputStream: {
                    name: "Live",
                    type: "LiveStream",
                    target: videoElement
                },
                decoder: {
                    readers: ["code_128_reader", "ean_reader", "ean_8_reader", "upc_reader"]
                }
            }, function(err) {
                if (err) {
                    console.error('Error initializing Quagga: ', err);
                    alert('Could not initialize barcode scanner.');
                    return;
                }
                Quagga.start();
            });

            Quagga.onDetected(function(result) {
                const barcode = result.codeResult.code;
                document.getElementById('barcodeDisplay').innerText = "Scanned Barcode: " + barcode;
                const form = document.createElement('form');
                form.method = 'post';
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'barcode';
                input.value = barcode;
                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            });
        }
    </script>

</body>
</html>
