<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InstantFoods | Fresh Food Delivered</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
/* ===========================
   GOOGLE FONT
=========================== */

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

html{
    scroll-behavior:smooth;
}

body{

    background:#fff6ec;
    color:#2d3436;
    overflow-x:hidden;

}



/* ===========================
        NAVBAR
=========================== */

nav{

    width:100%;

    height:80px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 8%;

    position:fixed;

    top:0;

    left:0;

    z-index:1000;

    backdrop-filter:blur(18px);

    background:rgba(255,255,255,.85);

    box-shadow:0 5px 20px rgba(255,90,31,.1);

}

.logo{

    font-size:32px;

    font-weight:800;

    color:#ff5a1f;

    display:flex;

    align-items:center;

    gap:10px;

}

.logo span{

    color:#ffc400;

}

nav ul{

    display:flex;

    list-style:none;

    gap:40px;

}

nav ul li a{

    text-decoration:none;

    color:#444;

    font-weight:500;

    transition:.3s;

}

nav ul li a:hover{

    color:#ff5a1f;

}

.buttons{

    display:flex;

    gap:15px;

}

.login-btn{

    padding:10px 22px;

    border-radius:50px;

    border:none;

    background:#fff0e6;

    color:#ff5a1f;

    font-weight:600;

    cursor:pointer;

    transition:.3s;

}

.login-btn:hover{

    background:#ffe0cc;

}

.signup-btn{

    padding:10px 24px;

    border:none;

    border-radius:50px;

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

    color:white;

    font-weight:600;

    cursor:pointer;

    transition:.3s;

}

.signup-btn:hover{

    transform:translateY(-2px);

    box-shadow:0 12px 20px rgba(255,90,31,.35);

}



/* ===========================
        HERO
=========================== */

