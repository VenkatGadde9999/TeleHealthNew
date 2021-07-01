
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*"  import="databaseconnection.*"%>


<%

String fname=null,lname=null;
String seccode = request.getParameter("code");
String emailid= request.getParameter("userid");
Connection con1=null;
 PreparedStatement pstmt = null,pstm1=null;
try
{
//out.write("admin id:"+empid+"<br>password:"+pwd);
con1 = databasecon.getconnection();
String sql = "SELECT status from doctorlogin WHERE doctorid=? and status=?";
            
            
            pstmt = con1.prepareStatement(sql);
            pstmt.setString(1, emailid);
            pstmt.setString(2,seccode);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String updatesql="update doctorlogin set status=? where doctorid=?";
                pstm1= con1.prepareStatement(updatesql);
                pstm1.setString(1,"active");
                pstm1.setString(2, emailid);
                pstm1.execute();
                out.println("<html><script>alert('Account Activated');"
                + "window.location='doctorlogin.html'</script></html> ");
            }
            else
            {
             out.println("<html><script>alert('Invalid Activation Code');"
                + "window.location=\"activate.jsp?userid="+emailid+"\"</script></html> ");
            }
/*
out.println("<html><script>alert(\"Doctor Id Already existing "+e2+"\");"
               + "window.location='doctorreg.jsp';</script></html> ");*/
}
catch(Exception  e1)
{
out.println("<html><script>alert(\"Activating Account Failed : "+e1+"\");"
               + "window.location=\"activate.jsp?userid="+emailid+"\"</script></html> ");
    
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
