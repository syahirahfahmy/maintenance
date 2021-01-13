<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> 
</head>
 <body>
 <%
 String message= null;
 String usernamesys = request.getParameter("username");
 String userpassword = request.getParameter("password");
 
 Connection conn = null;
 Statement stmt = null;
 ResultSet resultSet = null;
 
 String usernamedb = null;
 String pwdb = null;

try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String hostname = "localhost";
		int port = 1521;
		String sid = "xe";
		String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
		String user = "system";
		String pass = "system";
		
		conn = DriverManager.getConnection(oracleURL, user, pass);
		stmt=conn.createStatement();
		String sql ="select * from customer";
		resultSet = stmt.executeQuery(sql);
		
		session.setAttribute("username", usernamesys);

		while(resultSet.next()){
			
			usernamedb=resultSet.getString("username");
			
			if(usernamesys.equals(usernamedb)){
				
				pwdb=resultSet.getString("password");
				
				if(userpassword.equals(pwdb)){
					request.getRequestDispatcher("CartItem.html").forward(request, response);
					break;
				}
				else{
				message="INCORRECT PASSWORD";
				break;
				}
			}				
			
		}
		
		if (!usernamesys.equals(usernamedb)){
			message="USER DOES NOT EXIST!";
		}
%>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/style.css">

    <title>LAAS Shop</title>

	<style>
		table.center {
		  margin-left:auto; 
		  margin-right:auto;
		}
		
		tr, td {
		  padding: 7px;
		}	   
	</style>   
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
                    <h1 style="color:black;">LASS Shop</h1></a>
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
                 <i class="fas fa-shopping-cart"></i>
            </div>

        </div>
        <!--end of bottom-header-->

    </header>
	
	<div style="background-color:white">
	<center><br><br>
	<h1 style="font-family:rockwell;"><%out.println(message);%></h1>
	<p style="font-family:rockwell;font-size:24"> Click
	<a href="login_use.html">
	<button style="height:25; width:200;">Back to login page </button></a>
	 to continue</p>
	<br><br>
 </center></div></body>
 <%
		
	}
	catch (Exception ex) {		
	   out.println("<p><b> Could not connect db" + ex.getMessage()+ "</p>");
	}
%>


 </html>

