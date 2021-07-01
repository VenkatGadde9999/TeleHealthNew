
<!-- Header -->
<%@ include file ="header.jsp" %>
	<!-- Home -->


        <style>
            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }


        </style>
        
<div class="content-box-ext" style="max-width: 1100px;
    border-radius: 10px;
    margin: 50px auto;
    //padding: 30px 40px;
    box-shadow: 20px 20px 80px rgb(206, 206, 206)">
    <center>
        <div class="page-heading">Patient Registration</div>
        <div class="container-login">
            <form action="patientreg1.jsp" method="post">
                
        
            
            <table class="page-header" width="500">
                <tr><td><input type="text" name="fname" id="fname" placeholder="First Name">
                <tr><td><input type="text" name="lname" id="lname" placeholder="Last Name">
                <tr><td><input type="text" name="patientid" id="patientid" placeholder="Email Id">
                <tr><td><input type="text" name="password" id="password" placeholder="Password">
               <tr><td><input type="text" name="password2" id="password2" placeholder="Confirm password">
                <tr><td><button class="btn" style="width:100%" value="submit" name="ptrregbtn" id="ptrregbtn">submit</button>
            </table>
        
               </form>
        </div>
    </center>

</div>
<!-- Footer -->
	<%@ include file ="footer_1.jsp" %>