<%-- 
    Document   : download1
    Created on : 29 Dec, 2017, 10:43:16 AM
    Author     : Chiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<%
    long size=0;  
    Blob file=null;
    byte[] data=null;
 Connection conn=null;
 PreparedStatement pstmt = null;
 String userid=session.getAttribute("userid").toString();
 conn = databasecon.getconnection();
 FileOutputStream fout=null;
// out.println(request.getQueryString());
 response.setContentType ("octet/stream");//APPLICATION/OCTET-STREAM");
 try{
 String  filename=request.getParameter("filename"); 
 String fileid=request.getParameter("fileid");
  String home = System.getProperty("user.home");
File doc = new File(home+"/Downloads/" + filename); 
response.setHeader ("Content-Disposition","attachment; filename="+doc.getName());
 //File doc= new File(filename);
/* String ext="";
 String fname=doc.getName();
 if(fname.lastIndexOf(".") != -1 && fname.lastIndexOf(".") != 0)
        ext= fname.substring(fname.lastIndexOf(".")+1);
*/
 pstmt = conn.prepareStatement("select * from managefiles where fileid=? and userid=?");
 pstmt.setString(1, fileid);
 pstmt.setString(2,userid);
 
 ResultSet rs1=pstmt.executeQuery();
 if(rs1.next())
 {
file=rs1.getBlob("filedata");
data=file.getBytes(1,(int)file.length());
   OutputStream o=response.getOutputStream();
 o.write(data);
 o.flush();
 o.close();
//Blob lob=rs1.getBlob(4);
//InputStream in=lob.getBinaryStream();//1,(int) lob.length());

 /*fout=new FileOutputStream(doc);
 int n;//=in.read();
 while((n=in.read())!=-1)
  {
      out.write(n);
  //fout.write(n);
//  n=in.read();
  }
// out.println(fout);
        
 in.close();
 out.flush();
 out.close();
         */
 //out.println("<html><script>alert('file downloaded successfully');"
   //         + "window.location='download.jsp';</script></html> ");
 }
 }
 catch(Exception ex)
 {
 //ex.printStackTrace();
     out.println("<html><script>alert(file download failed:\'"+ex.toString()+"\');"
            + "window.location='managebackup.jsp';</script></html> ");
 }
 finally{
 try{
 if(pstmt !=null)
 {
 pstmt.close();
 pstmt=null;
 }
 if(conn!=null)
 {
 conn.close();
 conn=null;
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 }
 %>
