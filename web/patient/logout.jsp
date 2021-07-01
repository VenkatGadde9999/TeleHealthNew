<%-- 
    Document   : logout
   
--%>

<% 
session.setAttribute("userid", null);
session.setAttribute("plogin", "false");
session.setAttribute("uname",null);
session.removeAttribute("userid)");
session.removeAttribute("plogin");
session.removeAttribute("uname");

session.invalidate(); 

       
response.sendRedirect("../index.html");

%>