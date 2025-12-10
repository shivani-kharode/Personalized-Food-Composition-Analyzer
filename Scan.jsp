<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Camera Access</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />

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
        position: relative; /* Ensure positioning context */
    }

    .navbar-nav .nav-link:hover {
        color: #007bff !important;
    }

    .navbar-nav .nav-item.active .nav-link {
        color: #ffffff; /* Change text color to white */
        
        border-bottom: 2px solid white; /* Add a white line under the active link */
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

        .btn-open-camera:hover {
            background-color: #007bff;
        }

        #videoElement {
            width: 40%;
            height: auto;
            margin-top: 20px;
        }

        #capturedImage {
            width: 40%;
            height: auto;
            margin-top: 20px;
            display: none; /* Initially hidden */
        }
    </style>
    
    
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
  
    
</head>

<body>

    <div class="hero_area">
        <!-- Header Section -->
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
                                <li class="nav-item">
                                    <a class="nav-link" href="AddProduct.jsp">Add Product</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ViewProduct.jsp">View Product</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ViewUser.jsp">View Users</a>
                                </li>
                                <li class="nav-item active">
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

    <div class="content">
        <h1>Barcode Scanner</h1>
        <button class="btn-open-camera" onclick="openCamera()">Open camera & Scan Barcode</button>

        <!-- Video element to display the camera feed -->
        <video id="videoElement" autoplay></video>

        <!-- Display the captured image -->
        <img id="capturedImage" src="" alt="Captured Image" />

        <!-- Display scanned barcode result -->
        <div id="barcodeResult" style="font-size: 18px; margin-top: 20px;"></div>
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

                // Send barcode data to server (AJAX call)
                fetch('/storeBarcode', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ barcode: barcode })
                })
                .then(response => response.json())
                .then(data => console.log('Barcode data stored:', data))
                .catch(error => console.error('Error storing barcode data:', error));
            });
        }

        // Capture the image when Enter key is pressed
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
                captureImage();
            }
        });

        // Capture the image from the video feed
        function captureImage() {
            const videoElement = document.getElementById('videoElement');
            const canvas = document.createElement('canvas');
            canvas.width = videoElement.videoWidth;
            canvas.height = videoElement.videoHeight;
            const context = canvas.getContext('2d');
            context.drawImage(videoElement, 0, 0, canvas.width, canvas.height);

            // Convert the captured image to data URL
            const imageData = canvas.toDataURL('image/png');

            // Stop the camera and hide video
            stopCamera();

            // Display the captured image
            const capturedImage = document.getElementById('capturedImage');
            capturedImage.src = imageData;
            capturedImage.style.display = 'block'; // Show the image

            // Trigger barcode scanning on the captured image
            scanBarcodeFromImage(imageData);
        }

        // Stop the camera stream
        function stopCamera() {
            if (stream) {
                const tracks = stream.getTracks();
                tracks.forEach(track => track.stop());
                stream = null;
            }
            // Hide video feed
            document.getElementById('videoElement').style.display = 'none';
        }

        // Scan barcode from captured image
        function scanBarcodeFromImage(imageData) {
            Quagga.decodeSingle({
                src: imageData,
                decoder: {
                    readers: ["code_128_reader", "ean_reader", "ean_8_reader", "upc_reader"]
                }
            }, function(result) {
                if (result) {
                    document.getElementById('barcodeResult').textContent = 'Scanned Barcode: ' + result.codeResult.code;
                } else {
                    document.getElementById('barcodeResult').textContent = 'No barcode detected in the image.';
                }
            });
        }
    </script>

    <!-- Load JavaScript Files -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>

</html>
