<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="patientheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
<!-- Home -->
<link rel="stylesheet" type="text/css" href="../styles/bootstrap4/bootstrap.min.css">
<script type="text/javascript">
    function deletefun(cid) {
        alert(cid);
        window.location = 'deleteappointment.jsp?appointmentid='+cid;
    }

    function editfun(cid) {
        window.location = 'editappointment.jsp?appointmentid='+cid;
    }
   function sendfun() {
        window.location = 'addappointemnt.jsp';
    }
</script>
<%
 Connection con1=null;
String pid=session.getAttribute("userid").toString();
try
{
con1= databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
PreparedStatement pstmt = con1.prepareStatement("select * from appointmentslot where patientid=?");
pstmt.setString(1, pid);


ResultSet rs1=pstmt.executeQuery();



%>
	

<div class="wrapper bg-white" style="max-width:85%;">
 

    <div class="h2 text-center" style="font-size:30px;padding:35px;background-color: red;color:white;">Manage Appointment</div>
<div class="content-box-ext">

    <center>
        <div class="container-tbl">
            <form name="addcompany" action="newappointment.jsp" method="post">
                <div style="position:relative;right:-430px;padding:20px;"><button class="btn" style="background-color:orange;" type="submit">Request For Appointment</button></div>
            </form>
            <form name="info" method="post">
                <table class="table table-light table-striped table-bordered table-hover " width="1200" align=center>
                    <thead class="tblheader">
                        <tr>
                            <td>Sno<td>Appointment Id<td> Doctor Id<td>Date<td>Status<td>Edit</td><td>Delete</td>
                        </tr>
                    </thead>
                    <%
                     int n = 1;

                    while(rs1.next()) {
                                String appointmentid=rs1.getString("appointmentid");
                                %>
                                
                                
                    <tr>
                        <td>
                            <%= n++ %>
                        </td>
                        <td>
                            <%= rs1.getString("appointmentid") %>
                        </td>
                        <td>
                        
                   <a href="doctorsinfo_1.jsp?doctorid=<%=  rs1.getString("doctorid") %>" id="viewdoctor">

                    <%= rs1.getString("doctorid")%>
                    </a> 
                
                            
                            
                            
                            
                           
                        </td>
                        <td>
                        
                            <%= rs1.getString("slotdate") %>
                        </td>
                        <td>
                            <%= rs1.getString("status") %>
                        </td>
           
                        
                        
<td><button class="btn" style="background-color:blue;" type='button' name='edit' id='edit' onclick='editfun("<%= appointmentid %>")'> View / Edit </button></td>
<td><button class="btn" style="background-color:red;" type='button' name='delete' id='delete' onclick='deletefun("<%= appointmentid %>")'>  Delete </button></td>

                             
                                    
                        </td>
                    </tr>
                    <%
                                }
                            
                        
                      %>
                </table>
             
                
            </form>
        </div>
    </center>
</div>

   
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
        out.println("<html><script>alert(\"Error in Manage Appointment page: "+ex+"\");"
               + "window.location='bookappointment.jsp';</script></html> ");
    }
    }
    
    %>
<%@ include file ="footer.jsp" %>