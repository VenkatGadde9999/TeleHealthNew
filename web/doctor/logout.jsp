<%-- 
    Document   : doctor logout
   
--%>

<% 
session.setAttribute("userid", null);
session.setAttribute("dlogin", "false");
session.setAttribute("dname",null);
session.removeAttribute("userid)");
session.removeAttribute("dlogin");
session.removeAttribute("dname");

session.invalidate(); 

       
response.sendRedirect("../index.html");

%>