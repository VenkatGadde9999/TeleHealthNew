
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*"  import="databaseconnection.*"%>

<%

String userid=session.getAttribute("userid").toString();;
String appointmentid= request.getParameter("appointmentid");

PreparedStatement pstmt=null;
Connection con1=null;
try
{
con1 = databasecon.getconnection();
pstmt=con1.prepareStatement("delete from appointmentslot where patientid=? and appointmentid=?");
pstmt.setString(1,userid);
pstmt.setString(2,appointmentid);

int n=pstmt.executeUpdate();
if(n>0)
{
    
out.println("<html><script>alert('Applointment Request Deleted successfully');"
        + "window.location='bookappointment.jsp';</script></html> ");
//response.sendRedirect("adminhome.jsp?message=success");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Appointment Request Deletion process failed');"
            + "window.location='bookappointment.jsp';</script></html> ");
}

}
catch(Exception  e1)
{

out.println("<html><script>alert(\"Appointment Deletion Failed "+e1+"\");"
               + "window.location='bookappointment.html';</script></html> ");
}
finally{
    try
    {
        con1.close();
    }catch(Exception ex)
    {
    }
    }
%>

