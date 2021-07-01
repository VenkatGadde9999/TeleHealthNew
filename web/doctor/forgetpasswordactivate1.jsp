
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*"  import="databaseconnection.*"%>


<%


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
                session.setAttribute("code", seccode);
                /*out.println("<html><script>alert('Account Activated');"
                + "window.location='login.html'</script></html> ");*/
                String redirectURL="resetpassword.jsp?userid="+emailid;
                 response.sendRedirect(redirectURL);
            }
            else
            {
             out.println("<html><script>alert('Invalid Activation Code');"
                + "window.location=\"forgetpasswordactivate.jsp?userid="+emailid+"\"</script></html> ");
            }
/*
out.println("<html><script>alert(\"Patient Id Already existing "+e2+"\");"
               + "window.location='doctorreg.jsp';</script></html> ");*/
}
catch(Exception  e1)
{
out.println("<html><script>alert(\"Activating Account Failed : "+e1+"\");"
               + "window.location=\"forgetpasswordactivate.jsp?userid="+emailid+"\"</script></html> ");
    
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
