
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*"  import="databaseconnection.*"%>


<%


String password = request.getParameter("password");
String emailid= request.getParameter("userid");
Connection con1=null;
 PreparedStatement pstmt = null,pstm1=null;
try
{
String seccode=(String)session.getAttribute("code");
//out.write("admin id:"+empid+"<br>password:"+pwd);
con1 = databasecon.getconnection();
String sql = "SELECT status from patientlogin WHERE patientid=? and status=?";
            
            
            pstmt = con1.prepareStatement(sql);
            pstmt.setString(1, emailid);
            pstmt.setString(2,seccode);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
String updatesql="update patientlogin set password=?, status=? where patientid=?";
                pstm1= con1.prepareStatement(updatesql);
                pstm1.setString(1,password);
                pstm1.setString(2,"active");
                pstm1.setString(3, emailid);
                
                if(pstm1.executeUpdate()>0)
                {
                out.println("<html><script>alert('Reset password Successfully');"
                + "window.location='login.html'</script></html> ");
            }
            else
            {
             out.println("<html><script>alert('Password reset failed');"
                + "window.location=\"resetpassword.jsp?userid="+emailid+"\"</script></html> ");
            }
            }else
            {
                out.println("<html><script>alert('Password reset failed');"
                + "window.location=\"resetpassword.jsp?userid="+emailid+"\"</script></html> ");
            }
/*
out.println("<html><script>alert(\"Patient Id Already existing "+e2+"\");"
               + "window.location='patientreg.jsp';</script></html> ");*/
}
catch(Exception  e1)
{
out.println("<html><script>alert(\"Reset Password Failed : "+e1+"\");"
               + "window.location=\"resetpassword.jsp?userid="+emailid+"\"</script></html> ");
    
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
