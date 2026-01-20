<%
    // Check login session
    String user = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- ======= CSS ADDED ======= -->
    <style>
        /* Body & background */
/* ===== BODY BACKGROUND ===== */
body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
    background: url("./images/hospital_bg.jpeg") no-repeat center center fixed;

    background-size: cover;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* ===== SECTIONS (TRANSPARENT) ===== */
section {
    padding: 40px 20px;
    text-align: center;
    background: transparent;   /* IMPORTANT */
}

/* ===== CARDS (SEMI-TRANSPARENT) ===== */
.card {
    background: rgba(255, 255, 255, 0.88); /* NOT solid white */
    padding: 30px 20px;
    margin: 20px auto;
    max-width: 600px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    transition: 0.3s;
}

/* ===== HEADER ===== */
header {
    background: #007bff;
    color: white;
    padding: 20px 0;
    text-align: center;
    font-size: 32px;
    font-weight: bold;
    box-shadow: 0 2px 6px rgba(0,0,0,0.3);
}

/* ===== NAVBAR ===== */
nav {
    background: #333;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    position: sticky;
    top: 0;
    z-index: 100;
}

nav a {
    text-decoration: none;
    color: white;
    margin: 10px 20px;
    font-size: 18px;
    padding: 10px 15px;
    border-radius: 6px;
    display: flex;
    align-items: center;
}

nav a i {
    margin-right: 8px;
}

nav a:hover {
    background: #007bff;
}

/* ===== TEXT ===== */
h1, h2, h3, h4, h5, h6 {
    color: #0d3b66;
}

p, label {
    color: #1a1a1a;
}

/* ===== DASHBOARD CARDS ===== */
.dash-card {
    background: rgba(255,255,255,0.9);
    width: 200px;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    text-align: center;
}

.dash-card h3 {
    margin: 15px 0;
    color: #333;
}

.dash-card a {
    text-decoration: none;
    display: inline-block;
    margin-top: 10px;
    padding: 8px 15px;
    color: white;
    border-radius: 6px;
    font-weight: bold;
}

.admin-card a { background: #e74c3c; }
.doctor-card a { background: #27ae60; }
.patient-card a { background: #2980b9; }

/* ===== FORM ===== */
form input, form textarea, form button {
    display: block;
    width: 100%;
    max-width: 400px;
    margin: 10px auto;
    padding: 12px;
    font-size: 16px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

form button {
    background: #007bff;
    color: white;
    border: none;
    cursor: pointer;
}

form button:hover {
    background: #0056b3;
}

/* ===== IFRAME & FOOTER ===== */
iframe {
    width: 100%;
    height: 300px;
    border-radius: 10px;
    border: none;
}

footer {
    background: #333;
    color: white;
    text-align: center;
    padding: 20px 0;
}


 
    </style>
</head>
<body>

<% if(request.getParameter("msg") != null) { %>
<script>
    alert("<%= request.getParameter("msg") %>");
</script>
<% } %>

<header>Hospital Management System</header>

<nav>
    <a href="#home"><i class="fas fa-home"></i>Home</a>
    <a href="#about"><i class="fas fa-hospital"></i>About Us</a>
    <a href="#contact"><i class="fas fa-phone"></i>Contact Us</a>
    <a href="#feedback"><i class="fas fa-comment-dots"></i>Feedback</a>
    <a href="#location"><i class="fas fa-map-marker-alt"></i>Location</a>

    <% if(user != null) { %>
    <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a>
<% } else { %>
    <a href="signup.jsp"><i class="fas fa-user-plus"></i>Signup</a>
<% } %>

</nav>

<!-- Role Dashboard Cards -->
<% if(user != null) { %>
<section id="dashboards">
    <h2><i class="fas fa-tachometer-alt"></i> Your Panel</h2>
    <div style="display:flex; justify-content:center; flex-wrap:wrap; gap:20px; margin-top:20px;">
        <% if(role.equals("admin")) { %>
            <div class="dash-card admin-card">
                <i class="fas fa-user-shield fa-2x"></i>
                <h3>Admin Panel</h3>
                <a href="adminDashboard.jsp">Go</a>
            </div>
        <% } else if(role.equals("doctor")) { %>
            <div class="dash-card doctor-card">
                <i class="fas fa-user-md fa-2x"></i>
                <h3>Doctor Panel</h3>
                <a href="doctorDashboard.jsp">Go</a>
            </div>
        <% } else if(role.equals("patient")) { %>
            <div class="dash-card patient-card">
                <i class="fas fa-user-injured fa-2x"></i>
                <h3>Patient Panel</h3>
                <a href="patientDashboard.jsp">Go</a>
            </div>
        <% } %>
    </div>
</section>
<% } %>

<!-- Home Section -->
<section id="home">
    <h1 style="color: #007bff; font-size: 36px; text-align: center; margin-bottom: 20px;">
        <i class="fas fa-heartbeat"></i> Welcome to HospitalCare
    </h1>
    <div class="card" style="max-width: 700px; margin: 0 auto; padding: 30px 20px;">
        <p>
            Your health and well-being are our highest priority. At HospitalCare, we offer a comprehensive range of healthcare services designed to meet the unique needs of every patient. From preventive care to specialized treatments, our experienced medical team ensures you receive personalized and compassionate care. Experience seamless, hassle-free medical services in a safe and comfortable environment, where your health is always in expert hands.
        </p>
    </div>
</section>


<!-- About Section -->
<section id="about">
    <h2><i class="fas fa-info-circle"></i> About Us</h2>
    <div class="card">
        <p>We are a leading multi-specialty hospital dedicated to providing world-class healthcare services. With state-of-the-art medical facilities and a compassionate team, we ensure quality treatment and patient-centered care.</p>
    </div>
</section>

<!-- Contact Section -->
<section id="contact">
    <h2><i class="fas fa-envelope"></i> Contact Us</h2>
    <div class="card">
        <form>
            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="text" name="phone" placeholder="Enter Phone">
            <textarea name="message" placeholder="Enter Message"></textarea>
            <button type="button" onclick="alert('Message Sent Successfully!')">Submit</button>
        </form>
    </div>
</section>

<!-- Feedback Section -->
<section id="feedback">
    <h2><i class="fas fa-star"></i> Feedback</h2>
    <div class="card">
        <form action="FeedbackServlet" method="POST">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" placeholder="Your Feedback" required></textarea>
            <button type="submit">Submit Feedback</button>
        </form>
    </div>
</section>

<!-- Location Section -->
<section id="location">
    <h2><i class="fas fa-map-marked-alt"></i> Our Location</h2>
    <p>Visit us at our central facility in Wellness City. Find us on the map below:</p>
    <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3154.0190188785065!2d-122.08424948502353!3d37.42206597982386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fba21dbefdc91%3A0xa3c792f8b5d5f0b1!2sGoogleplex!5e0!3m2!1sen!2sin!4v1637068387231!5m2!1sen!2sin"
        allowfullscreen="" loading="lazy"></iframe>
</section>

<footer>
    &copy; 2025 HospitalCare. All rights reserved.
</footer>

<script>
    // Smooth scroll for nav links
    $('nav a').on('click', function(event) {
        if(this.hash !== '') {
            event.preventDefault();
            const hash = this.hash;
            $('html, body').animate({
                scrollTop: $(hash).offset().top - 70
            }, 800);
        }
    });
    
</script>

</body>
</html>
