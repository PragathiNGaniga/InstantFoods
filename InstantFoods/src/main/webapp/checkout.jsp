<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.design.model.Cart"%>
<%@ page import="com.design.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout | InstantFoods</title>
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
    background:#faf7f2;
    color:#3a3a3a;
}

/* =============================
        NAVBAR
============================= */
.navbar{
    background:#ffffff;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 60px;
    box-shadow:0 2px 10px rgba(0,0,0,.05);
    position:sticky;
    top:0;
    z-index:100;
}

.logo a{
    text-decoration:none;
    font-size:26px;
    font-weight:700;
    color:#c97b52;
}

.logo span{
    color:#3a3a3a;
}

.nav-links{
    display:flex;
    gap:32px;
}

.nav-links a{
    text-decoration:none;
    color:#666;
    font-size:15px;
    font-weight:500;
    letter-spacing:.2px;
    transition:.3s;
    padding-bottom:4px;
    border-bottom:2px solid transparent;
}

.nav-links a:hover{
    color:#c97b52;
}

.nav-links a.active{
    color:#c97b52;
    border-bottom:2px solid #c97b52;
}

/* =============================
      PAGE CONTAINER
============================= */
.checkout-container{
    width:92%;
    max-width:720px;
    margin:0 auto;
    padding:50px 0 80px;
}

.page-title{
    text-align:center;
    margin-bottom:40px;
}

.page-title h1{
    font-size:32px;
    font-weight:600;
    color:#2b2b2b;
    margin-bottom:10px;
}

.page-title p{
    color:#8a8a8a;
    font-size:15px;
}

/* =============================
        CARD
============================= */
.checkout-card{
    background:#ffffff;
    border-radius:16px;
    padding:32px 34px;
    margin-bottom:26px;
    box-shadow:0 4px 18px rgba(0,0,0,.05);
    border:1px solid #f0ece6;
}

.checkout-card h2{
    font-size:19px;
    font-weight:600;
    color:#2b2b2b;
    margin-bottom:24px;
    padding-left:14px;
    border-left:4px solid #c97b52;
}

/* =============================
      DELIVERY FORM
============================= */
.form-group{
    margin-bottom:20px;
}

.form-group:last-child{
    margin-bottom:0;
}

.form-group label{
    display:block;
    font-size:13px;
    font-weight:600;
    color:#8a8a8a;
    text-transform:uppercase;
    letter-spacing:.5px;
    margin-bottom:8px;
}

.form-group input,
.form-group textarea{
    width:100%;
    padding:13px 16px;
    border:1px solid #e6e0d8;
    border-radius:10px;
    font-size:15px;
    font-family:'Poppins',sans-serif;
    color:#3a3a3a;
    background:#fdfcfa;
    transition:.25s;
    resize:vertical;
}

.form-group input:focus,
.form-group textarea:focus{
    outline:none;
    border-color:#c97b52;
    background:#ffffff;
    box-shadow:0 0 0 3px rgba(201,123,82,.12);
}

.form-group input[readonly]{
    color:#777;
    background:#f6f4f0;
}

/* =============================
      ORDER SUMMARY TABLE
============================= */
.order-table{
    width:100%;
    border-collapse:collapse;
    margin-bottom:22px;
}

.order-table th{
    text-align:left;
    font-size:12px;
    font-weight:600;
    text-transform:uppercase;
    letter-spacing:.5px;
    color:#a9a49c;
    padding:0 0 14px 0;
    border-bottom:1px solid #eee7dd;
}

.order-table td{
    padding:14px 0;
    font-size:15px;
    color:#3a3a3a;
    border-bottom:1px solid #f3efe9;
}

.order-table th:not(:first-child),
.order-table td:not(:first-child){
    text-align:right;
}

.order-table tr:last-child td{
    border-bottom:none;
}

.grand-total{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding-top:16px;
    border-top:2px solid #f0ece6;
}

.grand-total span:first-child{
    font-size:16px;
    font-weight:600;
    color:#3a3a3a;
}

.grand-total span:last-child{
    font-size:24px;
    font-weight:700;
    color:#c97b52;
}

/* =============================
      PAYMENT SELECT
============================= */
.payment-select{
    width:100%;
    padding:14px 16px;
    border:1px solid #e6e0d8;
    border-radius:10px;
    font-size:15px;
    font-family:'Poppins',sans-serif;
    color:#3a3a3a;
    background:#fdfcfa;
    cursor:pointer;
    transition:.25s;
    margin-bottom:8px;
    appearance:none;
    background-image:url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='%238a8a8a' stroke-width='2'><polyline points='6 9 12 15 18 9'/></svg>");
    background-repeat:no-repeat;
    background-position:right 16px center;
}

