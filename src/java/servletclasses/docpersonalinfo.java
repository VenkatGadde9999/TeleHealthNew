/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletclasses;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import databaseconnection.*;
import java.util.*;

 import org.apache.commons.fileupload.*;
 import org.apache.commons.fileupload.disk.*;  
 import org.apache.commons.fileupload.servlet.*;
 import org.apache.commons.io.output.*;
 import org.apache.commons.io.*;

@WebServlet(name = "docpersonalinfo", urlPatterns = {"/docinfo"})
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class docpersonalinfo extends HttpServlet {

    Connection conn = null;
    PreparedStatement pstmt = null;
    HttpSession session = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet docpersonalinfo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet docpersonalinfo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        // connects to the database
        conn = databasecon.getconnection();
        FileInputStream fis = null;

        session = request.getSession();
        String userid = session.getAttribute("userid").toString();
         //==========================================================
        String name = request.getParameter("name");
        String dateofbirth = request.getParameter("dateofbirth");
        String gender = request.getParameter("gender");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
//String photo= request.getParameter("photo");

        //================================================================
        PrintWriter out = response.getWriter();
        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("dphoto");
        if (filePart != null) {
            // prints out some information for debugging
            out.println(filePart.getName());
            out.println(filePart.getSize());
            out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        } else {
            //         out.println("file part is null");
            out.println("<html><script>alert('Personal info Insertion failed');"
                    + "window.location='personalinfo.jsp';</script></html> ");
        }

 //out.print(fileid+"<br>");
        //out.print(category+"<br>");
 //************************************
        String fileName = filePart.getSubmittedFileName();

        try {

            /*String fieldName="";
             String fileName="";

             List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
             int i=0;
             out.print("lengt of list:"+items.size());
             InputStream fileContent=null;
                
             FileItem fi=null;
             for (FileItem item : items) {
             if (item.isFormField()) {
             // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
             fieldName = item.getFieldName();
             String fieldValue = item.getString();
             out.print(fieldName+i+"<br>");
             out.print(fieldValue+i+"<br>");
 
             // ... (do your job here)
             } else {
             // Process form file field (input type="file").
             fi = (FileItem)item;
             fieldName = item.getFieldName();
             fileName = FilenameUtils.getName(item.getName());
 
             fileContent = item.getInputStream();
             // ... (do your job here)
             out.print(fieldName+i+"<br>");
             out.print(fileName+i+"<br>");
             out.print("<br>is in meory:"+fi.isInMemory());
             out.println("<br>size:"+fi.getSize());
             }
             i++;
             }*/
 //================================
            String ext = "";
            if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0) {
                ext = fileName.substring(fileName.lastIndexOf(".") + 1);
            }

            // constructs SQL statement
            pstmt = conn.prepareStatement("insert into doctorinfo values(?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, userid);
            pstmt.setString(2, name);
            pstmt.setString(3, dateofbirth);
            pstmt.setString(4, gender);
            pstmt.setString(5, street);
            pstmt.setString(6, city);
            pstmt.setString(7, state);
            pstmt.setString(8, country);
            pstmt.setString(9, phone);
            pstmt.setString(10, email);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                pstmt.setBlob(11, inputStream);
            }

            // sends the statement to the database server
            int row = pstmt.executeUpdate();
            response.setContentType("text/html");
            if (row > 0) {
                out.println("<html><script type=\"text/javascript\">");
                out.println("alert('uploaded successfully');");
                out.println("location='personalinfo.jsp';");
                out.println("</script></html>");

            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('uploaded  failed');");
                out.println("location='personalinfo.jsp';");
                out.println("</script>");
            }
        } catch (Exception ex) {
            //ex.printStackTrace();
          /*  out.println("<script type=\"text/javascript\">");
                out.println("alert('uploaded  failed');");
                out.println("location='personalinfo.jsp';");
                out.println("</script>");
                alert(\"Connection failed "+e2+"\");"*/
            out.println("<script>alert(Connection failed:\'" + ex.toString() + "\');"
                    + "window.location='personalinfo.jsp';</script> ");
            
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                    pstmt = null;
                }
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

            // forwards to the message page
        //           getServletContext().getRequestDispatcher("/upload.jsp").forward(request, response);
 //=================================
    }
    //   processRequest(request, response);
}
