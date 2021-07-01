
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*"  import="databaseconnection.*"%>
<%@ include file ="doctorheader.jsp" %>
<%

    String userid = session.getAttribute("userid").toString();;
    String appointmentid = request.getParameter("appointmentid");
    String sloatstart = request.getParameter("sloatstart");
    String sloatend = request.getParameter("sloatend");
    String status = "Appointment Approved";

    PreparedStatement pstmt = null;
    Connection con1 = null;
    try {
        con1 = databasecon.getconnection();

        String pid = request.getParameter("patientid");
        PreparedStatement pstmt_1 = con1.prepareStatement("select name from patientinfo where patientid=?");
        pstmt_1.setString(1, pid);

        ResultSet rs1 = pstmt_1.executeQuery();
        rs1.next();
        String patientname=rs1.getString("name");

        pstmt = con1.prepareStatement("update appointmentslot set slotstart=?, slotend=?,status=? where  appointmentid=?");
        pstmt.setString(1, sloatstart);
        pstmt.setString(2, sloatend);
        pstmt.setString(3, status);
        pstmt.setString(4, appointmentid);

        int n = pstmt.executeUpdate();
        if (n > 0) {
            response.sendRedirect("GenerateEmailToPatient.jsp?appointmentstatus=" + status + "&patientname=" + patientname);

            out.println("<html><script>alert('Applointment Request Approved successfully');"
                    + "window.location='manageappointment.jsp';</script></html> ");
//response.sendRedirect("adminhome.jsp?message=success");
        } else {
//response.sendRedirect("alert('Invalid User id/password')");
            out.println("<html><script>alert('Appointment Request Approved process failed');"
                    + "window.location='manageappointment.jsp';</script></html> ");
        }

    } catch (Exception e1) {

        out.println("<html><script>alert(\"Appointment Request Approvial Failed " + e1 + "\");"
                + "window.location='manageappointment.jsp';</script></html> ");
    } finally {
        try {
            con1.close();
        } catch (Exception ex) {
        }
    }
%>

