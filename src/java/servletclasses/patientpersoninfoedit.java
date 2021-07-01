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

@WebServlet(name = "patientpersoninfoedit", urlPatterns = {"/patientinfoedit"})
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class patientpersoninfoedit extends HttpServlet {

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
            out.println("<title>Servlet patientpersoninfoedit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet patientpersoninfoedit at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
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
        //  processRequest(request, response);
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
        Part filePart = request.getPart("photo");
         inputStream = filePart.getInputStream();
        try {
            if (filePart != null && inputStream.available()>0 ) {
                  // constructs SQL statement
                pstmt = conn.prepareStatement("update patientinfo set patientid=?,name=?,dateofbirth=?,gender=?,street=?,city=?,state=?,country=?,phone=?,email=?,photo=? where patientid=?");
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
                pstmt.setString(12, userid);
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
            } else {
                // constructs SQL statement
                pstmt = conn.prepareStatement("update patientinfo set patientid=?,name=?,dateofbirth=?,gender=?,street=?,city=?,state=?,country=?,phone=?,email=? where patientid=?");
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
                pstmt.setString(11, userid);
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
            }
        } catch (Exception ex) {
            //ex.printStackTrace();
            out.println("<html><script>alert(Connection failed:\'" + ex.toString() + "\');"
                    + "window.location='personalinfo.jsp';</script></html> ");
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
