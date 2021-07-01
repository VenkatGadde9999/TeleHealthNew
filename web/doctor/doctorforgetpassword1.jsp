<%-- 
    Document   : doctor forgetpassword1
    Created on : 6 Jun, 2021, 11:57:11 PM
    
--%>

<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*" import="beansclasses.*"%>

<%

Connection con1=null;
try
{
String fname = request.getParameter("fname");
String lname= request.getParameter("lname");
String email= request.getParameter("doctorid");
//String uid=request.getParameter("uid");
//String pwd=request.getParameter("password");

session.setAttribute("userid",email);
con1= databasecon.getconnection();
//out.println("Connection value:"+con1);
//Connection con1 = databasecon.getconnection();
PreparedStatement pstmt = con1.prepareStatement("update doctorlogin set status=? where doctorid=? and firstname = ? and lastname = ?");
pstmt.setString(3, fname);
pstmt.setString(4, lname);
pstmt.setString(2, email);
int code=RandomNumber.generateRandomNumber();
pstmt.setInt(1,code );
session.setAttribute("code",code);

int x=pstmt.executeUpdate();
if(x>0)
{
    String name=fname+" "+lname;
    session.setAttribute("name",name);
    response.sendRedirect("GenerateEmailForForgetPassword.jsp");
    out.println("<html><script>alert('Activation code send to your email');"
            + "window.location=\'doctor/forgetpasswordactivate.jsp?userid="+email+"\';</script></html> ");
//response.sendRedirect("AdminHomePage.jsp?message=success");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Forget password Activation failed/Invalid emailid or first name or lastname');"
               + "window.location='doctorforgetpassword.jsp';</script></html> ");
}
}
catch(Exception e2)
{
    
out.println("<html><script>alert(\"Error in Page Forget password Activation: "+e2+"\");"
               + "window.location='doctorforgetpassword.jsp';</script></html> ");

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

