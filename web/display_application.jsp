<%-- 
    Document   : display_application
    Created on : 14 Jul 2024, 04:53:27
    Author     : Thato Keith Kujwane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.example.persistance.DatabaseManager.Applicant" %>
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
        
        <h2>Applications</h2>
        <%
            Applicant applicant = (Applicant) session.getAttribute("applicant");
        %>
        <p class="first_paragraph">
            <%if (applicant == null){%>
                You have not yet made any applications on this system. Click <a href="apply">here</a> to apply.
            <%}else {%>
                Applications made by <%=applicant.getFirstName() + " " + applicant.getSurname()%><br>
                
                <embed src="data:application/pdf;base64, <%=applicant.getStringIDCopy()%>" width="20" height="30">
            <%}%>
        </p>
    </body>
</html>
