
<%@ include file ="header.jsp" %>      
	        <style>
            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

input[type="submit"],button
{
    border: none;
    color: white;
    width: 88%;
    height:40px;
    padding: 4px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    background-color: #4CAF50;
    border-radius: 4px;
}
input:hover,
button:hover {
  opacity: 1;
}

        </style>
        
<div class="content-box-ext" style="max-width: 900px;
    border-radius: 10px;
    margin: 50px auto;
    //padding: 30px 40px;
    box-shadow: 20px 20px 80px rgb(206, 206, 206)">
    <center>
          <div class="h2 text-center" style="font-size:40px;padding-top: 40px;">Patient Password Activation</div>
        <div class="container-login">

            <form name="user"  method="post" action="forgetpasswordactivate1.jsp?userid=<%=request.getParameter("userid")%>" onsubmit="return codevalidate();">
           
            <center>
                 <div class="background">
                <br>
                <table  height="350" width="400">
                    <tr><td>Enter the code<td><input type="text" name="code" id="code" placeholder="Activation Code"></td>
                    </tr>


                        <td>
                            <button type="submit" id="codebtn">Submit</button>
                        </td>
                </table>
                </div>
            </center>

        </form>
</div>
    
		<%@ include file ="footer.jsp" %>