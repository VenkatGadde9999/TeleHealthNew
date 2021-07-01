
<%-- 
    Document   : GenerateEmailForForgetPasswordByAdmin
    Created on : 3 Mar, 2018, 12:58:45 PM
    Author     : Chiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<jsp:useBean id="forgetpwd" class="beansclasses.User" scope="session"></jsp:useBean>  
    
<%
  //String email=(String)session.getAttribute("email");
    String email=forgetpwd.getEmail();
    String userid=forgetpwd.getUserid();
   System.out.println("****$$$$$$$$$$$$$$$$$$$$$$$$$$$$$***"+email);
   String host="", user="", pass="";
   //int a=(int) (Math.random() * 999999);
//session.setAttribute("aa",a);

//String c =Integer.toString(a);

host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="securebackupfiles.software@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="Sun_Tech1"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =email; // out going email id

String from ="securebackupsoftware@gmail.com"; //Email id of the recipient
String subject="Accoun Activation";//(String)session.getAttribute("subject");
//String subject ="welcome";

String messageText ="Secret Key : <b>"+forgetpwd.getStatus()+"</b>";
messageText+="<h1>to activate click the link and enter the code<a href=\'http://localhost:8080/SECUREBACKUP/activateforgetpassword.jsp?userid="+forgetpwd.getUserid()+"\'>Click Here</a></h1>";

//session.setAttribute("email",email);
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());
//out.println("message successfully sended"); // assume it was sent
//response.sendRedirect("");
transport.close();
//out.println("<html><script>alert('Verification send to the eamil....');"
 //           + "window.location='manageusers.jsp';</script></html> ");
out.println("<script type=\"text/javascript\">");
out.println("alert('Verification send to the email....');");
out.println("location='manageusers.jsp';");
out.println("</script>");

}
catch (Exception err) {

//out.println("<html><script>alert('Sending Verification code failed');"
          //+ "window.location='GenerateEmailForForgetPassword.jsp';</script></html> "); // assume  a fail
    out.println("<script type=\"text/javascript\">");
out.println("alert('Sending Verification code failed....');");
   out.println("location='GenerateEmailForForgetPassword.jsp';");
   out.println("</script>");

}


%>

