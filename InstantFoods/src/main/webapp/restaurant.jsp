<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.design.model.Restaurant"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>InstantFoods - Order Food Online</title>
<style>
	* { margin: 0; padding: 0; box-sizing: border-box; }

	body {
		font-family: 'Segoe UI', Arial, sans-serif;
		background-color: #f5f5f6;
		color: #282c3f;
	}

	/* ---------- Top Bar ---------- */
	.navbar {
		background-color: #ffffff;
		padding: 14px 40px;
		display: flex;
		align-items: center;
		justify-content: space-between;
		box-shadow: 0 1px 6px rgba(0,0,0,0.08);
		position: sticky;
		top: 0;
		z-index: 100;
	}

	.navbar .logo {
		font-size: 26px;
		font-weight: 800;
		color: #fc8019;
		letter-spacing: -0.5px;
	}

	.navbar .logo span { color: #282c3f; }

	.search-box {
		flex: 1;
		max-width: 480px;
		margin: 0 30px;
	}

	.search-box input {
		width: 100%;
		padding: 10px 16px;
		border-radius: 8px;
		border: 1px solid #d4d5d9;
		font-size: 14px;
		outline: none;
	}

	.search-box input:focus {
		border-color: #fc8019;
	}

	/* ---------- Hero ---------- */
	.hero {
		background: linear-gradient(135deg, #fc8019 0%, #ff5e3a 100%);
		color: #fff;
		padding: 40px 40px 30px 40px;
		text-align: center;
	}

	.hero h1 {
		font-size: 30px;
		margin-bottom: 8px;
	}

	.hero p {
		font-size: 15px;
		opacity: 0.9;
	}

	/* ---------- Debug banner (only shows when something went wrong) ---------- */
	.debug-banner {
		max-width: 1200px;
		margin: 20px auto 0 auto;
		padding: 14px 18px;
		background-color: #fff3cd;
		border: 1px solid #ffe08a;
		border-radius: 8px;
		color: #7a5c00;
		font-size: 13px;
		line-height: 1.5;
	}

	.debug-banner strong { display: block; margin-bottom: 4px; font-size: 14px; }

	/* ---------- Section Heading ---------- */
	.section-heading {
		max-width: 1200px;
		margin: 30px auto 10px auto;
		padding: 0 20px;
		display: flex;
		justify-content: space-between;
		align-items: baseline;
	}

	.section-heading h2 {
		font-size: 20px;
		font-weight: 700;
	}

	.section-heading span {
		font-size: 13px;
		color: #93959f;
	}

	/* ---------- Restaurant Grid ---------- */
	.restaurant-grid {
		max-width: 1200px;
		margin: 0 auto;
		padding: 10px 20px 60px 20px;
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
		gap: 24px;
	}

	.restaurant-card {
		background-color: #ffffff;
		border-radius: 14px;
		overflow: hidden;
		cursor: pointer;
		box-shadow: 0 2px 10px rgba(40,44,63,0.08);
		transition: transform 0.15s ease, box-shadow 0.15s ease;
		text-decoration: none;
		color: inherit;
		display: block;
	}

	.restaurant-card:hover {
		transform: translateY(-4px);
		box-shadow: 0 8px 20px rgba(40,44,63,0.15);
	}

	.restaurant-img-wrap {
		position: relative;
		width: 100%;
		height: 160px;
		background-color: #eee;
	}

	.restaurant-img-wrap img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		display: block;
	}

	.closed-overlay {
		position: absolute;
		top: 0; left: 0; right: 0; bottom: 0;
		background: rgba(40,44,63,0.65);
		color: #fff;
		font-weight: 700;
		font-size: 14px;
		display: flex;
		align-items: center;
		justify-content: center;
		letter-spacing: 0.5px;
	}

	.delivery-time-badge {
		position: absolute;
		bottom: 8px;
		left: 8px;
		background-color: rgba(0,0,0,0.6);
		color: #fff;
		font-size: 12px;
		font-weight: 600;
		padding: 3px 9px;
		border-radius: 6px;
	}

	.restaurant-info {
		padding: 12px 14px 16px 14px;
	}

	.restaurant-info .top-row {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
	}

	.restaurant-info h3 {
		font-size: 16px;
		font-weight: 700;
		line-height: 1.3;
		max-width: 75%;
	}

	.rating-badge {
		display: flex;
		align-items: center;
		gap: 3px;
		font-size: 13px;
		font-weight: 700;
		padding: 3px 7px;
		border-radius: 5px;
		color: #fff;
		white-space: nowrap;
	}

	.rating-high { background-color: #267f4e; }
	.rating-mid { background-color: #ef9c00; }
	.rating-low { background-color: #db7c38; }

	.cuisine-type {
		font-size: 13px;
		color: #6c6f7c;
		margin-top: 4px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.address {
		font-size: 12px;
		color: #93959f;
		margin-top: 6px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.no-results {
		text-align: center;
		padding: 60px 20px;
		color: #93959f;
		font-size: 15px;
		display: none;
	}
</style>
</head>
<body>

<%
	// Pull the attributes the servlet set - no JSTL, just plain Java
	List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
	String debugMessage = (String) request.getAttribute("debugMessage");
%>

	<!-- ---------- Navbar ---------- -->
	<div class="navbar">
		<div class="logo">Instant<span>Foods</span></div>
		<div class="search-box">
			<input type="text" id="searchInput" placeholder="Search for restaurant or cuisine..." onkeyup="filterRestaurants()">
		</div>
	</div>

	<!-- ---------- Hero ---------- -->
	<div class="hero">
		<h1>Order food to eat what makes you happy</h1>
		<p>Discover the best restaurants near you</p>
	</div>

	<!-- ---------- Debug banner: only visible when the DAO returned nothing/errored ---------- -->
	<% if (debugMessage != null && !debugMessage.isEmpty()) { %>
		<div class="debug-banner">
			<strong>Heads up - no restaurants loaded</strong>
			<%= debugMessage %>
		</div>
	<% } %>

	<!-- ---------- Section Heading ---------- -->
	<div class="section-heading">
		<h2>Restaurants to explore</h2>
		<span>
			<%= (restaurantList != null ? restaurantList.size() : 0) %> restaurants found
		</span>
	</div>

	<!-- ---------- Restaurant Grid ---------- -->
	<div class="restaurant-grid" id="restaurantGrid">

		<% if (restaurantList == null || restaurantList.isEmpty()) { %>
			<p style="grid-column: 1 / -1; text-align:center; color:#93959f; padding: 40px 0;">
				No restaurants available right now. Please check back later.
			</p>
		<% } else {
			for (Restaurant restaurant : restaurantList) {

				String name = restaurant.getName() == null ? "" : restaurant.getName();
				String cuisineType = restaurant.getCuisineType() == null ? "" : restaurant.getCuisineType();
				String address = restaurant.getAddress() == null ? "" : restaurant.getAddress();
				String imagePath = restaurant.getImagePath() == null ? "" : restaurant.getImagePath();
				double rating = restaurant.getRating();
				int deliveryTime = restaurant.getDeliveryTime();
				boolean isActive = restaurant.isIsActive();
				int restaurantID = restaurant.getRestaurantID();

				String ratingClass;
				if (rating >= 4.3) {
					ratingClass = "rating-high";
				} else if (rating >= 3.5) {
					ratingClass = "rating-mid";
				} else {
					ratingClass = "rating-low";
				}
		%>
			<a class="restaurant-card"
			   data-name="<%= name.toLowerCase() %>"
			   data-cuisine="<%= cuisineType.toLowerCase() %>"
			   href="MenuServlet?restaurantId=<%= restaurantID %>">

				<div class="restaurant-img-wrap">
					<img src="<%= request.getContextPath() %>/<%= imagePath %>"
						 alt="<%= name %>"
						 onerror="this.onerror=null;this.src='<%= request.getContextPath() %>/images/restaurants/default.jpg';">

					<% if (!isActive) { %>
						<div class="closed-overlay">CURRENTLY CLOSED</div>
					<% } %>

					<div class="delivery-time-badge"><%= deliveryTime %> mins</div>
				</div>

				<div class="restaurant-info">
					<div class="top-row">
						<h3><%= name %></h3>
						<span class="rating-badge <%= ratingClass %>">&#9733; <%= String.format("%.1f", rating) %></span>
					</div>

					<div class="cuisine-type"><%= cuisineType %></div>
					<div class="address"><%= address %></div>
				</div>
			</a>
		<%
			}
		} %>
	</div>

	<p class="no-results" id="noResults">No restaurants match your search.</p>

	<script>
		function filterRestaurants() {
			var input = document.getElementById('searchInput').value.toLowerCase();
			var cards = document.getElementById('restaurantGrid').getElementsByClassName('restaurant-card');
			var visibleCount = 0;

			for (var i = 0; i < cards.length; i++) {
				var name = cards[i].getAttribute('data-name') || '';
				var cuisine = cards[i].getAttribute('data-cuisine') || '';

				if (name.indexOf(input) > -1 || cuisine.indexOf(input) > -1) {
					cards[i].style.display = 'block';
					visibleCount++;
				} else {
					cards[i].style.display = 'none';
				}
			}

			document.getElementById('noResults').style.display = (visibleCount === 0) ? 'block' : 'none';
		}
	</script>

</body>
</html>
