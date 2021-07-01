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
        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/telehealth.js"></script> 
        
        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/telehealth.js"></script> 

        
        <style>

.wrapper {
    max-width: 500px;
    border-radius: 10px;
    margin: 50px auto;
    padding: 30px 40px;
    box-shadow: 20px 20px 80px rgb(206, 206, 206)
}

.h2 {

    font-size: 3.5rem;
    font-weight: bold;
    color: #400485;
   
}

.h4 {
    font-family: 'Poppins', sans-serif
}

.input-field {
    border-radius: 5px;
    padding: 5px;
    display: flex;
    align-items: center;
    cursor: pointer;
    border: 1px solid #400485;
    color: #400485
}

.input-field:hover {
    color: #7b4ca0;
    border: 1px solid #7b4ca0
}

input {
    border: none;
    outline: none;
    box-shadow: none;
    width: 100%;
    padding: 0px 2px;
    font-family: 'Poppins', sans-serif
}

.fa-eye-slash.btn {
    border: none;
    outline: none;
    box-shadow: none
}

a {
    text-decoration: none;
    color: #400485;
    font-weight: 700
}

a:hover {
    text-decoration: none;
    color: #7b4ca0
}


.btn.btn-block {
    border-radius: 20px;
    background-color: #400485;
    color: #fff
}


    forgot {
        font-size: 0.95rem
    }

.dropbtn {
  background-color: #808080;
  color: black;
  width: auto; 
 padding: 10px 18px;
  margin: 10px 5px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}


.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
  </style>
            
     
    </head>
<body>
    
    <div class="super_container">
	
	<!-- Header -->

	<header class="header trans_200">
		
		<!-- Top Bar -->
		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="top_bar_content d-flex flex-row align-items-center justify-content-start">
							<div class="top_bar_item"><a href="login.html">Patient Login</a></div>
                                                        <div class="top_bar_item"><a href="../doctor/doctorlogin.html">Doctor Login</a></div>
							<div class="top_bar_item"><a href="../doctoreditinfo.html">Doctor Info</a></div>
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
									<li><a href="../index.html">Home</a></li>
									<li><a href="../about.html">About us</a></li>
									<li><a href=../"services.html">Services</a></li>
									<li><a href="../news.html">News</a></li>
									<li><a href="../contact.html">Contact</a></li>
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


	<!-- Menu -->

	<div class="menu_container menu_mm">

		<!-- Menu Close Button -->
		<div class="menu_close_container">
			<div class="menu_close"></div>
		</div>

		<!-- Menu Items -->
		<div class="menu_inner menu_mm">
			<div class="menu menu_mm">
				<ul class="menu_list menu_mm">
					<li class="menu_item menu_mm"><a href="../index.html">Home</a></li>
					<li class="menu_item menu_mm"><a href="../about.html">About us</a></li>
					<li class="menu_item menu_mm"><a href="../services.html">Services</a></li>
					<li class="menu_item menu_mm"><a href="../news.html">News</a></li>
					<li class="menu_item menu_mm"><a href="../contact.html">Contact</a></li>
				</ul>
			</div>
			<div class="menu_extra">
				<div class="menu_appointment"><a href="#">Request an Appointment</a></div>
				<div class="menu_emergencies">For Emergencies: +563 47558 623</div>
			</div>

		</div>

	</div>
	
	<!-- Home -->

	
	<div class="home" style="height:120px">
		
	</div>
