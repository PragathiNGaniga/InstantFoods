<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.design.model.Menu"%>
<%@ page import="com.design.model.Restaurant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Menu | InstantFoods</title>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{

    background:#f5f5f5;

    color:#333;

}



/* ==========================
        NAVBAR
========================== */

.navbar{

    background:#ffffff;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:18px 50px;

    box-shadow:0 2px 10px rgba(0,0,0,0.08);

    position:sticky;

    top:0;

    z-index:100;

}

.logo a{

    text-decoration:none;

    font-size:28px;

    font-weight:bold;

    color:#ff5200;

}

.logo span{

    color:#222;

}

.nav-links{

    display:flex;

    gap:30px;

}

.nav-links a{

    text-decoration:none;

    color:#333;

    font-size:16px;

    font-weight:600;

    transition:.3s;

}

.nav-links a:hover{

    color:#ff5200;

}



/* ==========================
      RESTAURANT HEADER
========================== */

.restaurant-header{

    background:white;

    width:90%;

    max-width:1200px;

    margin:35px auto;

    border-radius:18px;

    display:flex;

    align-items:center;

    gap:30px;

    padding:30px;

    box-shadow:0 6px 20px rgba(0,0,0,.08);

}

.restaurant-image img{

    width:240px;

    height:180px;

    object-fit:cover;

    border-radius:15px;

}

.restaurant-details{

    flex:1;

}

.restaurant-details h1{

    font-size:34px;

    margin-bottom:10px;

}

.cuisine{

    color:#666;

    font-size:18px;

    margin-bottom:8px;

}

.address{

    color:#888;

    margin-bottom:20px;

}

.restaurant-info{

    display:flex;

    gap:20px;

    align-items:center;

}

.rating{

    background:#16a34a;

    color:white;

    padding:7px 15px;

    border-radius:8px;

    font-weight:bold;

}



/* ==========================
       MENU HEADING
========================== */

.menu-heading{

    width:90%;

    max-width:1200px;

    margin:auto;

    margin-bottom:20px;

}

.menu-heading h2{

    font-size:30px;

    margin-bottom:8px;

}

.menu-heading p{

    color:#777;

}



/* ==========================
      MENU CONTAINER
========================== */

.menu-container{

    width:90%;

    max-width:1200px;

    margin:auto;

    display:flex;

    flex-direction:column;

    gap:28px;

    padding-bottom:50px;

}



/* ==========================
        MENU CARD
========================== */

.menu-card{

    background:white;

    border-radius:18px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:25px;

    box-shadow:0 6px 18px rgba(0,0,0,.08);

    transition:.3s;

}

.menu-card:hover{

    transform:translateY(-4px);

    box-shadow:0 12px 24px rgba(0,0,0,.15);

}



/* ==========================
      FOOD DETAILS
========================== */

.food-details{

    width:65%;

}

.food-details h3{

    font-size:24px;

    margin:10px 0;

}

.description{

    color:#666;

    margin:12px 0;

    line-height:1.6;

}

.price{

    color:#ff5200;

    margin:15px 0;

    font-size:28px;

}



/* ==========================
     VEG / NON VEG
========================== */

.veg{

    color:#16a34a;

    font-weight:bold;

    font-size:14px;

}

.nonveg{

    color:#d32f2f;

    font-weight:bold;

    font-size:14px;

}



/* ==========================
      AVAILABLE
========================== */

.available{

    color:#16a34a;

    font-weight:bold;

}

.unavailable{

    color:red;

    font-weight:bold;

}



/* ==========================
       FOOD IMAGE
========================== */

.food-image{

    width:260px;

    text-align:center;

    position:relative;

}

.food-image img{

    width:220px;

    height:170px;

    border-radius:15px;

    object-fit:cover;

    box-shadow:0 5px 15px rgba(0,0,0,.12);

}



/* ==========================
       ADD BUTTON
========================== */

.add-btn{

    margin-top:15px;

    background:#ff5200;

    color:white;

    border:none;

    padding:12px 34px;

    border-radius:10px;

    cursor:pointer;

    font-size:16px;

    font-weight:bold;

    transition:.3s;

}

.add-btn:hover{

    background:#e64a00;

}



/* ==========================
      NO MENU
========================== */

.no-menu{

    width:100%;

    text-align:center;

    background:white;

    border-radius:15px;

    padding:70px;

    box-shadow:0 4px 15px rgba(0,0,0,.08);

}

.no-menu h2{

    margin-bottom:10px;

}

.no-menu p{

    color:#666;

}



/* ==========================
      RESPONSIVE
========================== */

@media(max-width:900px){

.restaurant-header{

flex-direction:column;

text-align:center;

}

.menu-card{

flex-direction:column;

}

.food-details{

width:100%;

margin-bottom:20px;

}

.food-image{

width:100%;

}

.food-image img{

width:100%;

max-width:280px;

height:200px;

}

.navbar{

padding:18px 20px;

}

}


