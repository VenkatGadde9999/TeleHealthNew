<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="managedetailsheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
<!-- Home -->
<%
 Connection con1=null;
String pid=session.getAttribute("userid").toString();
try
{
con1= databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
PreparedStatement pstmt = con1.prepareStatement("select * from doctorlogin where doctorid=?");
pstmt.setString(1, pid);


ResultSet rs1=pstmt.executeQuery();
rs1.next();


%>
	

<div class="wrapper bg-white">
 

    <div class="h2 text-center" style="font-size:30px">Profile</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" action="profile1.jsp" method="post">
        <div class="form-group py-2">Patient Id/Email Id
            <div class="input-field">  <input type="text" name="doctorid" id="doctorid" value="<%= session.getAttribute("userid") %>"  placeholder="Patient Email ID" readonly> </div>
        </div>
        <div class="form-group py-1 pb-2">FirstName
            <div class="input-field"> <input type="text" name="fname" id="fname" value="<%=rs1.getString("firstname")%>" placeholder="First Name" required class=""> 
                </div>
        </div>
        <div class="form-group py-2">LastName
            <div class="input-field">  <input type="text" name="lname" id="lname"  value="<%=rs1.getString("lastname")%>"  placeholder="Last Name" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">Password
            <div class="input-field"> <input type="text" name="password" id="password"  placeholder="Password" required class=""> 
                </div>
        </div>
          <div class="form-group py-1 pb-2">Confirm Password
            <div class="input-field"> <input type="text" name="cpassword" id="cpassword" placeholder="Confirm Password" required class=""> 
                </div>
        </div>
        
        <div class="d-flex align-items-start">
            
            
        </div> <button type="submit" class="btn btn-block text-center my-3">Update</button>

    </form>
   
    </div>
                        <%
 }
catch(Exception  e1)
{
out.println(e1);
}
finally{
    try
    {
        con1.close();
    }catch(Exception ex)
    {
           // out.println("<html><script>alert( error in admin profile page:\'"+ex+"\');</script></html> ");
        out.println("<html><script>alert(\"Error in Patient Profile page: "+ex+"\");"
               + "window.location='profile.jsp';</script></html> ");
    }
    }
    
    %>
<%@ include file ="footer.jsp" %>