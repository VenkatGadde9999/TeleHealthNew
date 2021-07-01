<%-- 
    Document   : resetpassword

--%>

<%@ include file ="header.jsp" %>   
        <div class="wrapper bg-white">
 
       


    <div class="h2 text-center" style="font-size:30px;">Patient Reset Password</div>
    <div class="h4 text-muted text-center pt-2"> </div>
    <form name="user"  method="post" action="resetpassword1.jsp?userid=<%=request.getParameter("userid")%>" onsubmit="return loginvalidate();">
        <div class="form-group py-2">
            <div class="input-field">  <input type="password" placeholder="password" name="password" id="password"  required class=""> </div>
        </div>
        <div class="form-group py-1 pb-2">
            <div class="input-field"> <input type="password" placeholder="confirm password" name="password2" id="password2" required class=""> 
                </div>
        </div>
               <button type="submit" class="btn btn-block text-center my-3">submit</button>

    </form>
    
	</form>
</div>
    
		<%@ include file ="footer.jsp" %>