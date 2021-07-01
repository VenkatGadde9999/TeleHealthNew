<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="header.jsp" %>

	<!-- Home -->
        
        <div class="wrapper bg-white">
 
       


    <div class="h2 text-center">Patient login</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" action="patientlogin1.jsp" method="post">
        <div class="form-group py-2">
            <div class="input-field">  <input type="text" name="patientid" id="patientid"  placeholder="Patient Email ID" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">
            <div class="input-field"> <input type="text" name="pwd" id="pwd" placeholder="Password" required class=""> 
                </div>
        </div>
        <div class="d-flex align-items-start">
            
            <div class="ml-auto"> <a href="#" id="forgot">Forgot Password?</a> </div>
        </div> <button type="submit" class="btn btn-block text-center my-3">Log in</button>

    </form>
        <form action="../patientreg.jsp">
        <div class="text-center pt-3 text-muted">Not a member? <div class="dropdown">
  <button class="dropbtn">signup</button>
  
   
  </div>
            
</div>
  </form>    
    </div>
        <%@ include file ="footer.jsp" %>