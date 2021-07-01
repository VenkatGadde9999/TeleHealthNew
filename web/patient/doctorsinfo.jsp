<%-- 
    Document   : doctorsinfo
    Created on : 19 Jun, 2021, 11:23:42 AM
    
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="patientheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
<!-- Home -->
<!-- Home -->
<script>
    //if(performance.navigation.type == 2)
    //  {
    //location.reload();
    //window.location.reload(true)
    //}
    function readURL(input) {
        /*if (input.files && input.files[0]) {
         var reader = new FileReader();
         
         reader.onload = function (e) {
         $('#stdinnerimage')
         .attr('src', e.target.result)
         .width(180)
         .height(180);
         };
         
         reader.readAsDataURL(input.files[0]);
         }
         */



        var preview = document.querySelector('img');

        var file = document.querySelector('input[type=file]').files[0];

        var reader = new FileReader();

        reader.addEventListener("load", function () {

            preview.src = reader.result;

        }, false);

        if (file)

        {

            reader.readAsDataURL(file);

        }

    }
</script>
<script>
    function onFileSelected(event) {
        var selectedFile = event.target.files[0];
        var reader = new FileReader();

        var imgtag = document.getElementById("roomimage");
        imgtag.title = selectedFile.name;

        reader.onload = function (event) {
            imgtag.src = event.target.result;
        };

        reader.readAsDataURL(selectedFile);
    }
</script>
<!-- Home -->
<%    Connection con1 = null;
    //String did = session.getAttribute("userid").toString();
    try {
        con1 = databasecon.getconnection();
        PreparedStatement pstmt2 = con1.prepareStatement("select count(*) from doctorinfo");
        PreparedStatement pstmt3 = con1.prepareStatement("select count(*) from docspecialization");
        ResultSet rs2 = pstmt2.executeQuery();
        ResultSet rs3 = pstmt3.executeQuery();
        if (rs2.next() && rs3.next()) {
//Connection con1 = databasecon.getconnection();
            PreparedStatement pstmt = con1.prepareStatement("select * from doctorlogin");
            //   pstmt.setString(1, did);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String did = rs.getString("doctorid");
                PreparedStatement pstmt1 = con1.prepareStatement("select name,gender,specialization,qualification,institute_name,procurement_year,experience from doctorinfo,docspecialization where doctorinfo.doctorid=docspecialization.doctorid and  doctorinfo.doctorid='" + did + "' order by specialization");
                ResultSet rs1 = pstmt1.executeQuery();

                if (rs1.next()) {
%>
<style>
    .innerimage
    {
        width:460px; 
        height: 480px; 
        border-radius: 250px; 
        margin-top: 40px;
        border:1px solid #ccc!important;
    }



</style>

<div class="wrapper bg-white" style="max-width:85%;" >


    <div class="h2 text-center" style="font-size:30px;padding:35px;background-color: red;color:white;"><%= rs1.getString("specialization")%></div>
    <table  width="1500"  >


        <th rowspan="2"style="width: 650px;padding-right: 250px;">

        <div class="docimage"  >

            <img  class="innerimage"  id="stdinnerimage1"  alt="image not found" src="retrieveimage_1.jsp?userid=<%=did%>" style="padding:10px ;">
        </div>

        </th>

        <tr><td>
                <div class="h4 text-muted text-center pt-2"> </div>

                <div class="form-group py-2">Doctor Id
                    <div class="input-field">  <input type="text" name="doctorid" id="doctorid" value="<%= did%>" placeholder="Doctor Email ID" readonly> </div>
                </div>
            
                <div class="form-group py-1 pb-2">Doctor Name
                    <div class="input-field"> <input type="text" name="name" id="name"  placeholder="doctorname" value="<%= rs1.getString("name")%>" readonly > 
                    </div>
                </div>
            
                <div class="form-group py-2">Gender
                    <div class="input-field">  <input type="text" name="gender" id="gender" value="<%= rs1.getString("gender")%>" readonly > 

                    </div>
                </div>
                <div class="form-group py-1 pb-2">Qualification
                    <div class="input-field"> 
                        <input type="text" name="qualification" id="qualification" value="<%= rs1.getString("qualification")%>" readonly> 


                    </div>
                </div>
                <div class="form-group py-1 pb-2">Institute Name
                    <div class="input-field"> <input type="text" name="institute_name" id="institute_name"   value="<%=rs1.getString("institute_name")%>" readonly> 
                    </div>
                </div>
                <div class="form-group py-2">Procurement Year
                    <div class="input-field">  <input type="text" name="procurement_year" id="procurement_year"  placeholder="procurement_year"  value="<%=rs1.getString("procurement_year")%>" readonly> </div>
                </div>
                    <div class="form-group py-1 pb-2">Experience
                    <div class="input-field"> <input type="text" name="experience" id="experience" placeholder="experience"  value="<%=rs1.getString("experience")%>" readonly > 
                    </div>
                </div>
            
            </td>
        </tr>

        <tr >
            <td >

                <form name="update" class="pt-3" action="patient/addnewappointment.jsp?doctorid=<%= did %>"  method="post" enctype="multipart/form-data" >
                    <button type="submit" class="btn btn-primary text-center my-3" style="width: 50%;padding-bottom: 35px;padding-top: 5px;margin-left: 150px" name="update" id="update">Book Appointment</button>
                </form>
            </td>
            <td>
            </td>
        </tr>



    </table>

</div>
<%

                }//rs1.next() if closing
            } //while loop
        } else {
            out.println("<html><script>alert('Doctor Details not found');"
                    + "window.location='index.html';</script></html> ");
        }
    } catch (Exception e1) {
        out.println(e1);
       // out.println("<html><script>alert(\"Error in Doctors Info page: " + e1 + "\");"
        //           + "window.location='index.html';</script></html> ");
    } finally {
        try {
            con1.close();
        } catch (Exception ex) {
            // out.println("<html><script>alert( error in admin profile page:\'"+ex+"\');</script></html> ");
            out.println("<html><script>alert(\"Error in Doctors Info page: " + ex + "\");"
                    + "window.location='index.html';</script></html> ");
        }
    }

%>
<%@ include file ="footer.jsp" %>