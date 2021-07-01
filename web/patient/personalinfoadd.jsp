<%-- 
    Document   : RoomAdd1
    Created on : 28 Jan, 2018, 12:22:22 AM
    Author     : Chiru
--%>

<%@ page  import="java.sql.*" import="databaseconnection.*" import="java.io.*"%>
<%@ page import="java.text.SimpleDateFormat" import="java.util.Date" %>


<%

    if( session.getAttribute("plogin")==null ||session.getAttribute("plogin")=="false")
    {
        response.sendRedirect("../index.html");
    }
    else
    {    

String userid=session.getAttribute("userid").toString();
String name = request.getParameter("name");
String dateofbirth= request.getParameter("dateofbirth");
String gender= request.getParameter("gender");
String street = request.getParameter("street");
String city= request.getParameter("city");
String state= request.getParameter("state");
String country=request.getParameter("country");
String phone = request.getParameter("phone");
String email= request.getParameter("email");
String photo= request.getParameter("photo");



PreparedStatement pstmt=null;
Connection con1=null;
try
{
	//Class.forName("com.mysql.jdbc.Driver");	
con1 = databasecon.getconnection();
pstmt=con1.prepareStatement("insert into patientinfo values(?,?,?,?,?,?,?,?,?,?,?)");
pstmt.setString(1,userid);
pstmt.setString(2,name);
pstmt.setString(3, dateofbirth);
pstmt.setString(4,gender);
pstmt.setString(5,street);
pstmt.setString(6,city);
pstmt.setString(7,state);
pstmt.setString(8,country);
pstmt.setString(9,phone);
pstmt.setString(10,email);
//int n=pstmt.executeUpdate();

FileInputStream inputStream = new FileInputStream(photo);
         long size=inputStream.available();
         long s=1*1024*1024;
        if(size>=s)
        {
    out.println("<html><script>alert('File size must be less than 1MB');"
           // + "window.location='Donor_Reg.jsp';</script></html> ");
            +"document.room.photo.focus()';</script></html>");
//response.sendRedirect("AdminHomePage.jsp?message=success");
}
//pstmt.setString(15,photo);
pstmt.setBlob(11, inputStream);

int x=pstmt.executeUpdate();
if(x>0)
{
    out.println("<html><script>alert('Personal information added to the account successfully');"
            + "window.location='personalinfo.jsp';</script></html> ");
//response.sendRedirect("AdminHomePage.jsp?message=success");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Personal info Insertion failed');"
            + "window.location='personalinfo.jsp';</script></html> ");
}
}
catch(Exception  e1)
{
//out.println(e1);
    out.println("<html><script>alert( error in patient personal info page:\'"+e1+"\');</script></html> ");
}
finally{
    try
    {
        con1.close();
    }catch(Exception ex)
    {
    }
    }
    }
%>