.hero{

    min-height:100vh;

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:150px 8% 80px;

    background:linear-gradient(120deg,#fff0e0 0%,#ffe3ea 60%,#fff6ec 100%);

    position:relative;

    overflow:hidden;

}

.hero::before{

    content:"";

    position:absolute;

    top:-150px;

    right:-150px;

    width:450px;

    height:450px;

    border-radius:50%;

    background:radial-gradient(circle,rgba(255,90,31,.25),transparent 70%);

}

.hero::after{

    content:"";

    position:absolute;

    bottom:-180px;

    left:-120px;

    width:400px;

    height:400px;

    border-radius:50%;

    background:radial-gradient(circle,rgba(255,196,0,.25),transparent 70%);

}

.hero-left{

    width:50%;

    position:relative;

    z-index:2;

}

.hero-left h1{

    font-size:60px;

    line-height:75px;

    margin-bottom:25px;

    color:#22201f;

}

.hero-left h1 span{

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

    -webkit-background-clip:text;

    -webkit-text-fill-color:transparent;

}

.hero-left p{

    font-size:18px;

    color:#666;

    line-height:32px;

    margin-bottom:35px;

}

.search-container{

    display:flex;

    gap:15px;

    flex-wrap:wrap;

}



/* ===========================
      LOCATION BOX
=========================== */

.location-box{

    width:auto;

    flex:1;

    min-width:220px;

    display:flex;

    align-items:center;

    gap:10px;

    background:white;

    border-radius:60px;

    overflow:hidden;

    padding:0 22px;

    box-shadow:0 15px 40px rgba(255,90,31,.15);

}

.search-box{

    width:auto;

    flex:1;

    min-width:220px;

    display:flex;

    align-items:center;

    gap:10px;

    background:white;

    border-radius:60px;

    overflow:hidden;

    padding:0 22px;

    box-shadow:0 15px 40px rgba(255,90,31,.15);

}

.location-box i,

.search-box i{

    color:#ff5a1f;

}

.location-box input,

.search-box input{

    flex:1;

    border:none;

    outline:none;

    padding:18px 10px;

    font-size:16px;

}

.location-box button{

    width:170px;

    border:none;

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

    color:white;

    font-size:16px;

    cursor:pointer;

}



/* ===========================
      HERO BUTTONS
=========================== */

.hero-buttons{

    margin-top:30px;

    display:flex;

    gap:18px;

}

.order-btn,

.explore-btn{

    padding:16px 35px;

    border:none;

    border-radius:50px;

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

    color:white;

    cursor:pointer;

    font-weight:600;

    text-decoration:none;

    display:inline-block;

    transition:.3s;

    box-shadow:0 12px 25px rgba(255,90,31,.3);

}

.order-btn:hover,

.explore-btn:hover{

    transform:translateY(-3px);

    box-shadow:0 18px 30px rgba(255,90,31,.4);

}

.explore-btn{

    background:white;

    color:#ff5a1f;

    border:2px solid #ff5a1f;

    box-shadow:none;

}

.menu-btn{

    padding:16px 35px;

    border-radius:50px;

    border:2px solid #ff5a1f;

    background:white;

    color:#ff5a1f;

    cursor:pointer;

    font-weight:600;

}



/* ===========================
      HERO IMAGE
=========================== */

.hero-right{

    width:45%;

    display:flex;

    justify-content:center;

    position:relative;

    z-index:2;

}

.hero-right img.main-food{

    width:460px;

    height:460px;

    object-fit:cover;

    border-radius:50%;

    border:10px solid white;

    box-shadow:0 30px 60px rgba(255,31,90,.25);

    animation:float 4s ease-in-out infinite;

}

.small-food{

    position:absolute;

    width:110px;

    height:110px;

    object-fit:cover;

    border-radius:50%;

    border:6px solid white;

    box-shadow:0 15px 30px rgba(0,0,0,.15);

    animation:float2 5s infinite;

}

.food1{

    top:20px;

    left:10px;

}

.food2{

    bottom:20px;

    right:0px;

}

.food3{

    top:160px;

    right:-40px;

}



/* ===========================
      FLOAT ANIMATION
=========================== */

@keyframes float{

0%{

transform:translateY(0);

}

50%{

transform:translateY(-20px);

}

100%{

transform:translateY(0);

}

}

@keyframes float2{

0%{

transform:translateY(0) rotate(0deg);

}

50%{

transform:translateY(-15px) rotate(10deg);

}

100%{

transform:translateY(0);

}

}



/* ===========================
      WAVE
=========================== */

.wave{

    margin-top:-120px;

    position:relative;

    z-index:1;

}

.wave svg{

    display:block;

    width:100%;

}


/* ==========================================
            SECTION TITLE
========================================== */

.section-title{
    text-align:center;
    margin-bottom:60px;
}

.section-title h2{
    font-size:42px;
    color:#22201f;
    margin-bottom:12px;
}

.section-title h2::after{

    content:"";

    display:block;

    width:70px;

    height:5px;

    margin:14px auto 0;

    border-radius:10px;

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

}

.section-title p{
    color:#777;
    font-size:17px;
}



/* ==========================================
              CATEGORIES
========================================== */

.categories{

    padding:100px 8%;

}

.category-container{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(170px,1fr));

    gap:30px;

}

.category-card{

    background:white;

    border-radius:30px;

    padding:35px;

    text-align:center;

    box-shadow:0 15px 40px rgba(255,90,31,.08);

    transition:.35s;

    border:3px solid transparent;

}

.category-card:hover{

    transform:translateY(-10px);

    box-shadow:0 25px 50px rgba(255,90,31,.22);

    border-color:#ffd9c2;

}

.category-card img{

    width:90px;

    height:90px;

    object-fit:cover;

    border-radius:50%;

    margin-bottom:18px;

    transition:.35s;

    border:4px solid #fff0e6;

}

.category-card:hover img{

    transform:scale(1.1) rotate(8deg);

    border-color:#ff5a1f;

}

.category-card h3{

    font-size:20px;

    color:#555;

}



/* ==========================================
            FEATURES
========================================== */

.features{

    padding:100px 8%;

    background:linear-gradient(135deg,#fff0e0,#ffe3ea);

}

.feature-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(240px,1fr));

    gap:30px;

}

.feature-card{

    background:white;

    padding:45px 30px;

    text-align:center;

    border-radius:30px;

    transition:.35s;

    box-shadow:0 10px 35px rgba(255,90,31,.08);

}

.feature-card:hover{

    transform:translateY(-12px);

}

.feature-icon{

    width:80px;

    height:80px;

    margin:0 auto 22px;

    border-radius:50%;

    display:flex;

    align-items:center;

    justify-content:center;

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

    color:white;

    font-size:32px;

}

.feature-card h3{

    margin-bottom:15px;

    color:#333;

}

.feature-card p{

    color:#777;

    line-height:28px;

}



