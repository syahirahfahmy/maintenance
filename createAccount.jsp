<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%

  String message = null;
  String fullname = request.getParameter("fname");
  String password = request.getParameter("Password");
  String email = request.getParameter("email");
  String username = request.getParameter("Username");
  String phone_number = request.getParameter("Phone_Number");

  PreparedStatement stmt = null;
  Connection conn = null;   
  try {
              //Connect to the database
              Class.forName("oracle.jdbc.driver.OracleDriver");
              //String hostname = "172.16.60.13";
	      String hostname = "localhost";
              int port = 1521;
              String sid = "xe";
              String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
              String user = "system";
              String pass = "system";
              conn = DriverManager.getConnection(oracleURL, user, pass);
	     
              // Make the query
              stmt=conn.prepareStatement("insert into CUSTOMER (Username, Password, NAME, EMAILADDR, PHONENUM) values(?,?,?,?,?)");
              stmt.clearParameters();
              stmt.setString(3,fullname);
              stmt.setString(2,password);
              stmt.setString(4,email);
              stmt.setString(1,username);
              stmt.setString(5,phone_number);
			  stmt.executeUpdate();
			  
			  conn.setAutoCommit(false);
			  stmt.close();
              conn.close();
			
			  
   
              //Close the database connection
            
    } catch (SQLException ex) {		
   out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");


   stmt.close();
   conn.close();
 } 
 
%> 

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/style.css">

    <title>LAAS Shop</title>
</head>

<body style="background-image:url('bg.png')">

   <header style="padding-top:20px">
        <!--start of top-header-->
        <div class="top-header" style="background-color:white;">
            <div class="left">
               <span>Follow use on: <i class="fab fa-facebook-square"></i> <i class="fab fa-instagram"></i></span>
            </div>
            <div class="right ml-auto">
                <ul>
                    <li><a href=""><i class="fas fa-bell"></i>&nbsp;Notification</a></li>
                    <li><a href="createAccount.html">Sign Up</a></li>
                    <li><a href="login_use.html">Login</a></li>
                </ul>
            </div>
        </div>
        <!--end of top-header-->

        <!--start of bottom-header-->
        <div class="bottom-header">

            <!--start of site-ifo-->
            <div class="site-info">
                <div class="logo" style="font-size: 50px;">
					<a href="page2.html" style="text-decoration: none;">
                     <i class="fas fa-shopping-cart" style="color:black;"></i>
                </div>
                <div class="title">
                    <h1 style="color:black;" >LASS Shop</h1></a>
                </div>
            </div>
            <!--end of site-ifo-->

            <div class="search">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="search">
			&nbsp;
            <button><i class="fas fa-search"></i></button>
            </div>

            <div class="cart">
				<a href="CartItem.html" style="color:black;">
                 <i class="fas fa-shopping-cart"></i></a>
            </div>

        </div>
        <!--end of bottom-header-->

    </header>
	
    <div style="background-color:white">
		<br><br>
		<center><h1 style="font-family:rockwell;"> You has been succesfully register</h1></center>
		<br><center><p style="font-family:rockwell;font-size:24"> Click
		<a href="login_use.html">
		<button style="height:25; width:50"> Next </button></a>
		 to continue with login</p></center>
	 <br><br><br>
	 
	</div>
 
 </body></html>





