<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gym Website</title>
  <style>
    /* General Styling */
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

/* Navigation Bar */
.navbar {
  position: fixed;
  top: 0;
  width: 100%;
  background-color: #333;
  padding: 10px 0;
  display: flex;
  justify-content: center;
  z-index: 1000; /* High z-index to ensure navbar stays on top */
}

.navbar a {
  color: white;
  padding: 14px 20px;
  text-decoration: none;
  text-align: center;
}

.navbar a:hover {
  background-color: #ddd;
  color: black;
}

/* home Section */
.home-section {
  position: relative;
  width: 100%;
  height: 100vh;
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 1)), url('/images/index.jpg') no-repeat center center/cover;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: white;
  text-align: center;
  z-index: 5;
}

.home-section h1, .home-section p {
  margin: 0;
}

.home-section .cta-buttons {
  margin-top: 20px;
}

.home-section .cta-buttons button {
  padding: 10px 20px;
  margin: 0 10px;
  border: none;
  background: #ff7f50;
  color: white;
  cursor: pointer;
  transition: background 0.3s;
}

.home-section .cta-buttons button:hover {
  background: #ff6347;
}

/* Content Sections */
.content-section {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 60px 20px;
  z-index: 5;
  margin-top: 50px; /* Offset for fixed navbar */
}

.content-section .content {
  width: 80%;
  padding: 20px;
}

.content-section .image-container {
  width: 40%;
  display: flex;
  justify-content: center;
}

.content-section .image-container img {
  max-width: 100%;
  border-radius: 10px;
}

/* Section Styles */
.about-section, .services-section, .trainers-section, .membership-section, .facilities-section, .offers-section, .contact-section {
  text-align: center;
  z-index: 5;
}

#services ul {
  list-style-type: none;
  padding: 0;
}

#services ul li {
  font-size: 18px; /* Change font size as desired */
  font-weight: bold; /* Change font weight as desired */
  margin-bottom: 10px;
}

#services ul li i {
  margin-right: 10px;
}

h2 {
  margin-bottom: 20px;
}

ul {
  list-style: none;
}

button {
  padding: 10px 20px;
  margin-top: 20px;
  border: none;
  background: #ff7f50;
  color: white;
  cursor: pointer;
  transition: background 0.3s;
}
button a{
  padding: 10px 20px;
  font-size:20px;
  margin-top: 20px;
  text-decoration: none
  border: none;
  background: #ff7f50;
  color: white;
  cursor: pointer;
  transition: background 0.3s;
}
button a:hover {
  background: #ff6347;
}
button:hover {
  background: #ff6347;
}

/* General styles for the footer */
.footer {
  background-color: #333; /* Dark background color */
  color: white; /* Text color */
  padding: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 350px;
}
.about-section {
  z-index: 5;
}
/* Styles for the left and right sections of the footer */
.footer-content {
  display: flex;
  justify-content: space-evenly;
  width: 100%;
}

.footer-left {
  flex: 1;
  margin-left: 150px;
}

.footer-right {
  flex: 0;
  text-align: right;
  margin-right: 50px;
}

.footer-right h2 {
  margin-top: 0;
}

.footer-right p,
.footer-right button {
  margin: 5px 0;
  align-self: center;
}

