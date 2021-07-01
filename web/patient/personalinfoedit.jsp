<%-- 
    Document   : personalinfo1
    Created on : 13 Jun, 2021, 5:41:40 PM
   
--%>


<%@ page  import="java.sql.*" import="databaseconnection.*" import="java.io.*"%>
<%@ page import="java.text.SimpleDateFormat" import="java.util.Date" %>


<%

  
if( session.getAttribute("alogin")==null ||session.getAttribute("alogin")=="false")
    {
        //response.sendRedirect("index.jsp");
      out.println("<html><script>window.location='index.jsp';</script></html> ");
    }
    else
    {    
String rid=null,roomtype=null,description=null,photo=null,noofpersons=null;
int amount;

rid = request.getParameter("id");
roomtype= request.getParameter("roomtype");
description=request.getParameter("description");
amount=Integer.parseInt(request.getParameter("amount"));
noofpersons=request.getParameter("noofpersons");
photo=request.getParameter("photo");
PreparedStatement  pstmt=null;
Connection con1=null;
try
{
	con1= databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
if(photo!="")        
{
pstmt = con1.prepareStatement("update roomtypes set `roomtype`=?,`description`=?,`photo`=?,`amount`=?,'noofpersons'=? where `rid`=?");
pstmt.setString(1, roomtype);
pstmt.setString(2, description);
pstmt.setInt(4,amount);
pstmt.setString(5, noofpersons);
//out.println("<html><script>alert('File size must be less than 1MB"+photo+":');</script></html>");

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
pstmt.setBlob(3, inputStream);
pstmt.setString(6, rid);
}
else
{
pstmt = con1.prepareStatement("update roomtypes set `roomtype`=?,`description`=?,`amount`=?,`noofpersons`=? where `rid`=?");
pstmt.setString(1, roomtype);
pstmt.setString(2, description);
pstmt.setInt(3,amount);
pstmt.setString(4,noofpersons);
pstmt.setString(5, rid);
}
int x=pstmt.executeUpdate();
if(x>0)
{
    out.println("<html><script>alert('Record updated');"
            + "window.location='RoomEdit.jsp?rid="+rid+"\';</script></html> ");
//response.sendRedirect("AdminHomePage.jsp?message=success");
}
else
{
//response.sendRedirect("alert('Invalid User id/password')");
    out.println("<html><script>alert('Updation failed');"
            + "window.location='RoomEdit.jsp?rid="+rid+"\';</script></html> ");

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
    }
    }
    }
%>

