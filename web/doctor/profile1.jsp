<%-- 
    Document   : adminprofile1
    Created on : 22 Jan, 2018, 12:54:43 AM
    Author     : Chiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%


String userid=session.getAttribute("userid").toString();
String fname = request.getParameter("fname");
String lname= request.getParameter("lname");
String email= request.getParameter("doctorid");
String pwd=request.getParameter("password");

PreparedStatement pstmt=null;
Connection con1=null;
try
{
	//Class.forName("com.mysql.jdbc.Driver");	
con1 = databasecon.getconnection();
pstmt=con1.prepareStatement("update doctorlogin set `firstname`=?,`lastname`=?,`password`=? where `doctorid`=?");
pstmt.setString(1,fname);
pstmt.setString(2,lname);
pstmt.setString(3, pwd);
pstmt.setString(4,userid);
int n=pstmt.executeUpdate();
if(n>0)
{
    
out.println("<html><script>alert('Patient profile updated successfully');"
        + "window.location='profile.jsp';</script></html> ");
//response.sendRedirect("adminhome.jsp?message=success");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Profile updating process failed');"
            + "window.location='profile.jsp';</script></html> ");
}
}
catch(Exception  e1)
{
//out.println(e1);
    out.println("<html><script>alert( error in doctor profile page:\'"+e1+"\');</script></html> ");
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