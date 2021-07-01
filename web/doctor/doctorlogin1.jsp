
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*"  import="databaseconnection.*"%>

<%

String fname=null,lname=null,status=null;
String userid = request.getParameter("doctorid");
String pwd= request.getParameter("pwd");
Connection con1=null;
try
{
//System.out.println("admin id:"+adminid+"<br>password:"+pwd);
con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
//String sql="select uid,name,userAES_DECRYPT(email,'key') from user";
String sss1 = "select * from doctorlogin where doctorid='"+userid+"' and password='"+pwd+"'";

ResultSet rs1=st1.executeQuery(sss1);
if(rs1.next())
{
session.setAttribute("userid", userid);
session.setAttribute("dlogin", "true");    
fname=rs1.getString("firstname");
lname=rs1.getString("lastname");
status=rs1.getString("status");

session.setAttribute("dname",fname+" "+lname);
//out.println("<html><script>window.location='adminHOME.jsp';</script></html> ");
if(status.equalsIgnoreCase("active"))
    response.sendRedirect("doctorhome.jsp?message=success");
else
    out.println("<html><script>alert('Check the verification code in your email and activate your account');"
            + "window.location='doctorlogin.html';</script></html> ");
//response.getWriter().write("SUCCESS");
//response.setContentType("text/plain");
//String json = "{ \"msg\": \"success\"}";
//out.println("SUCCESS");

//returnResult("SUCCESS");
//response.getWriter().print("{success: true}");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Invalid User id/password');"
            + "window.location='doctorlogin.html';</script></html> ");
  // out.write("FAILURE");
   // returnResult("FAILURE");
}
}
catch(Exception  e1)
{

out.println("<html><script>alert(\"Login Failed "+e1+"\");"
               + "window.location='doctorlogin.html';</script></html> ");
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

