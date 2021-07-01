<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="header.jsp" %>

	<!-- Home -->
           <div class="wrapper bg-white">
 
       


    <div class="h2 text-center" style="font-size: 30px">Doctor Forget Password</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" action="doctorforgetpassword1.jsp" method="post">
        <div class="form-group py-2">
            <div class="input-field">  <input type="text" name="doctorid" id="doctorid"  placeholder="Doctor Email ID"  class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">
            <div class="input-field"> <input type="text" name="fname" id="fname" placeholder="First Name"  class=""> 
                
                </div>
        </div>
            <div class="form-group py-1 pb-2">
            <div class="input-field"> <input type="text" name="lname" id="lname" placeholder="Last Name"  class=""> 
                
                </div>
        </div>
        <div class="d-flex align-items-start">
            
            
        <button type="submit" class="btn btn-block text-center my-3" id="forgetdocpwdbtn">Send Activation Code</button>
       </div>
    </form>
        <form action="../doctorreg.jsp">
        <div class="text-center pt-3 text-muted">Not a member? <div class="dropdown">
  <button class="dropbtn">signup</button>
  
   
  </div>
            
</div>
  </form>    
    </div>
        <%@ include file ="footer.jsp" %>