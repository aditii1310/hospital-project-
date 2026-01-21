<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <header>
        <nav>
            <div class="logo">HospitalCare</div>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#appointment">Appointment Booking</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#location">Location</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <!-- Home Section -->
    <section id="home" class="section">
        <div class="content">
            <h1>Welcome to HospitalCare</h1>
            <p>"Your health is our top priority. Explore a wide range of healthcare services tailored to your needs. Book an appointment with ease and experience hassle-free medical care."

Let me know if you need further refinements! .</p>
        </div>
    </section>

    <!-- Appointment Booking Section -->
    <section id="appointment" class="section">
        <div class="content">
            <h2>Book Your Appointment</h2>
            <form action="AppointmentServlet" method="POST">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <input type="date" name="date" required>
                <textarea name="message" placeholder="Your Message (Optional)"></textarea>
                <button type="submit">Book Now</button>
            </form>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="section">
        <div class="content">
            <h2>About Us</h2>
            <p>"We are a leading multi-specialty hospital dedicated to providing world-class healthcare services. With state-of-the-art medical facilities and a compassionate team of highly skilled experts, we ensure quality treatment and patient-centered care. Your well-being is our commitment."

Let me know if you need any modifications! .</p>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="section">
        <div class="content">
             <h1>Contact Us</h1>
             <br>
        
        <form>
            <label for='name'>Enter Name:</label>
            <input type='text' name='t1' id='name' placeholder='Enter Name'>
            <br><br>
             <label for='email'>Enter Email:</label>
            <input type='text' name='t2' id='email' placeholder="Enter Email">
            <br><br>
            <label for='phone'>Enter Phone:</label>
            <input type='text' name='t2' id='email' placeholder="Enter Email">
            <br><br>
            <label for='Message'>Enter Message:</label>
            <textarea name='t2' id='email' placeholder="Enter Message"></textarea>
            <br><br>
            <input type='submit' value='submit' onclick='message()'>
        </form>
        <script>
            function message(){
                alert(" Message Sent Succesfully")
            }
            </script>
           
        </div>
    </section>

    <!-- Location Section -->
    <section id="location" class="section">
        <div class="content">
            <h2>Our Location</h2>
            <p>Visit us at our central facility in Wellness City. Find us on the map below:</p>
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3154.0190188785065!2d-122.08424948502353!3d37.42206597982386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fba21dbefdc91%3A0xa3c792f8b5d5f0b1!2sGoogleplex!5e0!3m2!1sen!2sin!4v1637068387231!5m2!1sen!2sin"
                width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 HospitalCare. All rights reserved.</p>
    </footer>

    <script>
        // Smooth scroll
        $('nav a').on('click', function(event) {
            if (this.hash !== '') {
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
