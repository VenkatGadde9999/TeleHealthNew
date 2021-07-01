
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TeleHealth</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="CareMed demo project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../styles/bootstrap4/bootstrap.min.css">
        <link href="../plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="../styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/responsive.css">


        
        <link rel="stylesheet" type="text/css" href="../styles/mystyle.css">
        
        
<script>
    if(performance.navigation.type == 2)
    location.reload();
    </script>
</head>
<body>
     <%
    if( session.getAttribute("plogin")==null ||session.getAttribute("plogin")=="false")
    {
        //response.sendRedirect("../index.html");
        response.sendRedirect("login.html");
    }
    %>
    
    <div class="super_container">
	
	<!-- Header -->

	<header class="header trans_200">
		
		<!-- Top Bar -->
		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="top_bar_content d-flex flex-row align-items-center justify-content-start">
                                                    <div class="top_bar_item"><a href="#">Welcome <%=session.getAttribute("uname")%></a></div>
                                                         <div class="top_bar_item"><a href="#"><%=session.getAttribute("userid")%></a></div>
							<div class="top_bar_item"><a href="logout.jsp">logout</a></div>
                                                        <div class="emergencies  d-flex flex-row align-items-center justify-content-start ml-auto">For Emergencies: +563 47558 623</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- Header Content -->
		<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_content d-flex flex-row align-items-center justify-content-start">
							<nav class="main_nav ml-auto">
								<ul>
									<li><a href="patienthome.jsp">Home</a></li>
									<li><a href="personalinfo.jsp">Person Info</a></li>
									<li><a href="profile.jsp">Profile</a></li>
									<!--li><a href="../doctoreditinfo.html">Doctor Info</a></li-->
								</ul>
							</nav>
							<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Logo -->
		<div class="logo_container_outer">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="logo_container">
							<a href="#">
								<div class="logo_content d-flex flex-column align-items-start justify-content-center">
									<div class="logo_line"></div>
									<div class="logo d-flex flex-row align-items-center justify-content-center">
										<div class="logo_text">Tele<span>Health</span></div>
										<div class="logo_box">+</div>
									</div>
									<div class="logo_sub">Health Care Center</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>	
		</div>

	</header>


	
	
	<!-- Home -->
       
	
	<div class="home" style="height:120px">
		
	</div>
