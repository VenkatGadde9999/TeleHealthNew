<%-- 
    Document   : retrieveimage
    Created on : 28 Jan, 2018, 2:30:49 AM
    Author     : Chiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" import="java.util.Date" %>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%@page import="java.io.*"%>
<%     String userid = request.getParameter("userid");
       Connection con = null;
    long size=0;  
    Blob image=null;
    byte[] img=null;
    PreparedStatement pstmt = null;
    ResultSet rs= null;
    try {
        con = databasecon.getconnection();
        pstmt= con.prepareStatement("select photo from patientinfo where patientid=?");
        pstmt.setString(1, userid);
        rs = pstmt.executeQuery();
        rs.next();
        image=rs.getBlob("photo");
img=image.getBytes(1,(int)image.length());

 //out.print(image);
response.setContentType("image/gif");
//response.reset();  
         //  response.setContentType("image/jpeg");  
          // response.addHeader("Content-Disposition","filename=logo.jpg");
 OutputStream o=response.getOutputStream();
 o.write(img);
 o.flush();
 o.close();
         } catch (Exception e1) {
                                out.println(e1);
                            } finally {
                                try {
                                    con.close();
         } catch (Exception ex) {
         }
    }
%>