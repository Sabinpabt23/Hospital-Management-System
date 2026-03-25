<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Check if user is logged in
    HttpSession userSession = request.getSession(false);
    boolean isLoggedIn = (userSession != null && userSession.getAttribute("user_id") != null);
    String userRole = isLoggedIn ? (String) userSession.getAttribute("role") : null;
    String firstName = isLoggedIn ? (String) userSession.getAttribute("first_name") : null;
%>

<!-- ==================== TOP EMERGENCY BAR ==================== -->
<div class="top-emergency-bar">
    <div class="container emergency-top">
        <div class="emergency-contact">
            <i class="fas fa-phone-alt"></i>
            <span>24/7 Emergency Service:</span>
            <strong>+977 1-1234567890</strong>
            <span class="separator">|</span>
            <i class="fas fa-ambulance"></i>
            <span>Ambulance: 102</span>
        </div>
        <div class="hospital-hours">
            <i class="fas fa-clock"></i>
            <span>Open 24 Hours | 7 Days a Week</span>
        </div>
    </div>
</div>

<!-- ==================== NAVBAR ==================== -->
<header>
    <div class="container nav-container">
        <div class="logo">
            <h1><i class="fas fa-hospital-user"></i> MediLife</h1>
            <span>Hospital & Research Center</span>
        </div>
        <nav>
            <ul class="nav-links">
                <% if (isLoggedIn) { %>
                    <li><a href="${pageContext.request.contextPath}/<%= userRole %>/dashboard.jsp" class="active">Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/patient/book-appointment.jsp">Book Appointments</a></li>
                    <li><a href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a></li>
                <% } else { %>
                    <li><a href="${pageContext.request.contextPath}/" class="active">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a></li>
                <% } %>
            </ul>
        </nav>
        <div class="nav-buttons">
            <% if (isLoggedIn) { %>
                <span class="welcome-text">Welcome, <%= firstName %></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn-logout"><i class="fas fa-sign-out-alt"></i> LOGOUT</a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/login.jsp" class="btn-login"><i class="fas fa-sign-in-alt"></i> LOGIN</a>
                <a href="${pageContext.request.contextPath}/register.jsp" class="btn-register"><i class="fas fa-user-plus"></i> REGISTER</a>
            <% } %>
        </div>
    </div>
</header>