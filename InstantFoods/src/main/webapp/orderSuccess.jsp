<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String orderId = request.getParameter("orderId");

if(orderId == null){
    orderId = "N/A";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful | InstantFoods</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    background:#f8f8f8;

    display:flex;

    justify-content:center;

    align-items:center;

    min-height:100vh;

}

.success-card{

    width:500px;

    background:white;

    padding:45px;

    border-radius:18px;

    text-align:center;

    box-shadow:0 8px 25px rgba(0,0,0,.12);

}

.success-icon{

    width:120px;

    height:120px;

    margin:auto;

    margin-bottom:25px;

    border-radius:50%;

    background:#28a745;

    display:flex;

    justify-content:center;

    align-items:center;

    color:white;

    font-size:60px;

}

.success-card h1{

    color:#28a745;

    margin-bottom:15px;

}

.success-card p{

    color:#666;

    margin-bottom:12px;

    font-size:17px;

}

.order-id{

    margin:25px 0;

    font-size:22px;

    font-weight:bold;

    color:#ff5200;

}

.delivery{

    margin-top:10px;

    color:#555;

    font-size:18px;

}

.btn{

    display:inline-block;

    margin-top:35px;

    padding:14px 35px;

    background:#ff5200;

    color:white;

    text-decoration:none;

    border-radius:8px;

    font-size:17px;

    transition:.3s;

}

.btn:hover{

    background:#e64a00;

}

</style>

</head>

<body>

<div class="success-card">

    <div class="success-icon">

        ✓

    </div>

    <h1>

        Order Placed Successfully!

    </h1>

    <p>

        Thank you for ordering with

        <b>InstantFoods</b>.

    </p>

    <p>

        Your delicious food is now being prepared.

    </p>

    <div class="order-id">

        Order ID : #<%=orderId%>

    </div>

    <div class="delivery">

        Estimated Delivery Time

        <br><br>

        <b>25 - 35 Minutes</b>

    </div>

    <a href="restaurants"
       class="btn">

        Continue Ordering

    </a>

</div>

</body>
</html>