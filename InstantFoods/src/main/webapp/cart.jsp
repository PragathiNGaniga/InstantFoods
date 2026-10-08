<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.design.model.Cart"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart | InstantFoods</title>
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

    color:#333;

}



/* =======================
       NAVBAR
======================= */

.navbar{

    height:70px;

    background:#ffffff;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 60px;

    box-shadow:0 2px 8px rgba(0,0,0,0.08);

}

.logo a{

    text-decoration:none;

    font-size:28px;

    font-weight:700;

    color:#ff6b00;

}

.logo span{

    color:#222;

}

.nav-links{

    display:flex;

    gap:35px;

}

.nav-links a{

    text-decoration:none;

    color:#444;

    font-size:17px;

    font-weight:500;

    transition:0.3s;

}

.nav-links a:hover{

    color:#ff6b00;

}

.active{

    color:#ff6b00 !important;

}



/* =======================
       CONTAINER
======================= */

.cart-container{

    width:92%;

    max-width:1200px;

    margin:auto;

    padding:35px 0;

}



/* =======================
       TITLE
======================= */

.page-title{

    margin-bottom:35px;

}

.page-title h1{

    font-size:34px;

    color:#222;

}

.page-title p{

    color:#777;

    margin-top:8px;

}



/* =======================
       EMPTY CART
======================= */

.empty-cart{

    background:white;

    border-radius:18px;

    text-align:center;

    padding:60px;

    box-shadow:0 4px 12px rgba(0,0,0,.08);

}

.empty-cart img{

    width:220px;

    margin-bottom:20px;

}

.empty-cart h2{

    margin-bottom:12px;

    color:#444;

}

.empty-cart p{

    color:#777;

    margin-bottom:25px;

}

.continue-btn{

    display:inline-block;

    text-decoration:none;

    background:#ff6b00;

    color:white;

    padding:14px 28px;

    border-radius:8px;

    transition:.3s;

}

.continue-btn:hover{

    background:#e65f00;

}



/* =======================
      CART ITEMS
======================= */

.cart-items{

    display:flex;

    flex-direction:column;

    gap:22px;

}



/* =======================
      CART CARD
======================= */

.cart-card{

    background:white;

    border-radius:18px;

    padding:20px;

    display:flex;

    align-items:center;

    justify-content:space-between;

    box-shadow:0 4px 12px rgba(0,0,0,.08);

}



/* =======================
      IMAGE
======================= */

.cart-image{

    width:140px;

}

.cart-image img{

    width:120px;

    height:120px;

    object-fit:cover;

    border-radius:15px;

}



/* =======================
      DETAILS
======================= */

.cart-details{

    flex:1;

    padding-left:20px;

}

.cart-details h2{

    font-size:22px;

    margin-bottom:10px;

}

.price{

    color:#ff6b00;

    font-size:20px;

    font-weight:600;

    margin-bottom:8px;

}

.subtotal{

    color:#666;

    font-size:16px;

}



/* =======================
      QUANTITY
======================= */

.quantity-section{

    display:flex;

    align-items:center;

    gap:12px;

}

.quantity{

    font-size:20px;

    font-weight:600;

    min-width:30px;

    text-align:center;

}

.qty-btn{

    width:40px;

    height:40px;

    border:none;

    border-radius:50%;

    background:#ff6b00;

    color:white;

    cursor:pointer;

    font-size:20px;

    transition:.3s;

}

.qty-btn:hover{

    background:#e65f00;

}



/* =======================
      REMOVE
======================= */

.remove-btn{

    border:none;

    background:#dc3545;

    color:white;

    padding:12px 20px;

    border-radius:8px;

    cursor:pointer;

    transition:.3s;

}

.remove-btn:hover{

    background:#b52a37;

}



/* =======================
      RESPONSIVE
======================= */

@media(max-width:900px){

.cart-card{

    flex-direction:column;

    text-align:center;

    gap:18px;

}

.cart-details{

    padding-left:0;

}

.quantity-section{

    justify-content:center;

}

.navbar{

    flex-direction:column;

    height:auto;

    padding:20px;

    gap:15px;

}

}


/* =======================
      MENU BOTTOM (additional cart.css part)
======================= */

.menu-bottom{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:18px;
}
.price{
    font-size:20px;
    font-weight:bold;
    color:#ff5200;
}
.add-btn{
    background:#ff5200;
    color:white;
    border:none;
    padding:10px 25px;
    border-radius:8px;
    cursor:pointer;
    font-size:15px;
    font-weight:bold;
    transition:.3s;
}
.add-btn:hover{
    background:#e64700;
}
.out-btn{
    background:#ccc;
    color:white;
    border:none;
    padding:10px 20px;
    border-radius:8px;
}


