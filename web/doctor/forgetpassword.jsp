<%-- 
    Document   : forgetpassword

--%>

<%@ include file ="header.jsp" %>      
	<div id="content">
         
        <form name="user"  method="post" action="forgetpassword1.jsp" onsubmit="return loginvalidate();">
           
            <center>
                 <div class="background">
                <br>
                <table  height="350" width="500">
                    <tr><td colspan="2" style="font-size: 1.8em;font-weight: bolder;color:darkred ; text-decoration: underline;">Forget Password</td></tr>
                    <tr>
                     
                        <td><input type="text" name="userid" id="userid" placeholder="user id"></td>
                    </tr>

                    <tr><td>
                            <input  type="text"  name="email" id="email" placeholder="email id">
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <button id="forgetpwdbtn">Submit</button>
                        </td>
                </table>
                </div>
            </center>

        </form>
</div>
    
		<%@ include file ="footer.jsp" %>