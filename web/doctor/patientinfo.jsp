<%-- 
    Document   : patientsinfo
    Created on : 19 Jun, 2021, 11:23:42 AM
    
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="doctorheader.jsp" %>
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
    String pid = request.getParameter("patientid");
    try {
        con1 = databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
        PreparedStatement pstmt = con1.prepareStatement("select * from patientinfo where patientid=?");
        pstmt.setString(1, pid);

        ResultSet rs1 = pstmt.executeQuery();
        rs1.next();


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


    <div class="h2 text-center" style="font-size:30px;padding:35px;background-color:orange;color:white;">Patient Information</div>
    <table  width="1500"  >


        <th rowspan="13"style="width: 650px;padding-right: 250px;">

        <div class="docimage"  >

            <img  class="innerimage"  id="stdinnerimage1"  alt="image not found" src="retrieveimage_1.jsp?userid=<%=pid%>" style="padding:10px ;">
        </div>

        </th>

        <tr><td>
                <div class="h4 text-muted text-center pt-2"> </div>
                <form name="update" class="pt-3" action="docinfoedit"  method="post" enctype="multipart/form-data" >
                    <div class="form-group py-2">Patient Id
                        <div class="input-field">  <input type="text" name="patientid" id="patientid" value="<%= session.getAttribute("userid")%>" placeholder="Patient Email ID" readonly> </div>
                    </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group py-1 pb-2">Patient Name
                    <div class="input-field"> <input type="text" name="name" id="name"  placeholder="patientname" value="<%= rs1.getString("name")%>" readonly required class=""> 
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group py-2">Date Of Birth
                    <div class="input-field">  <!--input type="text" name="dateofbirth" id="dateofbirth"  placeholder="dateofbirth" required class="" --> 
                        <input type="text"  name="dateofbirth" id="dateofbirth"  value="<%=rs1.getString("dateofbirth")%>" readonly >
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group py-1 pb-2">Gender
                    <div class="input-field"> 
                        <input type="text" name="gender" value="<%= rs1.getString("gender")%>" id="gender" placeholder="gender" readonly> 
                        
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group py-1 pb-2">Street
                    <div class="input-field"> <input type="text" name="street" id="street" placeholder="street"  value="<%=rs1.getString("street")%>" readonly> 
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group py-2">City
                    <div class="input-field">  <input type="text" name="city" id="city"  placeholder="city"  value="<%=rs1.getString("city")%>" readonly> </div>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <div class="form-group py-1 pb-2">State
                    <div class="input-field"> <input type="text" name="state" id="state" placeholder="state"  value="<%=rs1.getString("state")%>" readonly> 
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group py-2">Country
                    <div class="input-field">  <input type="text" name="country" id="country"  placeholder="country"  value="<%=rs1.getString("country")%>" readonly> </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group py-1 pb-2">Phone Number
                    <div class="input-field"> <input type="text" name="phone" id="phone" placeholder="phone"  value="<%=rs1.getString("phone")%>" readonly> 
                    </div>
                </div>
            </td>
        </tr>


    </table>

</div>
<%

       

    } catch (Exception e1) {
        out.println(e1);
       // out.println("<html><script>alert(\"Error in Patients Info page: " + e1 + "\");"
        //           + "window.location='index.html';</script></html> ");
    } finally {
        try {
            con1.close();
        } catch (Exception ex) {
            // out.println("<html><script>alert( error in admin profile page:\'"+ex+"\');</script></html> ");
            out.println("<html><script>alert(\"Error in Patients Info page: " + ex + "\");"
                    + "window.location='index.html';</script></html> ");
        }
    }

%>
<%@ include file ="footer.jsp" %>