<%-- 
    Document   : doctorreg1
    Created on : 6 Jun, 2021, 11:57:11 PM
    
--%>

<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"  import="beansclasses.*"%>

<%

Connection con1=null;
try
{
String fname = request.getParameter("fname");
String lname= request.getParameter("lname");
String email= request.getParameter("doctorid");
//String uid=request.getParameter("uid");
String pwd=request.getParameter("password");

session.setAttribute("userid",email);
con1= databasecon.getconnection();
//out.println("Connection value:"+con1);
//Connection con1 = databasecon.getconnection();
PreparedStatement pstmt = con1.prepareStatement("insert into doctorlogin values(?,?,?,?,?)");
pstmt.setString(1, fname);
pstmt.setString(2, lname);
pstmt.setString(3, email);
pstmt.setString(4, pwd);
int code=RandomNumber.generateRandomNumber();
pstmt.setInt(5,code );
session.setAttribute("code",code);

int x=pstmt.executeUpdate();
if(x>0)
{
    response.sendRedirect("GenerateEmailToDoctor.jsp");
    out.println("<html><script>alert('Successfully registered\nActivation code send to your email');"
            + "window.location=\'doctor/activate.jsp?userid="+email+"\';</script></html> ");
//response.sendRedirect("AdminHomePage.jsp?message=success");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Insertion failed');"
               + "window.location='doctorreg.jsp';</script></html> ");
}
}
catch(MySQLIntegrityConstraintViolationException e2)
{
    
out.println("<html><script>alert(\"Doctor Id Already existing "+e2+"\");"
               + "window.location='doctorreg.jsp';</script></html> ");

}
catch(Exception  e1)
{
//out.println(e1);

out.println("<html><script>alert(\"Error "+e1+"\");"
        + "window.location='doctorreg.jsp';</script></html> ");
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

