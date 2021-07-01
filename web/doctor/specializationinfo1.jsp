<%-- 
    Document   : specialization1
    Created on : 15 Jun, 2021, 9:46:36 PM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*" %>

<%
String docid=session.getAttribute("userid").toString();
Connection con1=null;
try
{
String specialization = request.getParameter("specialization");
String qualification= request.getParameter("qualification");
String institute_name= request.getParameter("institute");
String procurement_year=request.getParameter("year");
int experience=Integer.parseInt(request.getParameter("experience"));


con1= databasecon.getconnection();
//out.println("Connection value:"+con1);
//Connection con1 = databasecon.getconnection();
PreparedStatement pstmt = con1.prepareStatement("insert into docspecialization values(?,?,?,?,?,?)");
pstmt.setString(1, docid);
pstmt.setString(2, specialization);
pstmt.setString(3, qualification);
pstmt.setString(4, institute_name);
pstmt.setString(5, procurement_year);
pstmt.setInt(6, experience);


int x=pstmt.executeUpdate();
if(x>0)
{
    out.println("<html><script>alert('Successfully specialization details added to the account');"
            + "window.location='specializationinfo.jsp';</script></html> ");
//response.sendRedirect("AdminHomePage.jsp?message=success");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Specializaiton Details Insertion failed');"
               + "window.location='specializationinfo.jsp';</script></html> ");
}
}

catch(Exception  e1)
{
//out.println(e1);

out.println("<html><script>alert(\"Error "+e1+"\");"
        + "window.location='specialization.jsp';</script></html> ");
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

