<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>InstantFoods | Register</title>

<link rel="stylesheet" href="css/register.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    min-height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    background-image:
    linear-gradient(rgba(0,0,0,.45),rgba(0,0,0,.45)),
    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=80");

    background-size:cover;
    background-position:center;
    padding:40px;
}

/* Glass Container */

.container{

    width:1100px;

    max-width:95%;

    display:flex;

    border-radius:30px;

    overflow:hidden;

    backdrop-filter:blur(20px);

    background:rgba(255,255,255,.12);

    border:1px solid rgba(255,255,255,.25);

    box-shadow:0 20px 45px rgba(0,0,0,.35);

}

/* Left Section */

.left{

    width:50%;

    color:white;

    padding:70px 50px;

    display:flex;

    flex-direction:column;

    justify-content:center;

}

.left h1{

    font-size:56px;

    color:#FFD54F;

    margin-bottom:15px;

}

.left h2{

    font-size:32px;

    margin-bottom:20px;

}

.left p{

    line-height:32px;

    font-size:18px;

    color:#f1f1f1;

}

.food-icons{

    margin-top:40px;

    font-size:48px;

    letter-spacing:12px;

}

/* Right Section */

.right{

    width:50%;

    background:rgba(255,255,255,.18);

    display:flex;

    justify-content:center;

    align-items:center;

    padding:50px 0;

}

/* Form */

form{

    width:360px;

}

form h2{

    color:white;

    text-align:center;

    margin-bottom:30px;

    font-size:30px;

}

.input-group{

    margin-bottom:18px;

}

.input-group label{

    color:white;

    display:block;

    margin-bottom:7px;

    font-size:14px;

}

.input-group input,
.input-group textarea,
.input-group select{

    width:100%;

    padding:14px;

    border:none;

    outline:none;

    border-radius:12px;

    background:rgba(255,255,255,.90);

    font-size:15px;

    transition:.3s;

}

.input-group textarea{

    resize:none;

    height:90px;

}

.input-group input:focus,
.input-group textarea:focus,
.input-group select:focus{

    transform:scale(1.02);

    box-shadow:0 0 12px #FFD54F;

}

/* Password */

.password-box{

    position:relative;

}

.password-box input{

    padding-right:55px;

}

.password-box span{

    position:absolute;

    right:18px;

    top:50%;

    transform:translateY(-50%);

    cursor:pointer;

    font-size:18px;

}

/* Strength */

.strength{

    margin-top:6px;

    font-size:13px;

    color:#FFD54F;

}

/* Error */

.error{

    margin-top:5px;

    color:#ffb3b3;

    font-size:13px;

}

/* Button */

button{

    width:100%;

    padding:15px;

    margin-top:18px;

    border:none;

    border-radius:12px;

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

    box-shadow:0 8px 18px rgba(255,107,0,.5);

}

/* Bottom Link */

.bottom{

    margin-top:22px;

    text-align:center;

    color:white;

}

.bottom a{

    color:#FFD54F;

    text-decoration:none;

    font-weight:600;

}

.bottom a:hover{

    text-decoration:underline;

}

/* Floating Animation */

.container{

    animation:fadeIn .8s ease;

}

@keyframes fadeIn{

    from{

        opacity:0;

        transform:translateY(40px);

    }

    to{

        opacity:1;

        transform:translateY(0);

    }

}

/* Responsive */

@media(max-width:950px){

.container{

    flex-direction:column;

}

.left,
.right{

    width:100%;

}

.left{

    text-align:center;

    padding:50px 35px;

}

.left h1{

    font-size:44px;

}

.left h2{

    font-size:26px;

}

.right{

    padding:40px 0;

}

form{

    width:85%;

}

}




</style>

</head>

<body>

<div class="container">

    <!-- Left Section -->

    <div class="left">

        <h1>🍕 InstantFoods</h1>

        <h2>Join the Food Revolution!</h2>

        <p>

            Create your account and explore hundreds of restaurants,
            delicious meals, exciting offers and lightning-fast delivery.

            Fresh Food. Fast Delivery. Happy Moments.

        </p>

        <div class="food-icons">

            🍔 🍕 🍟 🌮 🍜 🥤

        </div>

    </div>

    <!-- Right Section -->

    <div class="right">

        <form action="RegisterServlet" method="post">

            <h2>Create Account</h2>

            <!-- Username -->

            <div class="input-group">

                <label>Username</label>

                <input
                type="text"
                name="Username"
                placeholder="Enter Username"
                required>

            </div>

            <!-- Email -->

            <div class="input-group">

                <label>Email</label>

                <input
                type="email"
                name="Email"
                placeholder="Enter Email"
                required>

            </div>

            <!-- Password -->

            <div class="input-group">

                <label>Password</label>

                <div class="password-box">

                    <input
                    type="password"
                    id="password"
                    name="Password"
                    placeholder="Enter Password"
                    required>

                    <span onclick="togglePassword('password')">👁</span>

                </div>

                <div class="strength" id="strength">

                </div>

            </div>

            <!-- Confirm Password -->

            <div class="input-group">

                <label>Confirm Password</label>

                <div class="password-box">

                    <input
                    type="password"
                    id="confirmPassword"
                    placeholder="Confirm Password"
                    required>

                    <span onclick="togglePassword('confirmPassword')">👁</span>

                </div>

                <div class="error" id="error">

                </div>

            </div>

            <!-- Address -->

            <div class="input-group">

                <label>Address</label>

                <textarea
                name="Address"
                placeholder="Enter Address"
                required></textarea>

            </div>

            <!-- Role -->

            <div class="input-group">

                <label>Role</label>

                <select name="Role">

                    <option value="Customer">

                        Customer

                    </option>

                    <option value="RestaurantOwner">

                        Restaurant Owner

                    </option>

                </select>

            </div>

            <button type="submit">

                Register

            </button>

            <div class="bottom">

                Already have an account?

                <a href="login.jsp">

                    Login

                </a>

            </div>

        </form>

    </div>

</div>

<script>

function togglePassword(id){

    let field=document.getElementById(id);

    if(field.type==="password"){

        field.type="text";

    }
    else{

        field.type="password";

    }

}

let password=document.getElementById("password");

let strength=document.getElementById("strength");

password.addEventListener("keyup",function(){

    let value=password.value;

    if(value.length==0){

        strength.innerHTML="";

    }

    else if(value.length<6){

        strength.style.color="red";

        strength.innerHTML="Weak Password";

    }

    else if(value.length<10){

        strength.style.color="orange";

        strength.innerHTML="Medium Password";

    }

    else{

        strength.style.color="lightgreen";

        strength.innerHTML="Strong Password";

    }

});

let confirmPassword=document.getElementById("confirmPassword");

let error=document.getElementById("error");

confirmPassword.addEventListener("keyup",function(){

    if(password.value!=confirmPassword.value){

        error.innerHTML="Passwords do not match";

    }

    else{

        error.innerHTML="";

    }

});

</script>

</body>

</html>