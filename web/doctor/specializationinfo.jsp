<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="managedetailsheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
<!-- Home -->
<%
 Connection con1=null;
String did=session.getAttribute("userid").toString();
try
{
con1= databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
PreparedStatement pstmt = con1.prepareStatement("select * from docspecialization where doctorid=?");
pstmt.setString(1, did);


ResultSet rs1=pstmt.executeQuery();
if(rs1.next())
{

%>
	

<div class="wrapper bg-white" style="max-width: 690px;">
 

    <div class="h2 text-center" style="font-size:30px">Specialization Details</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" action="specializationinfoedit.jsp" method="post">
        <div class="form-group py-2">Doctor Id/Email Id
            <div class="input-field">  <input type="text" name="doctorid" id="doctorid" value="<%= session.getAttribute("userid") %>"  placeholder="Doctor Email ID" readonly> </div>
        </div>
        <div class="form-group py-1 pb-2">Specialization
            <div class="input-field"> <input type="text" name="specialization" id="specialization" value="<%=rs1.getString("specialization")%>" placeholder="Specialization" required class=""> 
                </div>
        </div>
        <div class="form-group py-2">Qualification
            <div class="input-field">  <input type="text" name="qualification" id="qualification"  value="<%=rs1.getString("qualification")%>"  placeholder="Qualification" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">Institute Name
            <div class="input-field"> <input type="text" name="institute" id="institute" value="<%=rs1.getString("institute_name")%>" placeholder="Institute Name" required class=""> 
                </div>
        </div>
          <div class="form-group py-1 pb-2">Procurement Year
            <div class="input-field"> <input type="text" name="year" id="year" value="<%=rs1.getString("procurement_year")%>" placeholder="procurement_year" irm Passwordrequired class=""> 
                </div>
        </div>
            
          <div class="form-group py-1 pb-2">Experience
            <div class="input-field"> <input type="text" name="experience" id="experience" value="<%=rs1.getString("experience")%>" placeholder="Experience" irm Passwordrequired class=""> 
                </div>
        </div>
        <div class="d-flex align-items-start">
            
            
        </div> <button type="submit" class="btn btn-block text-center my-3">Update</button>

    </form>
   
    </div>
            <%
                  }
            else
            {
    %>
    
    <div class="wrapper bg-white">
 

    <div class="h2 text-center" style="font-size:30px">Specialization Details</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" action="specializationinfo1.jsp" method="post">
        <div class="form-group py-2">Doctor Id/Email Id
            <div class="input-field">  <input type="text" name="doctorid" id="doctorid" value="<%= session.getAttribute("userid") %>"  placeholder="Doctor Email ID" readonly> </div>
        </div>
        <div class="form-group py-1 pb-2">Specialization
            <div class="input-field"> <input type="text" name="specialization" id="specialization"  placeholder="Specialization" required class=""> 
                </div>
        </div>
        <div class="form-group py-2">Qualification
            <div class="input-field">  <input type="text" name="qualification" id="qualification"    placeholder="Qualification" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">Institute Name
            <div class="input-field"> <input type="text" name="institute" id="institute"  placeholder="Institute Name" required class=""> 
                </div>
        </div>
          <div class="form-group py-1 pb-2">Procurement Year
            <div class="input-field"> <input type="text" name="year" id="year"  placeholder="procurement_year" irm Passwordrequired class=""> 
                </div>
        </div>
            
          <div class="form-group py-1 pb-2">Experience
            <div class="input-field"> <input type="text" name="experience" id="experience"  placeholder="Experience" irm Passwordrequired class=""> 
                </div>
        </div>
        <div class="d-flex align-items-start">
            
            
        </div> <button type="submit" class="btn btn-block text-center my-3">Update</button>

    </form>
   
    </div>
    

    
    
                        <%
 }
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
        out.println("<html><script>alert(\"Error in Doctor Specilization page: "+ex+"\");"
               + "window.location='profile.jsp';</script></html> ");
    }
    }
    
    %>
<%@ include file ="footer.jsp" %>