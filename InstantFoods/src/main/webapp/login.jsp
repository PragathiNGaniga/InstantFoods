<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InstantFoods | Login</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    background-image:
    linear-gradient(rgba(0,0,0,.45),rgba(0,0,0,.45)),
    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=80");

    background-size:cover;
    background-position:center;
    overflow:hidden;
}

/* Glass Card */

.container{

    width:1000px;
    height:600px;

    display:flex;

    border-radius:30px;

    overflow:hidden;

    backdrop-filter:blur(20px);

    background:rgba(255,255,255,0.12);

    border:1px solid rgba(255,255,255,.25);

    box-shadow:0 25px 45px rgba(0,0,0,.35);

}

/* Left */

.left{

    width:55%;

    color:white;

    display:flex;

    flex-direction:column;

    justify-content:center;

    padding:70px;

}

.left h1{

    font-size:60px;

    margin-bottom:15px;

    color:#FFD54F;
}

.left h2{

    font-size:34px;

    margin-bottom:20px;
}

.left p{

    font-size:18px;

    line-height:34px;

    color:#f5f5f5;
}

.food{

    font-size:55px;

    margin-top:40px;
}

/* Right */

.right{

    width:45%;

    display:flex;

    justify-content:center;

    align-items:center;

    background:rgba(255,255,255,.18);

}

form{

    width:340px;
}

form h2{

    text-align:center;

    color:white;

    margin-bottom:35px;

    font-size:32px;
}

.input-box{

    margin-bottom:22px;
}

.input-box label{

    color:white;

    font-size:15px;

    display:block;

    margin-bottom:8px;
}

.input-box input{

    width:100%;

    padding:15px;

    border:none;

    outline:none;

    border-radius:12px;

    background:rgba(255,255,255,.85);

    font-size:15px;

    transition:.3s;
}

.input-box input:focus{

    transform:scale(1.02);

    box-shadow:0 0 10px #FFD54F;
}

button{

    width:100%;

    padding:15px;

    border:none;

    border-radius:12px;

    margin-top:15px;

    background:#ff6b00;

    color:white;

    font-size:18px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

button:hover{

    background:#ff4500;

    transform:translateY(-3px);

    box-shadow:0 8px 20px rgba(255,107,0,.5);

}

.extra{

    text-align:center;

    margin-top:25px;

    color:white;
}

.extra a{

    color:#FFD54F;

    text-decoration:none;

    font-weight:bold;
}

.extra a:hover{

    text-decoration:underline;
}

/* Responsive */

@media(max-width:900px){

.container{

    width:92%;
    height:auto;

    flex-direction:column;

}

.left,.right{

    width:100%;

}

.left{

    padding:40px;
    text-align:center;
}

.left h1{

    font-size:45px;
}

.left h2{

    font-size:28px;
}

.right{

    padding:40px 0;
}

}

</style>

</head>

<body>

<div class="container">

<div class="left">

<h1>🍕 InstantFoods</h1>

<h2>Food Delivered in Minutes</h2>

<p>

Hungry?

Discover restaurants around you and order
your favourite meals with just a few clicks.

Fast delivery.
Fresh food.
Amazing offers.

</p>

<div class="food">

🍔 🍕 🍟 🌮 🍜 🥤

</div>

</div>


<div class="right">
<%
String errorMessage = (String)request.getAttribute("errorMessage");

if(errorMessage != null){
%>

<p style="color:red;
text-align:center;
margin-bottom:15px;">
<%= errorMessage %>
</p>

<%
}
%>
<form action="LoginServlet" method="post">

<h2>Welcome Back 👋</h2>

<div class="input-box">

<label>Email</label>

<input
type="email"
name="Email"
placeholder="Enter your email"
required>

</div>


<div class="input-box">

<label>Password</label>

<input
type="password"
name="Password"
placeholder="Enter password"
required>

</div>

<button type="submit">

Login

</button>

<div class="extra">

Don't have an account?

<a href="register.jsp">

Create One

</a>

</div>

</form>

</div>

</div>

</body>
</html>