/* ==========================================
        POPULAR RESTAURANTS
========================================== */

.popular{

    padding:100px 8%;

}

.restaurant-preview{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(270px,1fr));

    gap:35px;

}

.restaurant-preview-card{

    background:white;

    overflow:hidden;

    border-radius:25px;

    transition:.35s;

    box-shadow:0 10px 35px rgba(255,90,31,.1);

}

.restaurant-preview-card:hover{

    transform:translateY(-12px);

    box-shadow:0 25px 50px rgba(255,90,31,.25);

}

.restaurant-preview-card img{

    width:100%;

    height:220px;

    object-fit:cover;

}

.restaurant-preview-card h3{

    margin:18px;

}

.restaurant-preview-card span{

    margin-left:18px;

    color:#777;

}

.rating{

    margin:18px;

    display:inline-block;

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

    color:white;

    padding:8px 18px;

    border-radius:40px;

}

.browse-btn{

    margin-top:60px;

    text-align:center;

}

.browse-btn a{

    text-decoration:none;

    padding:16px 40px;

    border-radius:50px;

    background:linear-gradient(135deg,#ff5a1f,#ff1f5a);

    color:white;

    font-weight:600;

    transition:.35s;

    box-shadow:0 12px 25px rgba(255,90,31,.3);

}

.browse-btn a:hover{

    box-shadow:0 20px 40px rgba(255,90,31,.45);

    transform:translateY(-3px);

    display:inline-block;

}



/* ==========================================
              OFFERS
========================================== */

.offers{

    padding:100px 8%;

    background:#fff6ec;

}

.offer-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));

    gap:30px;

}

.offer-card{

    padding:45px;

    border-radius:30px;

    color:white;

    transition:.35s;

}

.offer-card:hover{

    transform:translateY(-10px);

}

.offer-card h2{

    font-size:40px;

    margin-bottom:12px;

}

.offer-card p{

    font-size:18px;

}

