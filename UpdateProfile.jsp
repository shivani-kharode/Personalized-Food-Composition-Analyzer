<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        /* Your existing CSS styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('images/');  /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
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
        .container {
            display: flex;
            justify-content: space-between;
            padding-top: 120px; /* Space below header */
        }
        .form-container {
            width: 45%;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.4);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn {
            background-color: #008080;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
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
    </style>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    
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
                                <li class="nav-item">
                                    <a class="nav-link" href="UserResult.jsp">Scan Barcode<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="UpdateProfile.jsp">Update Health Parameters <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Suggest_Videos.jsp">Yoga Videos<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ViewNews.jsp">Food News<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">LOGOUT</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
    </div>

    <div class="container">
        <div class="form-container">
            <h2>Update Your Profile</h2>

            <form method="POST" action="UpdateProfile.jsp">
                <div class="form-group">
                    <input type="text" name="age" class="form-control" placeholder="Age" required />
                </div>

                <div class="form-group">
                    <input type="text" name="weight" class="form-control" placeholder="Weight" required />
                </div>

                <div class="form-group">
                    <input type="text" name="bloodGroup" class="form-control" placeholder="Blood Group" required />
                </div>

                <div class="form-group">
                    <select name="diabetic" class="form-control" required>
                        <option value="yes">Diabetic</option>
                        <option value="no">Not Diabetic</option>
                    </select>
                </div>

                <div class="form-group">
                    <select name="bpLevel" class="form-control" required>
                        <option value="high">High Blood Pressure</option>
                        <option value="medium">Medium Blood Pressure</option>
                        <option value="low">Low Blood Pressure</option>
                    </select>
                </div>

                <div class="form-group">
                    <select name="healthCondition" class="form-control" required>
                        <option value="good">Good Health</option>
                        <option value="bad">Bad Health</option>
                    </select>
                </div>

                <button class="btn" type="submit">Update Profile</button>
            </form>
        </div>
    </div>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            Integer userId = (Integer) session.getAttribute("uid");

            if (userId != null) {
                String age = request.getParameter("age");
                String weight = request.getParameter("weight");
                String bloodGroup = request.getParameter("bloodGroup");
                String diabetic = request.getParameter("diabetic");
                String bpLevel = request.getParameter("bpLevel");
                String healthCondition = request.getParameter("healthCondition");

                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personalized_food_composition_analyzer", "root", "root");

                    String selectQuery = "SELECT * FROM health_detail WHERE uid = ?";
                    pst = con.prepareStatement(selectQuery);
                    pst.setInt(1, userId);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        String updateQuery = "UPDATE health_detail SET age = ?, weight = ?, bloodGroup = ?, diabetic = ?, bpLevel = ?, healthCondition = ? WHERE uid = ?";
                        pst = con.prepareStatement(updateQuery);
                        pst.setString(1, age);
                        pst.setString(2, weight);
                        pst.setString(3, bloodGroup);
                        pst.setString(4, diabetic);
                        pst.setString(5, bpLevel);
                        pst.setString(6, healthCondition);
                        pst.setInt(7, userId);

                        int result = pst.executeUpdate();
                        out.println(result > 0 ? "<script>alert('Profile updated successfully!');</script>" : "<script>alert('Error updating profile!');</script>");
                    } else {
                        String insertQuery = "INSERT INTO health_detail (age, weight, bloodGroup, diabetic, bpLevel, healthCondition, uid) VALUES (?, ?, ?, ?, ?, ?, ?)";
                        pst = con.prepareStatement(insertQuery);
                        pst.setString(1, age);
                        pst.setString(2, weight);
                        pst.setString(3, bloodGroup);
                        pst.setString(4, diabetic);
                        pst.setString(5, bpLevel);
                        pst.setString(6, healthCondition);
                        pst.setInt(7, userId);

                        int result = pst.executeUpdate();
                        out.println(result > 0 ? "<script>alert('Profile inserted successfully!');</script>" : "<script>alert('Error inserting profile!');</script>");
                    }
                } catch (Exception e) {
                    out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (pst != null) pst.close();
                        if (con != null) con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            } else {
                out.println("<script>alert('Please log in to update your profile.');</script>");
                response.sendRedirect("login.jsp");
            }
        }
    %>

</body>
</html>
