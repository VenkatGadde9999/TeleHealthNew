<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file ="managedetailsheader.jsp" %>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.servlet.http.*" import="java.io.*"%>
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
<style>
    .innerimage
    {
        margin-top: 40px;
        border:1px solid #ccc!important;
        width:230px;
        height:250px;    
        border-radius: 50px;
    }
</style>

<!-- Home -->
<%    Connection con1 = null;
    String pid = session.getAttribute("userid").toString();
    try {
        con1 = databasecon.getconnection();
//Connection con1 = databasecon.getconnection();
        PreparedStatement pstmt = con1.prepareStatement("select * from patientinfo where patientid=?");
        pstmt.setString(1, pid);

        ResultSet rs1 = pstmt.executeQuery();
        if (rs1.next()) {


%>


<div class="wrapper bg-white" style="max-width: 750px;" >

    <center>
        <div class="h2 text-center" style="font-size:30px">Personal Information</div>
        <div class="stdimage" >

            <img class="innerimage" id="stdinnerimage"  width=180 height=180 alt="image not found" src="retrieveimage.jsp?userid=<%=pid%>" style="padding:10px ;">
        </div>
    </center>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form name="update" class="pt-3" action="patientinfoedit"  method="post" enctype="multipart/form-data" >
        <div class="form-group py-2">Patient Id
            <div class="input-field">  <input type="text" name="patientid" id="patientid" value="<%= session.getAttribute("userid")%>" placeholder="Patient Email ID" readonly> </div>
        </div>
        <div class="form-group py-1 pb-2">Patient Name
            <div class="input-field"> <input type="text" name="name" id="name"  placeholder="patientname" value="<%= session.getAttribute("uname")%>" readonly required class=""> 
            </div>
        </div>
        <div class="form-group py-2">Date Of Birth
            <div class="input-field">  <!--input type="text" name="dateofbirth" id="dateofbirth"  placeholder="dateofbirth" required class="" --> 
                <input type="date" data-date-inline-picker="true" name="dateofbirth" id="dateofbirth"  value="<%=rs1.getString("dateofbirth")%>" name="dateofbirth" max="4/22/2021">
            </div>
        </div>
        <div class="form-group py-1 pb-2">Gender
            <div class="input-field"> 
                <!--input type="text" name="gender" id="gender" placeholder="gender" required class=""--> 
                <select   id="gender" name="gender">


                    <option value="none" disabled hidden>Select Gender</option>
                    <%
                        String gender = rs1.getString("gender");
                        if (gender != null) {
                            if (gender.equals("male")) {
                    %>
                    
                    <option value="male" selected>Male</option>
                    <option value="female">Female</option>
                    <option value="others">Others</option>
                    <%
                    } else if (gender.equals("female")) {
                    %>
                    
                    <option value="male">Male</option>
                    <option value="female" selected>Female</option>
                    <option value="others">Others</option>
                    <%
                    } else if (gender.equals("other")) {
                    %>
                    
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="others" selected>Others</option>
                    <%
                        }
                    } else {
                    %>
                    
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="others">Others</option>
                    <%  }%>
                </select>
            </div>
        </div>
        <div class="form-group py-1 pb-2">Street
            <div class="input-field"> <input type="text" name="street" id="street" placeholder="street"  value="<%=rs1.getString("street")%>" required class=""> 
            </div>
        </div>

        <div class="form-group py-2">City
            <div class="input-field">  <input type="text" name="city" id="city"  placeholder="city"  value="<%=rs1.getString("city")%>" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">State
            <div class="input-field"> <input type="text" name="state" id="state" placeholder="state"  value="<%=rs1.getString("state")%>" required class=""> 
            </div>
        </div>
        <div class="form-group py-2">Country
            <div class="input-field">  <input type="text" name="country" id="country"  placeholder="country"  value="<%=rs1.getString("country")%>" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">Phone Number
            <div class="input-field"> <input type="text" name="phone" id="phone" placeholder="phone"  value="<%=rs1.getString("phone")%>" required class=""> 
            </div>
        </div>
        <div class="form-group py-1 pb-2">Email
            <div class="input-field"> <input type="text" name="email" id="email" placeholder="email" value="<%= session.getAttribute("userid")%>" readonly required class=""> 
            </div>
        </div>

        <div class="form-group py-1 pb-2">Select Profile Picture
            <div class="input-field"> 
                <input  style=" font-size:18px;font-family: Candara;" type="file" id="photo" name="photo" placeholder="Upload photo" onchange="readURL(this);" >
            </div>
        </div>

        <div class="d-flex align-items-start">


        </div> <button type="submit" class="btn btn-block text-center my-3" name="update" id="update">Update</button>

    </form>
</div>
<%
} else {
%>

<div class="wrapper bg-white" style="max-width: 750px;" >

    <center>
        <div class="h2 text-center" style="font-size:30px">Personal Information</div>
        <div class="stdimage" >

            <img class="innerimage" id="innerimage"  width=180 height=180 alt="image not found" style="padding:10px ;">
        </div>
    </center>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form class="pt-3" name="insert" action="patientinfo"  method="post" enctype="multipart/form-data">
        <div class="form-group py-2">Patient Id
            <div class="input-field">  <input type="text" name="patientid" id="patientid" value="<%= session.getAttribute("userid")%>" placeholder="Patient Email ID" readonly> </div>
        </div>
        <div class="form-group py-1 pb-2">Patient Name
            <div class="input-field"> <input type="text" name="name" id="name" placeholder="patientname" value="<%= session.getAttribute("uname")%>" readonly required class=""> 
            </div>
        </div>
        <div class="form-group py-2">Date Of Birth
            <div class="input-field">  <!--input type="text" name="dateofbirth" id="dateofbirth"  placeholder="dateofbirth" required class="" --> 
                <input type="date" data-date-inline-picker="true" id="dateofbirth" name="dateofbirth" max="4/22/2021">
            </div>
        </div>
        <div class="form-group py-1 pb-2">Gender
            <div class="input-field"> 
                <!--input type="text" name="gender" id="gender" placeholder="gender" required class=""--> 
                <select  id="gender" name="gender">
                    <option value="none" selected disabled hidden>Select Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="others">Others</option>
                </select>
            </div>
        </div>
        <div class="form-group py-1 pb-2">Street
            <div class="input-field"> <input type="text" name="street" id="street" placeholder="street" required class=""> 
            </div>
        </div>

        <div class="form-group py-2">City
            <div class="input-field">  <input type="text" name="city" id="city"  placeholder="city" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">State
            <div class="input-field"> <input type="text" name="state" id="state" placeholder="state" required class=""> 
            </div>
        </div>
        <div class="form-group py-2">Country
            <div class="input-field">  <input type="text" name="country" id="country"  placeholder="country" required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">Phone Number
            <div class="input-field"> <input type="text" name="phone" id="phone" placeholder="phone" required class=""> 
            </div>
        </div>
        <div class="form-group py-1 pb-2">Email
            <div class="input-field"> <input type="text" name="email" id="email" placeholder="email" value="<%= session.getAttribute("userid")%>" readonly required class=""> 
            </div>
        </div>

        <div class="form-group py-1 pb-2">Select Profile Picture
            <div class="input-field"> 
                <input  style=" font-size:18px;font-family: Candara;" type="file" id="photo" name="photo" placeholder="Upload photo" onchange="readURL(this);" >
            </div>
        </div>

        <div class="d-flex align-items-start">


        </div> <button type="submit" class="btn btn-block text-center my-3" name="insert" id="insert">Update</button>

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
            out.println("<html><script>alert(\"Error in Patient Personal Info page: " + ex + "\");"
                    + "window.location='personalinfo.jsp';</script></html> ");
        }
    }

%>
<%@ include file ="footer.jsp" %>