.contact-input {
  /* display: block; */
  width: 400px; /* Adjust width to fit padding */
  align-content: end;
  padding: 10px;
  margin: 5px 0;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

.membership-section {
  background-color: #f9f9f9;
  padding: 40px 20px;
  text-align: center;
  z-index: 5;
}

.membership-section .content h2 {
  font-size: 2.5em;
  margin-bottom: 20px;
}

.plans-container {
  display: flex;
  justify-content: center;
  gap: 20px;
}

.plan {
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  padding: 20px;
  width: 300px;
  text-align: left;
  position: relative;
}

.plan h3 {
  font-size: 1.5em;
  margin-bottom: 10px;
}

.plan .price {
  font-size: 2em;
  margin-bottom: 20px;
  color: #d9534f;
}

.plan .price span {
  font-size: 0.5em;
}

.plan ul {
  list-style: none;
  padding: 0;
  margin: 0 0 20px 0;
}

.plan ul li {
  font-size: 1em;
  margin-bottom: 10px;
  padding-left: 20px;
  position: relative;
}

.plan ul li::before {
  content: "";
  position: absolute;
  left: 0;
  color: #5cb85c;
}

.purchase-btn {
  background-color: #d9534f;
  color: #ffffff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1em;
}

.purchase-btn:hover {
  background-color: #c9302c;
}

.basic-plan::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 5px;
  background: linear-gradient(to right, #ff6f61, #d9534f);
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.premium-plan::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 5px;
  background: linear-gradient(to right, #ff6f61, #d9534f);
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.standard-plan::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 5px;
  background: linear-gradient(to right, #ff6f61, #d9534f);
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.ultimate-plan::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 5px;
  background: linear-gradient(to right, #ff6f61, #d9534f);
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

@media (max-width: 768px) {
  .plans-container {
    flex-direction: column;
    align-items: center;
  }
}

.image-about {
  background-image: url('/images/about.png');
  background-size: cover; /* Ensures the image covers the entire container */
  background-position: center; /* Centers the image within the container */
  background-repeat: no-repeat; /* Prevents the image from repeating */
  margin-right: 50px;
  height: 400px;
  width: 550px;
  border-radius: 10px; /* Optional: Adds rounded corners to the container */
}

.image-service {
  background-image: url('/images/g1.avif');
  background-size: cover; /* Ensures the image covers the entire container */
  background-position: center; /* Centers the image within the container */
  background-repeat: no-repeat; /* Prevents the image from repeating */
  /* margin-right: 50px; */
  margin-left: 150px;
  height: 500px;
  width: 1050px;
  border-radius: 10px; /* Optional: Adds rounded corners to the container */
}
.image-trainer {
  background-image: url('/images/trainer.jpg');
  background-size: cover; /* Ensures the image covers the entire container */
  background-position: center; /* Centers the image within the container */
  background-repeat: no-repeat; /* Prevents the image from repeating */
  margin-right: 50px;
  height: 500px;
  width: 1050px;
  border-radius: 10px; /* Optional: Adds rounded corners to the container */
}


.user-home-page {
  position: relative;
  z-index: 5; 
}


.bg {
  background-color: white;
}

.trainers-section {
  padding: 50px 0;
  background-color: #f9f9f9;
  text-align: center;
}

h2 {
  font-size: 36px;
  color: #333;
}

.trainer {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  padding: 20px;
  margin-bottom: 20px;
  text-align: left;
}

.trainer h3 {
  font-size: 24px;
  color: #333;
}

.trainer p {
  font-size: 18px;
  color: #666;
}
.message {
            color: green; /* Style the message */
            font-size: 16px;
            margin: 20px 0;
            background-color: #f0f0f0;
            border: 2px solid #4CAF50;
            padding: 10px;
            border-radius: 5px;
            width: 80%; 
            height:10px;
            max-width: 500px;
            position: relative;
        }
.message .close-btn {
            position: absolute;
            top: 5px;
            right: 5px;
            background: none;
            border: none;
            color: #4CAF50;
            font-size: 16px;
            cursor: pointer;
        }

  </style>
  <!-- <link rel="stylesheet" href="styles.css"> -->
     <script >
     function removeMessage() {
            document.getElementById('messageBox').style.display = 'none';
        }
    </script>
  
</head>
<body>
  <div class="user-home-page">
    <!-- Navigation Bar -->
    <div class="navbar">
      <a href="#home">Home</a>
      <a href="/slots">SLOT BOOKING</a>
      <a href="customerBookingDetails">BOOKING DETAILS</a>
      <a href="#about">About Us</a>
      <a href="#services">Services</a>
      <a href="#trainers">Trainers</a>
      <a href="#plans">Plans</a>
      <a href="/logout">Logout</a>

    </div>

    <div class="bg">
    	
      <!-- Home Section -->
      <div id="home" class="home-section">
      <c:if test="${not empty sessionScope.message}">
        <div id="messageBox" class="message">
            ${sessionScope.message}
            <button class="close-btn" onclick="removeMessage()">&times;</button>
        </div>
        <c:remove var="message" scope="session"/>
    </c:if>
        <h1 class="H1">Transform Your Life Today</h1>
        <p class="P1">Join the best gym in town and achieve your fitness goals</p>
        <div class="cta-buttons">
          <button><a href="/slots">Book Slot Now</a></button>
          <!-- <button onclick="getFreeTrial()">Get a Free Trial</button> -->
        </div>
      </div>
    
      <!-- About Section -->
      <section id="about" class="about-section content-section fade-in">
        <div class="content">
          <h2>About Us</h2>
          <p>
            Welcome to our Fitness Center, where we are committed to helping you achieve your fitness goals with our state-of-the-art facilities and expert trainers. Our mission is to provide a comprehensive fitness experience that caters to individuals of all fitness levels. Whether you are looking to build strength, improve your endurance, or maintain a healthy lifestyle, our gym offers a variety of services and programs to meet your needs.
            <br><br>
            At our gym, we pride ourselves on our supportive and motivating community. Our certified trainers are here to guide you every step of the way, offering personalized training plans and nutritional advice to ensure you get the most out of your workouts. Join us today and take the first step towards a healthier, fitter you!
          </p>
        </div>
        <div class="image-container image-about"></div>
      </section>
    
      <!-- Services Section -->
      <section id="services" class="services-section content-section slide-in-left">
        <div class="image-service"></div>
        <div class="content">
          <h2>Our Services</h2>
          <ul>
            <li><i class="fas fa-dumbbell"></i> Personal Training</li>
            <li><i class="fas fa-users"></i> Group Classes</li>
            <li><i class="fas fa-apple-alt"></i> Nutritional Guidance</li>
            <li><i class="fas fa-running"></i> Cardio Training</li>
            <li><i class="fas fa-weightlifting"></i> Strength Training</li>
            <li><i class="fas fa-praying-hands"></i> Yoga and Meditation</li>
            <li><i class="fas fa-hot-tub"></i> Steam Bath</li>
            <li><i class="fas fa-drum"></i> Zumba Dance</li>
          </ul>
          <button >View Full Schedule</button>
        </div>
      </section>
    
      <section id="trainers" class="trainers-section content-section slide-in-right">
        <div class="content">
          <h2>Meet Our Trainers</h2>
          <div class="trainer">
            <h3>Jane Doe</h3>
            <p>Strength Training Expert</p>
            <p>Contact: 123-456-7890</p>
            <p>Experience: Over 10 years of training experience in strength and conditioning.</p>
          </div>
          <div class="trainer">
            <h3>John Smith</h3>
            <p>Yoga Instructor</p>
            <p>Contact: 987-654-3210</p>
            <p>Experience: Certified yoga instructor with a focus on hatha and vinyasa yoga. Teaching for 7 years.</p>
          </div>
        </div>
        <div class="image-trainer"></div>
      </section>
    
      <!-- Membership Plans -->
      <section id="plans" class="membership-section content-section fade-in">
        <div class="content">
          <h2>Membership Plans</h2>
          <div class="plans-container">
            <div class="plan basic-plan">
              <h3>1 Month</h3>
              <p class="price">1200</p>
              <ul>
                <li>Unlimited Access to Home Club</li>
                <li>Free Fitness Training</li>
                <li>Free training session with a Club</li>
                <li>Over 16 free group fitness classes</li>
                <li>Free functional movement screen</li>
                <li>Movement screen</li>
              </ul>
              <button class="purchase-btn" >Purchase Now</button>
            </div>
            <div class="plan premium-plan">
              <h3>3 Months</h3>
              <p class="price">3600</p>
              <ul>
                <li>Unlimited Access to Home Club</li>
                <li>Free Fitness Training</li>
                <li>Free training session with a Club</li>
                <li>Over 16 free group fitness classes</li>
                <li>Free functional movement screen</li>
                <li>Movement screen</li>
              </ul>
              <button class="purchase-btn" >Purchase Now</button>
            </div>
            <div class="plan standard-plan">
              <h3>6 Months</h3> 
              <p class="price">7000</p>
              <ul>
                <li>Unlimited Access to Home Club</li>
                <li>Free Fitness Training</li>
                <li>Free training session with a Club</li>
                <li>Over 16 free group fitness classes</li>
                <li>Free functional movement screen</li>
                <li>Movement screen</li>
              </ul>
              <button class="purchase-btn" >Purchase Now</button>
            </div>
            <div class="plan ultimate-plan">
              <h3>1 Year</h3>
              <p class="price">10000</p>
              <ul>
                <li>Unlimited Access to Home Club</li>
                <li>Free Fitness Training</li>
                <li>Free training session with a Club</li>
                <li>Over 16 free group fitness classes</li>
                <li>Free functional movement screen</li>
                <li>Movement screen</li>
              </ul>
              <button class="purchase-btn" >Purchase Now</button>
            </div>
          </div>
        </div>
      </section>
    
     
     
    <!-- Footer Section -->
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-left">
          <p>&copy; 2024 Gym Website. All rights reserved.</p>
        </div>
        <div class="footer-right">
          <h2>Contact Us</h2>
          <p>Address: 123 Fitness St, Gym City</p>
          <p>Phone: (123) 456-7890</p>
          <!-- New text fields for email and user number -->
          <input type="text" placeholder="Name" class="contact-input" #nameField>
          <input type="email" placeholder="Email" class="contact-input" #emailField>
          <button >Contact Form</button>
        </div>
      </div>
    </footer>
  </div>
</div>
</body>
</html>