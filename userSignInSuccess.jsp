
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.*" %>
<%@page import="java.util.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Think Auction</title>
	<link rel="shortcut icon" type="image/x-icon" href="WebDesign/images2/logo2.ico" />
        
        <!--main style -->
	<link href="style/style.css" rel="stylesheet" type="text/css" />
 	<link rel="stylesheet" href="style/styles.css">
        
        <!--script topMenu -->
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script src="WebDesign/script_TopMenu.js"></script>
        
        <!--sidemenu style -->
        <link rel="stylesheet" href="WebDesign/Sidemenu/styles.css"></link>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script src="WebDesign/Sidemenu/script.js"></script>
        
         <%-- login template CSS --%>
        <link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
        <link rel="stylesheet" href="style/LoginTemplate/style.css">
       
            
            
</head>


<body>


<center>
  <div class="wrapper">
  <div class="header" >
       <%
           String userName = "";
           HttpSession curr = request.getSession(false);
           if (curr != null){
               userName = (String) session.getAttribute("user");
           }
           else {
               request.getRequestDispatcher("/userSignIn.jsp").include(request, response);
           }
           
           
           /*
           String userName = null;
                    Cookie[] cookies = request.getCookies();

                    if(cookies !=null){
                        for(Cookie cookie : cookies){
                            if(cookie.getName().equals("user")) userName = cookie.getValue();
                        }
                    }

                    if(userName == null) response.sendRedirect("userSignIn.jsp");
                   */
                %>
      
      
                <a class="SignIn" >Hi, <%=userName %></a>
   <a class="MyAcc" href="#"> My Account</a> <a href="#"> log out</a>
    <div class="search">
    <div class="search-text">
    <input type="text" size="70" class="search-text2" value="Search your terms here..." onFocus="this.value = '';" onBlur="if (this.value == '')
    {this.value = 'Search your terms here...';}" />&nbsp;</div>
    <div style="float:left; margin-left:5px; margin-top:-5px;">
    <input type="image" src="WebDesign/images2/search.png"  />
    
    </div>
  </div>
  
  
  <div class="logo"><a class="textWhite">think</a><a class="textGrey"><strong>Auction</strong></a></div> 
   <div id='cssmenu3'>
	 <ul>
   	<li class='active'><a href='index.html'> Home</a></li>
    <li><a href='about.jsp'>About</a>
   	<li><a href='#' class="hotdeals">Hot-Deals</a>
    <li><a href='#'>FAQ's</a>
   	<li><a href='#'>Contacts</a></li>
   	<li><a href='#'>Policies</a></li>
        <li><a href='userSellerPage.jsp'>Sell</a>
 	</ul>
	</div>
  </div>
  
<!--End of header -->  
   <div class="navigation"> 
   
     
  
   </div>
   <!--End of navigation -->  
 <div class="body-wrapper">
   



    <div class="body-right">
    	
        
    </div>
    
    <div class="dividerRight"> &nbsp;</div>
    
    <div class="body-middle">
      
      <div class="body-middle-box1">
        
          <form action="LogoutServlet" method="POST">
              <input type="submit" value="logout"></input>
          </form>
   </div>
       </div>
    
    <div class="dividerLeft"> &nbsp;</div>
    
    <div class="body-left">
   
     
   
 <br />
    <br />

    
   
    </div>
   
    
  </div>
  
  
  
  <div class="separator-main"> &nbsp;</div>
  
  <div class="footer">
    <div class="footer-text" style="padding-top:10px;margin-left:20px;"> <a href="#" class="nav1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home</a>&nbsp;&nbsp;<span style="color:#535353">|</span>&nbsp;&nbsp;<a href="#" class="nav1">Categories</a>&nbsp;&nbsp;<span style="color:#535353">|</span>&nbsp;&nbsp;<a href="#" class="nav1">User Guide</a>&nbsp;&nbsp;<span style="color:#535353">|</span>&nbsp;&nbsp;<a href="#" class="nav1">Reviews</a>&nbsp;&nbsp;<span style="color:#535353">|</span>&nbsp;&nbsp;<a href="#" class="nav1">Hot Deals</a>&nbsp;&nbsp;<span style="color:#535353">|</span>&nbsp;&nbsp;<a href="#" class="nav1">FAQ&#8217;s</a>&nbsp;&nbsp;<span style="color:#535353">|</span>&nbsp;&nbsp;<a href="#" class="nav1">Contact</a>&nbsp;&nbsp;<span style="color:#535353">|</span>&nbsp;&nbsp;<a href="#" class="nav1">Privacy Policy</a></div>
    <div class="footer-text" style="padding-top:20px;margin-left:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Copyright &copy; 2015 <a href="#">thinkAuction Pte Ltd</a> All Rights Reserved.
   
    </div>
  </div>
</center>
</body>
</html>
