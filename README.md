InstantFoods is an online food delivery web application built with Java Servlets, JSP and MySQL. 
It lets users register and log in, browse restaurants and their menus, add items to a shopping cart, and place orders. 
The project was built to practice full-stack Java web development using the MVC pattern and the DAO design pattern.

Features

Users can create an account and log in, and their session is maintained while they use the app. They can browse the available restaurants,
which show details such as cuisine type, rating and delivery time, and then open a restaurant to view its menu. Selected items go into a
session-based shopping cart, where quantities can be updated and items can be removed. At checkout, the user reviews the order, enters the 
delivery details and chooses a payment method. When the order is placed, the order and its items are saved in the database and a 
confirmation page is shown. Checkout and order placement are protected, so only logged-in users can use them.

Tech Stack

The frontend is built with JSP, HTML5 and CSS3. The backend is written in Java 21 using Jakarta Servlets (Servlet API 5.0). Data is stored 
in a MySQL database and accessed through JDBC with MySQL Connector/J 9.2.0. The application runs on Apache Tomcat 10.1, and the project was
developed in the Eclipse IDE with Git and GitHub for version control.

Project Structure

The code is organized into packages under com.design. The model package holds the plain Java classes User, Restaurant, Menu, Cart, Order
Table and OrderItem. The dao package contains the DAO interfaces, and the DAOimpl package contains their JDBC implementations. The 
controller package contains the servlets for login, registration, restaurants, menu, cart, checkout and order placement. The JSP pages for 
the user interface (index, login, register, restaurant, menu, cart, checkout and orderSuccess) are in the src/main/webapp folder.

Database

The application uses a MySQL database with five tables: user, Restaurant, Menu, OrderTable and OrderItem. The user table stores account 
details, Restaurant and Menu store the restaurants and their food items, and OrderTable and OrderItem store the placed orders and the 
items inside each order.

Getting Started

To run the project, you need JDK 21, Apache Tomcat 10.1, MySQL Server and Eclipse IDE for Enterprise Java and Web Developers. First, clone 
the repository using the command git clone https://github.com/PragathiNGaniga/InstantFoods.git and import it into Eclipse using File, Import
, Existing Projects into Workspace. Next, create the MySQL database and the five tables mentioned above.

For security, the database connection class is not included in this repository. You need to create a class named DBConnection inside 
the com.design.utility package. It should have a static method called getConnection that loads the MySQL driver com.mysql.cj.jdbc.Driver 
and returns a connection using your own database URL, username and password.

Finally, right-click the project in Eclipse, choose Run As, then Run on Server, select Tomcat 10.1, and open 
http://localhost:8080/InstantFoods/ in your browser.

## Author

Pragathi N Ganiga. GitHub: https://github.com/PragathiNGaniga
