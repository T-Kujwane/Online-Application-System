<%-- 
    Document   : application_display
    Created on : 14 Jul 2024, 03:13:37
    Author     : Thato Keith Kujwane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applications</title>
        <link rel="stylesheet" href="primary_styles.css" type="text/css"/>
        <link rel="icon" href="BMA Approved Logo.ico" type="image/x-icon"/>
    </head>
    <body>
        <h1><%=getServletContext().getInitParameter("application_name")%></h1>

        <nav>
            <ul class="nav_list">
                <li class="nav_item"><a class="nav_link" id="home" href="home">Home</a></li>
                <li class="nav_item"><a class="nav_link" id="apply" href="apply">Apply</a></li>
                <li class="nav_item"><a class="nav_link" id="track_application" href="track_application">Track Application</a></li>
                <li class="nav_item"><a class="nav_link" id="about_us" href="about_us">About Us</a></li>
                <li class="nav_item"><a class="nav_link" id="register" href="register">Register</a></li>
                <li class="nav_item"><a class="nav_link" id="login" href="login">Login</a></li>
            </ul>
        </nav>

        <h2>Track Applications</h2>

        <p class="first_paragraph">
            Enter your ID number below to see applications you have made.
        </p>

        <div class="applications_display" hidden="">
            Information will be displayed here.
        </div>
        
        <form action="track_application" method="POST">
            <table class="id_number_prompt">
                <tr>
                    <td><label class="prompt" for="id_number_input">Enter your 13 digit ID Number</label></td>
                </tr>
                <tr>
                    <td><input type="text" name="id_number" id="id_number_input" required="" minlength="13" maxlength="13"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Fetch Applications"></td>
                </tr>
            </table>
        </form> 
    </body>
</html>