/* ==========================
   MENU BOTTOM (from menu.jsp part 2)
   Added since .menu-bottom / .out-btn
   were referenced in part 2 markup but
   not defined in the supplied menu.css
========================== */

.menu-bottom{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:18px;
}

.out-btn{
    background:#ccc;
    color:white;
    border:none;
    padding:12px 34px;
    border-radius:10px;
    font-size:16px;
    font-weight:bold;
    cursor:not-allowed;
}
</style>
</head>
<body>
<%
Restaurant restaurant =
(Restaurant)request.getAttribute("restaurant");
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>
<!-- ===========================
        Navbar
=========================== -->
<div class="navbar">
	<div class="logo">
		<a href="restaurants">
			Instant<span>Foods</span>
		</a>
	</div>
	<div class="nav-links">
		<a href="restaurants">Restaurants</a>
		<a href="CartServlet">
			Cart
		</a>
	</div>
</div>
<!-- ===========================
      Restaurant Header
=========================== -->
<div class="restaurant-header">
	<div class="restaurant-image">
		<img
		src="<%=request.getContextPath()%>/<%=restaurant.getImagePath()%>"
		alt="<%=restaurant.getName()%>"
		onerror="this.src='<%=request.getContextPath()%>/images/restaurants/default.jpg'">
	</div>
	<div class="restaurant-details">
		<h1>
			<%=restaurant.getName()%>
		</h1>
		<p class="cuisine">
			<%=restaurant.getCuisineType()%>
		</p>
		<p class="address">
			<%=restaurant.getAddress()%>
		</p>
		<div class="restaurant-info">
			<span class="rating">
				★ <%=restaurant.getRating()%>
			</span>
			<span>
				<%=restaurant.getDeliveryTime()%> mins
			</span>
		</div>
	</div>
</div>
<!-- ===========================
      Menu Heading
=========================== -->
<div class="menu-heading">
	<h2>
		Menu
	</h2>
	<p>
		<%=menuList.size()%> Items Available
	</p>
</div>
<!-- ===========================
	Menu Container Starts Here
=========================== -->
<div class="menu-container">
<%
if(menuList == null || menuList.isEmpty()){
%>
<div class="no-menu">
	<h2>No Menu Available</h2>
	<p>Sorry! This restaurant hasn't added any menu items yet.</p>
</div>
<%
}
else{
	for(Menu menu : menuList){
		String imagePath = menu.getImagePath();
		if(imagePath == null || imagePath.trim().equals("")){
			imagePath = "images/menu/default-food.jpg";
		}
%>
<div class="menu-card">
	<!-- Food Details -->
	<div class="food-details">
		<div class="food-type">
			<%
			String description = menu.getDescription().toLowerCase();
			if(description.contains("chicken")
					|| description.contains("fish")
					|| description.contains("egg")
					|| description.contains("mutton")){
			%>
				<span class="nonveg">● NON-VEG</span>
			<%
			}
			else{
			%>
				<span class="veg">● VEG</span>
			<%
			}
			%>
		</div>
		<h3>
			<%=menu.getItemName()%>
		</h3>
		<p class="description">
			<%=menu.getDescription()%>
		</p>
		<%
		if(menu.isIsAvailable()){
		%>
			<span class="available">
				Available
			</span>
		<%
		}
		else{
		%>
			<span class="unavailable">
				Out Of Stock
			</span>
		<%
		}
		%>
	</div>
	<!-- Food Image -->
	<div class="food-image">
		<%
		String imgSrc = (imagePath.startsWith("http://")
				|| imagePath.startsWith("https://"))
				? imagePath
				: request.getContextPath() + "/" + imagePath;
		%>
		<img
		src="<%=imgSrc%>"
		alt="<%=menu.getItemName()%>"
		onerror="this.src='<%=request.getContextPath()%>/images/menu/default-food.jpg'">
	</div>
	<!-- ===========================
	     Menu Bottom (single ADD / OUT OF STOCK section)
	=========================== -->
	<div class="menu-bottom">
	    <div class="price">
	        ₹ <%= menu.getPrice() %>
	    </div>
	    <% if(menu.isIsAvailable()) { %>
	        <form action="CartServlet" method="post">
	            <input type="hidden"
	                   name="action"
	                   value="add">
	            <input type="hidden"
	                   name="menuId"
	                   value="<%= menu.getMenuID() %>">
	            <input type="hidden"
	                   name="restaurantId"
	                   value="<%= menu.getRestaurantID() %>">
	            <input type="hidden"
	                   name="quantity"
	                   value="1">
	            <button class="add-btn">
	                ADD
	            </button>
	        </form>
	    <% } else { %>
	        <button class="out-btn" disabled>
	            OUT OF STOCK
	        </button>
	    <% } %>
	</div>
</div>
<%
	}
}
%>
</div>
<!-- menu-container ends here -->
</body>
</html>
