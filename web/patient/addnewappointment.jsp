<%-- 
    Document   : addnewappointment
    Created on : 19 Jun, 2021, 11:57:02 PM
    
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="patientheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
<!-- Home -->

<%
String docid=request.getParameter("doctorid");

%>



<div class="wrapper bg-white" style="max-width: 750px;" >
    <div class="h2 text-center" style="font-size:30px">New Appointment</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" name="appointment" action="newappointment"  method="post" enctype="multipart/form-data" >
        <div class="form-group py-2">Doctor Id
            <div class="input-field">  <input type="text" name="doctorid" id="doctorid" value="<%= docid %>" placeholder="Doctor Email ID" readonly> </div>
        </div>
        <div class="form-group py-1 pb-2">Patient Id
            <div class="input-field"> <input type="text" name="patientid" id="patientid" placeholder="patientid" value="<%= session.getAttribute("userid")%>" readonly> 
            </div>
        </div>
        <div class="form-group py-2">Appointment Date
            <div class="input-field">  <!--input type="text" name="dateofappointment" id="dateofappointment"  placeholder="dateofbirth" required class="" --> 
                <input type="date" data-date-inline-picker="true" id="dateofappointment" name="dateofappointment" max="4/22/2021">
            </div>
        </div>
        <div class="form-group py-1 pb-2">Is Previously Attended
            <div class="input-field"> 
                <!--input type="text" name="gender" id="gender" placeholder="gender" required class=""--> 
                <select  id="gender" name="pevatt">
                    <option value="none" selected disabled hidden>Select Yes/No</option>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                    
                </select>
            </div>
        </div>
        <div class="form-group py-1 pb-2">If Yes, state on which condition and when?
            <div class="input-field"> <textarea  rows="5" cols="100" name="summary" id="summary" placeholder="summary  of the patient condition"  class="">
</textarea> 
            </div>
        </div>

        <div class="form-group py-1 pb-2">Any Report Document Exists Attach the File
            <div class="input-field"> 
                <input  style=" font-size:18px;font-family: Candara;" type="file" id="repdoc" name="repdoc" placeholder="Upload Report"  >
            </div>
        </div>

        <div class="d-flex align-items-start">


        </div> <button type="submit" class="btn btn-block text-center my-3" name="insert" id="insert">Send Appointment</button>

    </form>


</div>


<%@ include file ="footer.jsp" %>