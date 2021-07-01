<%-- 
    Document   : addnewappointment
    Created on : 19 Jun, 2021, 11:57:02 PM
    
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="patientheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
<!-- Home -->

<%    String userid = session.getAttribute("userid").toString();;
    int appointmentid = Integer.parseInt(request.getParameter("appointmentid"));
    Connection con1 = null;

    try {
        con1 = databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
        PreparedStatement pstmt = con1.prepareStatement("select * from appointmentslot where appointmentid=? and patientid=?");
        pstmt.setInt(1, appointmentid);
        pstmt.setString(2, userid);

        ResultSet rs1 = pstmt.executeQuery();
        if (rs1.next()) {

            session.setAttribute("appointmentid", rs1.getString("appointmentid"));
%>



<div class="wrapper bg-white" style="max-width: 750px;" >
    <div class="h2 text-center" style="font-size:30px">Edit Appointment</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" name="appointment" action="editappointment"  method="post" enctype="multipart/form-data" >

        <div class="form-group py-2">Doctor Id
            <div class="input-field"> 
                <input type="text" name="doctorid" id="doctorid" value="<%= rs1.getString("doctorid")%>" placeholder="Doctor Email ID" readonly> 
            </div>
        </div>
        <div class="form-group py-1 pb-2">Patient Id
            <div class="input-field"> <input type="text" name="patientid" id="patientid" placeholder="patientid" value="<%= session.getAttribute("userid")%>" readonly> 
            </div>
        </div>
        <div class="form-group py-2">Appointment Slot Time (From)
            <div class="input-field">  <!--input type="text" name="dateofappointment" id="dateofappointment"  placeholder="dateofbirth" required class="" --> 
                <input type="text"  value="<%= rs1.getString("slotstart")%>" id="stotstart" name="sloatstart" readonly>
            </div>
        </div>
        <div class="form-group py-2">Appointment Slot Time (To)
            <div class="input-field">  <!--input type="text" name="dateofappointment" id="dateofappointment"  placeholder="dateofbirth" required class="" --> 
                <input type="text"  value="<%= rs1.getString("slotend")%>" id="stotend" name="sloatend" readonly>
            </div>
        </div>
        <div class="form-group py-2">Appointment Date
            <div class="input-field">  <!--input type="text" name="dateofappointment" id="dateofappointment"  placeholder="dateofbirth" required class="" --> 
                <input type="date" data-date-inline-picker="true" value="<%= rs1.getString("slotdate")%>" id="dateofappointment" name="dateofappointment" max="4/22/2021">
            </div>
        </div>
        <div class="form-group py-1 pb-2">Is Previously Attended
            <div class="input-field"> 
                <!--input type="text" name="gender" id="gender" placeholder="gender" required class=""--> 
                <select  id="gender" name="pevatt">
                    <%
                        String prev_attend = rs1.getString("prev_attend");
                        if (prev_attend != null) {
                            if (prev_attend.equals("yes")) {
                    %>
                    <option value="none" disabled hidden>Select Yes/No</option>
                    <option value="yes" selected>Yes</option>
                    <option value="no">No</option>
                    <%
                    } else if (prev_attend.equals("no")) {
                    %>
                    <option value="none" disabled hidden>Select Yes/No</option>
                    <option value="yes" >Yes</option>
                    <option value="no" selected>No</option>
                    <%  }
                    } else {%>
                    <option value="none" selected disabled hidden>Select Yes/No</option>
                    <option value="yes" >Yes</option>
                    <option value="no" >No</option>
                    <% }%>
                </select>
            </div>
        </div>
        <div class="form-group py-1 pb-2">If Yes, state on which condition and when?
            <div class="input-field"> <textarea   rows="5" cols="100" name="summary" id="summary" placeholder="summary  of the patient condition"  class="">
                    <%= rs1.getString("summary")%>
                </textarea> 
            </div>
        </div>

        <div class="form-group py-1 pb-2">Any Report Document Exists Attach the File
            <div class="input-field"> 
                <input  style=" font-size:18px;font-family: Candara;" type="file" id="repdoc" name="repdoc" placeholder="Upload Report"  >
            </div>
            <% if (!rs1.getString("reportfilename").equals("nofile")) {
        %>
            <div class="d-flex align-items-start">
                <a href="downloadfile.jsp?appointmentid=<%= rs1.getString("appointmentid")%>">download</a>
            </div>
        <% }  %>

        </div>
        <div class="form-group py-2">Appointment Status
            <div class="input-field">  <!--input type="text" name="dateofappointment" id="dateofappointment"  placeholder="dateofbirth" required class="" --> 
                <input type="text"  value="<%= rs1.getString("status")%>" id="status" name="status" readonly>
            </div>
        </div>

        <div class="d-flex align-items-start">


        </div> <button type="submit" class="btn btn-block text-center my-3" name="insert" id="insert">Update Appointment</button>

    </form>


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
                    + "window.location='bookappointment.jsp';</script></html> ");
        }
    }

%>


<%@ include file ="footer.jsp" %>