.payment-select:focus{
    outline:none;
    border-color:#c97b52;
    background-color:#ffffff;
    box-shadow:0 0 0 3px rgba(201,123,82,.12);
}

.payment-select:hover{
    border-color:#c97b52;
}

/* =============================
      PLACE ORDER BUTTON
============================= */
.place-order-section{
    margin-top:24px;
}

.place-order-btn{
    width:100%;
    padding:16px;
    border:none;
    border-radius:10px;
    background:#c97b52;
    color:#ffffff;
    font-size:16px;
    font-weight:600;
    letter-spacing:.3px;
    cursor:pointer;
    transition:.3s;
}

.place-order-btn:hover{
    background:#b06a44;
}

/* =============================
      RESPONSIVE
============================= */
@media(max-width:640px){

.navbar{
    padding:16px 24px;
    flex-direction:column;
    gap:12px;
}

.checkout-card{
    padding:24px 20px;
}

.order-table th,
.order-table td{
    font-size:13px;
}

}
</style>
</head>
<body>
<%
User user =
(User)request.getAttribute("user");
ArrayList<Cart> cartList =
(ArrayList<Cart>)request.getAttribute("cartList");
double grandTotal =
(Double)request.getAttribute("grandTotal");
%>
<!-- ============================= -->
<!-- NAVBAR                        -->
<!-- ============================= -->
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
        <a href="cart.jsp">
            Cart
        </a>
        <a href="CheckoutServlet"
           class="active">
            Checkout
        </a>
    </div>
</div>
<!-- ============================= -->
<!-- PAGE CONTAINER                -->
<!-- ============================= -->
<div class="checkout-container">
    <div class="page-title">
        <h1>
            Checkout
        </h1>
        <p>
            Review your delivery details before placing your order.
        </p>
    </div>
    <!-- ============================= -->
    <!-- DELIVERY DETAILS              -->
    <!-- ============================= -->
    <div class="checkout-card">
        <h2>
            Delivery Details
        </h2>
        <form action="PlaceOrderServlet"
              method="post">
            <div class="form-group">
                <label>
                    Customer Name
                </label>
                <input
                type="text"
                name="customerName"
                value="<%=user.getUsername()%>"
                readonly>
            </div>
            <div class="form-group">
                <label>
                    Email
                </label>
                <input
                type="email"
                name="email"
                value="<%=user.getEmail()%>"
                readonly>
            </div>
            <div class="form-group">
                <label>
                    Delivery Address
                </label>
                <textarea
                name="address"
                rows="4"
                required><%=user.getAddress()%></textarea>
            </div>
    <!-- ============================= -->
    <!-- ORDER SUMMARY                 -->
    <!-- ============================= -->
    </div>
    <div class="checkout-card">
        <h2>
            Order Summary
        </h2>
        <table class="order-table">
            <tr>
                <th>Item</th>
                <th>Qty</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
            <%
            for(Cart cart : cartList){
            %>
            <tr>
                <td>
                    <%=cart.getItemName()%>
                </td>
                <td>
                    <%=cart.getQuantity()%>
                </td>
                <td>
                    ₹ <%=String.format("%.2f",
                            cart.getPrice())%>
                </td>
                <td>
                    ₹ <%=String.format("%.2f",
                            cart.getTotalPrice())%>
                </td>
            </tr>
            <%
            }
            %>
        </table>
        <div class="grand-total">
            <span>
                Grand Total
            </span>
            <span>
                ₹ <%=String.format("%.2f",
                        grandTotal)%>
            </span>
        </div>
    </div>
    <!-- ============================= -->
    <!-- PAYMENT METHOD                -->
    <!-- ============================= -->
    <div class="checkout-card">
        <h2>
            Payment Method
        </h2>
        <!-- Your payment option -->
        <select name="paymentMethod" class="payment-select">
            <option value="Cash">Cash</option>
            <option value="UPI">UPI</option>
            <option value="Card">Card</option>
        </select>
        <%
        int restaurantId =
        cartList.get(0).getRestaurantID();
        %>
        <input
        type="hidden"
        name="restaurantId"
        value="<%=restaurantId%>">
        <input
        type="hidden"
        name="totalAmount"
        value="<%=grandTotal%>">
        <div class="place-order-section">
            <button
            type="submit"
            class="place-order-btn">
                Place Order
            </button>
        </div>
        </form>
    </div>
    </div>
<!-- checkout-container ends -->
</body>
</html>
