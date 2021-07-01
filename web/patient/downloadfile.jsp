<%-- 
    Document   : download1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<%
    long size = 0;
    Blob file = null;
    byte[] data = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    String userid = session.getAttribute("userid").toString();
    conn = databasecon.getconnection();
    FileOutputStream fout = null;
// out.println(request.getQueryString());
    response.setContentType("octet/stream");//APPLICATION/OCTET-STREAM");
    String appointmentid = request.getParameter("appointmentid");
    try {
        pstmt = conn.prepareStatement("select * from appointmentslot where appointmentid=?");
        //pstmt.setString(1, userid);
        pstmt.setString(1, appointmentid);

        ResultSet rs1 = pstmt.executeQuery();

        if (rs1.next()) {
            String filename = userid +"_report_"+ rs1.getString("reportfilename");
            //String  appointmentid=request.getParameter("appointmentid");
            String home = System.getProperty("user.home");
            File doc = new File(home + "/Downloads/" + filename);
            response.setHeader("Content-Disposition", "attachment; filename=" + doc.getName());
 //File doc= new File(filename);
/* String ext="";
             String fname=doc.getName();
             if(fname.lastIndexOf(".") != -1 && fname.lastIndexOf(".") != 0)
             ext= fname.substring(fname.lastIndexOf(".")+1);
             */

            file = rs1.getBlob("anyreport");
            data = file.getBytes(1, (int) file.length());
            OutputStream o = response.getOutputStream();
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
    } catch (Exception ex) {
        //ex.printStackTrace();
        out.println("<html><script>alert(file download failed:\'" + ex.toString() + "\');"
                + "window.location='editappointment.jsp?appointmentid=" + appointmentid + "\';</script></html> ");

    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
                pstmt = null;
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
