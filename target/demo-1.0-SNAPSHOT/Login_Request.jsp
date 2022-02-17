<%@ page import = "Utils.Connect_Database,java.sql.Connection,java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@page import="Members.Users" %>


<jsp:include page="default.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Hospital</title>
    </head>
    <body>

        <br><br><br><br>

        <%
        try {
            String username_Form = request.getParameter("fieldUsername");
            String password_Form = request.getParameter("fieldPassword");
            String role_Form = request.getParameter("fieldLoginAs");
            if (username_Form == null) {
                response.sendRedirect("index.jsp");
                return;
            }


            String username_db, password_db, role_db;
            //String hashed_password_Form = Encryption.hashPassword(password_Form);

            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            conn = Connect_Database.getConnection();
            pst = conn.prepareStatement("SELECT username, password, role " +
                "FROM users " +
                "WHERE username=? AND password=? AND role=?");
            pst.setString(1, username_Form);
            //pst.setString(2, hashed_password_Form);
            pst.setString(2,password_Form);
            pst.setString(3, role_Form);
            rs = pst.executeQuery();
            if (rs.next()) {
                username_db = rs.getString("username");
                password_db = rs.getString("password");
                role_db = rs.getString("role");
                if (username_Form.equalsIgnoreCase(username_db) && password_Form.equalsIgnoreCase(password_db) && role_Form.equalsIgnoreCase(role_db)) {
                    HttpSession sess = request.getSession(true);
                    sess.setAttribute("username", username_Form);
                    sess.setAttribute("role", role_db);
                    Users users = new Users();

                    response.sendRedirect("index.jsp");
                }
            }
            else {
                rs.close();
                pst.close();
                %>
                <br><br><br>
                <div style="color: red" class="div-container-black">
                    <i class="fas fa-times-circle"></i> Invalid login credentials!
                </div>
                <%
            }
        }
        catch (Exception e)
        {
            %>
            <br><br><br>
            <div style="color: red" class="div-container-black">
                <i class="fas fa-times-circle"></i> Something went wrong. Please try again
            </div>
                <%
                System.out.println("Something went wrong! (Login_Request.jsp)");
                e.printStackTrace();
            }
        %>

    </body>
</html>