.pink{

    background:linear-gradient(135deg,#ff9ac8,#ff6aa9);

}

.blue{

    background:linear-gradient(135deg,#89c2ff,#4f8cff);

}

.green{

    background:linear-gradient(135deg,#7de3b3,#39c487);

}



/* ==========================================
              FOOTER
========================================== */

footer{

    margin-top:100px;

    background:#221a2b;

    color:white;

    padding:70px 8%;

}

.footer-container{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));

    gap:40px;

}

.footer-container h2{

    margin-bottom:15px;

    background:linear-gradient(135deg,#ff5a1f,#ffc400);

    -webkit-background-clip:text;

    -webkit-text-fill-color:transparent;

}

.footer-container h3{

    margin-bottom:18px;

    color:#ffc400;

}

.footer-container a{

    display:block;

    text-decoration:none;

    color:#ddd;

    margin-bottom:12px;

    transition:.3s;

}

.footer-container a:hover{

    color:#ff8a50;

}

.footer-container p{

    color:#d2d2d2;

    line-height:30px;

}

footer hr{

    margin:45px 0;

    border:.5px solid rgba(255,255,255,.15);

}

.copyright{

    text-align:center;

    color:#aaa;

}



/* ==========================================
          RESPONSIVE DESIGN
========================================== */

@media(max-width:992px){

.hero{

flex-direction:column;

text-align:center;

}

.hero-left{

width:100%;

}

.hero-right{

width:100%;

margin-top:60px;

}

.location-box{

width:100%;

margin:auto;

}

.hero-buttons{

justify-content:center;

}

.hero-left h1{

font-size:46px;

line-height:60px;

}

}

@media(max-width:768px){

nav{

padding:20px;

}

nav ul{

display:none;

}

.hero-left h1{

font-size:36px;

line-height:50px;

}

.hero-right img.main-food{

width:320px;

height:320px;

}

.small-food{

display:none;

}

.location-box{

flex-direction:column;

border-radius:20px;

}

.location-box button{

width:100%;

padding:16px;

}

.section-title h2{

font-size:32px;

}

}
</style>
</head>
<body>
<!-- ================= NAVBAR ================= -->
<header>
<nav class="navbar">
<div class="logo">
<i class="fa-solid fa-bowl-food"></i>
<h2>Instant<span>Foods</span></h2>
</div>
<ul class="nav-links">
<li><a href="#features">Features</a></li>
<li><a href="#offers">Offers</a></li>
<li><a href="#categories">Categories</a></li>
</ul>
<div class="nav-buttons">
<a href="login.jsp" class="btn-login">
Sign In
</a>
<a href="register.jsp" class="btn-register">
Get Started
</a>
</div>
</nav>
</header>
<!-- ================= HERO ================= -->
<section class="hero">
<div class="hero-left">
<h1>
Delicious Food
<br>
Delivered with
<span>Love ❤</span>
</h1>
<p>
Fresh meals from your favourite restaurants,
delivered to your doorstep in minutes.
</p>
<div class="search-container">
<div class="location-box">
<i class="fa-solid fa-location-dot"></i>
<input type="text"
placeholder="Enter your location">
</div>
<div class="search-box">
<i class="fa-solid fa-magnifying-glass"></i>
<input type="text"
placeholder="Search restaurants or dishes">
</div>
</div>
<div class="hero-buttons">
<a href="restaurants"
class="explore-btn">
Explore Restaurants
</a>
<a href="register.jsp"
class="order-btn">
Order Now
</a>
</div>
</div>
<!-- ================= RIGHT SIDE ================= -->
<div class="hero-right">
<!-- IMAGE: hero small food 1 (burger) - change src below to swap -->
<img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=300&q=80"
     class="floating small-food food1 burger">
<!-- IMAGE: hero small food 2 (pizza) - change src below to swap -->
<img src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=300&q=80"
     class="floating small-food food2 pizza">
<!-- IMAGE: hero small food 3 (noodles) - change src below to swap -->
<img src="https://images.unsplash.com/photo-1552611052-33e04de081de?auto=format&fit=crop&w=300&q=80"
     class="floating small-food food3 noodles">
<!-- IMAGE: hero main food platter - change src below to swap -->
<img src="https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=700&q=80"
     class="main-food">
</div>
</section>
<!-- ================= WAVE ================= -->
<div class="wave">
<svg xmlns="http://www.w3.org/2000/svg"
viewBox="0 0 1440 320">
<path fill="#ffffff"
fill-opacity="1"
d="M0,192L80,170.7C160,149,320,107,480,117.3C640,128,800,192,960,192C1120,192,1280,128,1360,96L1440,64L1440,320L1360,320C1280,320,1120,320,960,320C800,320,640,320,480,320C320,320,160,320,80,320L0,320Z">
</path>
</svg>
</div>
<!-- ===================== CATEGORIES ===================== -->
<section class="categories" id="categories">
    <div class="section-title">
        <h2>Explore Categories</h2>
        <p>Choose your favourite food</p>
    </div>
    <div class="category-container">
        <div class="category-card">
            <!-- IMAGE: category - pizza - change src below to swap -->
            <img src="https://loremflickr.com/150/150/pizza" onerror="this.onerror=null;this.src='https://picsum.photos/150/150?random=11';">
            <h3>Pizza</h3>
        </div>
        <div class="category-card">
            <!-- IMAGE: category - burger - change src below to swap -->
            <img src="https://loremflickr.com/150/150/burger" onerror="this.onerror=null;this.src='https://picsum.photos/150/150?random=12';">
            <h3>Burger</h3>
        </div>
        <div class="category-card">
            <!-- IMAGE: category - biryani - change src below to swap -->
            <img src="https://loremflickr.com/150/150/biryani" onerror="this.onerror=null;this.src='https://picsum.photos/150/150?random=13';">
            <h3>Biryani</h3>
        </div>
        <div class="category-card">
            <!-- IMAGE: category - noodles/chinese - change src below to swap -->
            <img src="https://loremflickr.com/150/150/noodles" onerror="this.onerror=null;this.src='https://picsum.photos/150/150?random=14';">
            <h3>Chinese</h3>
        </div>
        <div class="category-card">
            <!-- IMAGE: category - dessert - change src below to swap -->
            <img src="https://loremflickr.com/150/150/dessert" onerror="this.onerror=null;this.src='https://picsum.photos/150/150?random=15';">
            <h3>Desserts</h3>
        </div>
        <div class="category-card">
            <!-- IMAGE: category - beverages - change src below to swap -->
            <img src="https://loremflickr.com/150/150/drink" onerror="this.onerror=null;this.src='https://picsum.photos/150/150?random=16';">
            <h3>Beverages</h3>
        </div>
    </div>
</section>
<!-- ===================== FEATURES ===================== -->
<section class="features" id="features">
    <div class="section-title">
        <h2>Why InstantFoods?</h2>
        <p>Everything you need for a perfect food delivery experience.</p>
    </div>
    <div class="feature-grid">
        <div class="feature-card">
            <div class="feature-icon"><i class="fa-solid fa-motorcycle"></i></div>
            <h3>Fast Delivery</h3>
            <p>
                Your order reaches you in
                less than 30 minutes.
            </p>
        </div>
        <div class="feature-card">
            <div class="feature-icon"><i class="fa-solid fa-kitchen-set"></i></div>
            <h3>Best Restaurants</h3>
            <p>
                Carefully selected restaurants
                with top ratings.
            </p>
        </div>
        <div class="feature-card">
            <div class="feature-icon"><i class="fa-solid fa-tags"></i></div>
            <h3>Exclusive Offers</h3>
            <p>
                Enjoy exciting discounts
                every single day.
            </p>
        </div>
        <div class="feature-card">
            <div class="feature-icon"><i class="fa-solid fa-credit-card"></i></div>
            <h3>Secure Payments</h3>
            <p>
                UPI, Cards,
                Cash on Delivery and Wallets.
            </p>
        </div>
    </div>
</section>
<!-- ================= POPULAR RESTAURANTS ================= -->
<section class="popular">
<div class="section-title">
<h2>Popular Restaurants</h2>
<p>Discover top-rated restaurants</p>
</div>
<div class="restaurant-preview">
<div class="restaurant-preview-card">
<!-- IMAGE: restaurant - Pizza Hut - change src below to swap -->
<img src="https://loremflickr.com/400/300/pizza" onerror="this.onerror=null;this.src='https://picsum.photos/400/300?random=21';">
<h3>Pizza Hut</h3>
<span>Italian • Pizza</span>
<div class="rating">
⭐ 4.5
</div>
</div>
<div class="restaurant-preview-card">
<!-- IMAGE: restaurant - KFC - change src below to swap -->
<img src="https://loremflickr.com/400/300/chicken" onerror="this.onerror=null;this.src='https://picsum.photos/400/300?random=22';">
<h3>KFC</h3>
<span>Chicken • Burgers</span>
<div class="rating">
⭐ 4.3
</div>
</div>
<div class="restaurant-preview-card">
<!-- IMAGE: restaurant - Meghana Foods - change src below to swap -->
<img src="https://loremflickr.com/400/300/biryani" onerror="this.onerror=null;this.src='https://picsum.photos/400/300?random=23';">
<h3>Meghana Foods</h3>
<span>Biryani</span>
<div class="rating">
⭐ 4.8
</div>
</div>
<div class="restaurant-preview-card">
<!-- IMAGE: restaurant - Truffles - change src below to swap -->
<img src="https://loremflickr.com/400/300/restaurant" onerror="this.onerror=null;this.src='https://picsum.photos/400/300?random=24';">
<h3>Truffles</h3>
<span>Continental</span>
<div class="rating">
⭐ 4.7
</div>
</div>
</div>
<div class="browse-btn">
<a href="restaurants">
Browse All Restaurants →
</a>
</div>
</section>
<section class="offers" id="offers">
<div class="section-title">
<h2>Today's Offers</h2>
<p>Fresh deals every day</p>
</div>
<div class="offer-grid">
<div class="offer-card pink">
<h2>50% OFF</h2>
<p>On Pizza Orders</p>
</div>
<div class="offer-card blue">
<h2>Buy 1 Get 1</h2>
<p>Burgers</p>
</div>
<div class="offer-card green">
<h2>Free Delivery</h2>
<p>Above ₹199</p>
</div>
</div>
</section>
<footer>
<div class="footer-container">
<div>
<h2>InstantFoods</h2>
<p>
Fresh food.
Fast delivery.
Happy customers.
</p>
</div>
<div>
<h3>Quick Links</h3>
<a href="login.jsp">Login</a>
<a href="register.jsp">Register</a>
<a href="restaurants">Restaurants</a>
</div>
<div>
<h3>Contact</h3>
<p>Email : support@instantfoods.com</p>
<p>Phone : +91 9876543210</p>
</div>
</div>
<hr>
<p class="copyright">
© 2026 InstantFoods. All Rights Reserved.
</p>
</footer>
</body>
</html>