/* ===========================
      CHECKOUT SECTION
=========================== */
.checkout-section{
    margin-top:40px;
    display:flex;
    justify-content:flex-end;
}
.checkout-card{
    width:350px;
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,.08);
}
.total-details{
    margin-bottom:20px;
}
.total-details h2{
    color:#666;
    margin-bottom:10px;
}
.total-details h1{
    color:#ff5200;
    font-size:34px;
}
.checkout-btn{
    display:block;
    width:100%;
    text-align:center;
    text-decoration:none;
    background:#ff5200;
    color:white;
    padding:15px;
    border-radius:10px;
    font-size:18px;
    font-weight:600;
    transition:.3s;
}
.checkout-btn:hover{
    background:#e64a00;
}
</style>
</head>
<body>
<%
ArrayList<Cart> cartList =
(ArrayList<Cart>)session.getAttribute("cart");
double grandTotal = 0;
if(cartList != null){
    for(Cart cart : cartList){
        grandTotal += cart.getTotalPrice();
    }
}
%>
<!-- ========================= -->
<!-- Navigation Bar            -->
<!-- ========================= -->
<div class="navbar">
    <div class="logo">
        <a href="restaurants">
            Instant<span>Foods</span>
        </a>
    </div>
    <div class="nav-links">
        <a href="restaurants">
            Restaurants
        </a>
        <a href="cart.jsp" class="active">
            Cart
        </a>
    </div>
</div>
<!-- ========================= -->
<!-- Page Heading              -->
<!-- ========================= -->
<div class="cart-container">
    <div class="page-title">
        <h1>Your Cart</h1>
        <p>
            Delicious food is waiting for you.
        </p>
    </div>
<%
if(cartList == null || cartList.isEmpty()){
%>
<div class="empty-cart">
    <img
    src="images/empty-cart.png"
    alt="Empty Cart">
    <h2>
        Your cart is empty
    </h2>
    <p>
        Looks like you haven't added
        anything yet.
    </p>
    <a href="restaurants"
       class="continue-btn">
        Browse Restaurants
    </a>
</div>
<%
}
else{
%>
<!-- Cart Items will start here -->
<div class="cart-items"> <%
for(Cart cart : cartList){
%>
<div class="cart-card">
    <!-- Food Image -->
    <div class="cart-image">
        <img
    		src="<%=cart.getImagePath()%>"
    		alt="<%=cart.getItemName()%>"
    		onerror="this.onerror=null;this.src='<%=request.getContextPath()%>/images/menu/default.jpg';">
    </div>
    <!-- Item Details -->
    <div class="cart-details">
        <h2>
            <%=cart.getItemName()%>
        </h2>
        <p class="price">
            ₹ <%=String.format("%.2f",cart.getPrice())%>
        </p>
        <p class="subtotal">
            Item Total :
            ₹ <%=String.format("%.2f",cart.getTotalPrice())%>
        </p>
    </div>
    <!-- Quantity Controls -->
    <div class="quantity-section">
        <!-- Minus -->
        <form
        action="CartServlet"
        method="post">
            <input
            type="hidden"
            name="action"
            value="decrease">
            <input
            type="hidden"
            name="menuId"
            value="<%=cart.getMenuID()%>">
            <button
            class="qty-btn">
                -
            </button>
        </form>
        <span class="quantity">
            <%=cart.getQuantity()%>
        </span>
        <!-- Plus -->
        <form
        action="CartServlet"
        method="post">
            <input
            type="hidden"
            name="action"
            value="increase">
            <input
            type="hidden"
            name="menuId"
            value="<%=cart.getMenuID()%>">
            <button
            class="qty-btn">
                +
            </button>
        </form>
    </div>
    <!-- Remove Button -->
    <div class="remove-section">
        <form
        action="CartServlet"
        method="post">
            <input
            type="hidden"
            name="action"
            value="remove">
            <input
            type="hidden"
            name="menuId"
            value="<%=cart.getMenuID()%>">
            <button
            class="remove-btn">
                Remove
            </button>
        </form>
    </div>
</div>
<%
}
%>
</div>
<!-- cart-items ends here -->
<!-- ========================= -->
<!-- Checkout Section          -->
<!-- ========================= -->
<div class="checkout-section">
    <div class="checkout-card">
        <div class="total-details">
            <h2>Grand Total</h2>
            <h1>
                ₹ <%=String.format("%.2f", grandTotal)%>
            </h1>
        </div>
        <a href="CheckoutServlet"
           class="checkout-btn">
            Proceed to Checkout
        </a>
    </div>
</div>
<!-- checkout-section ends here -->
<%
}
%>
</div>
<!-- cart-container ends here -->
</body>
</html>
