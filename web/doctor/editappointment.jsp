<%-- 
    Document   : addnewappointment
    Created on : 19 Jun, 2021, 11:57:02 PM
    
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="doctorheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
<link rel="stylesheet" type="text/css" href="../styles/bootstrap4/bootstrap.min.css">
<!-- Home -->

<%    String userid = session.getAttribute("userid").toString();;
    int appointmentid = Integer.parseInt(request.getParameter("appointmentid"));
    Connection con1 = null;

    try {
        con1 = databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
        PreparedStatement pstmt = con1.prepareStatement("select * from appointmentslot where appointmentid=? and doctorid=?");
        pstmt.setInt(1, appointmentid);
        pstmt.setString(2, userid);

        ResultSet rs1 = pstmt.executeQuery();
        if (rs1.next()) {

            session.setAttribute("appointmentid", rs1.getString("appointmentid"));
            session.setAttribute("patientid", rs1.getString("patientid"));
%>



<div class="wrapper bg-white" style="max-width: 750px;" >
    <div class="h2 text-center" style="font-size:30px;padding:35px;background-color:orange;color:white;">Request For Appointment</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form action="approveappointment.jsp?appointmentid=<%= rs1.getString("appointmentid")%>" name="approve" method="post">
        <div class="form-group py-2">Doctor Id
            <div class="input-field"> 
                <input type="text" name="doctorid" id="doctorid" value="<%= rs1.getString("doctorid")%>" placeholder="Doctor Email ID" readonly> 
            </div>
        </div>
        <div class="form-group py-1 pb-2">Patient Id
            <div class="input-field"> <input type="text" name="patientid" id="patientid" placeholder="patientid" value="<%= rs1.getString("patientid")%>" readonly> 
            </div>
        </div>
        <div class="form-group py-2">Appointment Slot Time (From)
            <div class="input-field">  
                <input type="text"  value="<%= rs1.getString("slotstart")%>" id="stotstart" name="sloatstart" id="sloatstart" required placeholder="Starting Time"  class="">
            </div>
        </div>
        <div class="form-group py-2">Appointment Slot Time (To)
            <div class="input-field">  
                <input type="text"  value="<%= rs1.getString("slotend")%>" id="stotend" name="sloatend" id="sloatend" required placeholder="Ending Time"  class="" >
            </div>
        </div>
        <div class="form-group py-2">Appointment Date
            <div class="input-field">  <!--input type="text" name="dateofappointment" id="dateofappointment"  placeholder="dateofbirth" required class="" --> 
                <input type="date" data-date-inline-picker="true" value="<%= rs1.getString("slotdate")%>" id="dateofappointment" readonly name="dateofappointment" max="4/22/2021">
            </div>
        </div>
        <div class="form-group py-1 pb-2">Is Previously Attended
            <div class="input-field"> 
                <input type="text" name="gender" id="gender" placeholder="gender" readonly value="<%= rs1.getString("prev_attend")%>" > 

            </div>
        </div>
        <div class="form-group py-1 pb-2">If Yes, state on which condition and when?
            <div class="input-field"> <textarea readonly  rows="5" cols="100" name="summary" id="summary" placeholder="summary  of the patient condition"  class="">
                    <% String msg = rs1.getString("summary");
                        if (msg.equals("") || msg.equalsIgnoreCase("null") || msg.length() == 0) {
                            msg = "No Summary of the patiant condition";
                        }
                    %>
                    <%= msg%>
                </textarea> 
            </div>
        </div>
        <% if (rs1.getString("reportfilename").equals("nofile")) {
        %>
        <div class="form-group py-1 pb-2" > <div class="input-field" style="color:red;">No Report file found to download</div></div>
        <% } else {%>
        <div class="form-group py-1 pb-2">Download the report file
            <!--div class="input-field"> 
                <input  style=" font-size:18px;font-family: Candara;" type="file" id="repdoc" name="repdoc" placeholder="Upload Report"  >
            </div-->
            <div class="form-group py-1 pb-2" >
                <div class="input-field">
                    <a class="btn btn-primary me-3 text-center" style="color:white;font-weight: bold;font-size: 13px" href="downloadfile.jsp?appointmentid=<%= rs1.getString("appointmentid")%>">download report</a>
                </div>
            </div>
        </div>
        <% }%>

        <div class="form-group py-2">Appointment Status
            <div class="input-field">  <!--input type="text" name="dateofappointment" id="dateofappointment"  placeholder="dateofbirth" required class="" --> 
                <input type="text"  value="<%= rs1.getString("status")%>" id="status" name="status" readonly>
            </div>
        </div>

        <div class="d-flex align-items-start">


        </div> 
        <table >
            <tr><td style="padding:15px">

                    <button class="btn btn-primary me-3 text-center" style="color:white;padding-bottom:30px;font-weight: bold;" name="approve" id="approve" >Appointment Approve</button>
                    </form>
                </td>
                <td style="padding:15px">
                    <form action="rejectappointment.jsp?appointmentid=<%= rs1.getString("appointmentid")%>&patientid=<%= rs1.getString("patientid")%>" name="reject" method="post">
                        <button class="btn btn-danger me-3 text-center" style="color:white;padding-bottom:30px;font-weight: bold;" name="reject" id="reject" >Appointment Reject</button>
                    </form>
                </td>
                <td style="padding:15px">
                    <form action="doneappointment.jsp?appointmentid=<%= rs1.getString("appointmentid")%>&patientid=<%= rs1.getString("patientid")%>" name="complete" method="post">
                        <button  class="btn btn-success my-3 text-center" style="color:white;padding-bottom:30px;font-weight: bold;" name="complete" id="complete" >Appointment Completed</button>
                    </form>
                </td>
            </tr>
        </table>


</div>
<%
        }
    } catch (Exception e1) {
        out.println(e1);
    } finally {
        try {
            con1.close();
        } catch (Exception ex) {
            // out.println("<html><script>alert( error in admin profile page:\'"+ex+"\');</script></html> ");
            out.println("<html><script>alert(\"Error in Appointment Edit page: " + ex + "\");"
                    + "window.location='manageappointment.jsp';</script></html> ");
        }
    }

%>


<%@ include file ="footer.jsp" %>