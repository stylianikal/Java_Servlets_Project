<%@ page import="Utils.Connect_Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:include page="default.jsp"/>


<LINK REL=STYLESHEET
      HREF="Table.css"
      TYPE="text/css">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hospital | View All Users</title>
</head>
    <body>
    <br><br><br><br>
    <%
        String username_Session = (String) session.getAttribute("username");
        String role_Session = (String) session.getAttribute("role");
        if (username_Session == null) {
    %>
    <div class="div-container-black">
        <p>You must be logged-in to view this page!</p>
    </div>
    <%
        return;
    }
    else if (!role_Session.equalsIgnoreCase("Administrator")) {
    %>
    <div style="color: red" class="div-container-black">
        <i class="fas fa-times-circle"></i> You must be a staff member to view this page!
    </div>
    <%
            return;
        }
        try {
            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            conn = Connect_Database.getConnection();
            pst = conn.prepareStatement("SELECT * " +
                    "FROM users " +
                    "ORDER BY role DESC");
            rs = pst.executeQuery();
    %>
    <table style="width: 85%; margin:1em auto;">
        <tr class="table-header" >
            <th style="text-align: center;" colspan="7">
                <i class="fas fa-users"></i> Users
            </th>
        </tr>
        <tr style="color: black; font-size: 22px;">
            <th><p><i class="fas fa-id-badge"></i> User ID:</p></th>
            <th><p><i class="far fa-id-card"></i> Full Name:</p></th>
            <th><p><i class="fas fa-user-circle"></i> Username:</p></th>
            <th><p><i class="fas fa-phone"></i> Phone Number:</p></th>
            <th><p><i class="fas fa-user-shield"></i> Usertype:</p></th>
            <th><p><i class="fas fa-envelope"></i> Email:</p></th>
        </tr>
        <%
            while (rs.next()) {
                int id_db = rs.getInt("id");
                String full_name_db = rs.getString("full_name");
                String username_db = rs.getString("username");
                String telephone_db = rs.getString("telephone");
                String role_db = rs.getString("role");
                String email_db = rs.getString("email");

                if (telephone_db == null) telephone_db = "Not Specified";

        %>
        <tr style="color: black; font-size: 20px;">
            <td><p><%= id_db %></p></td>
            <td><p><%= full_name_db %></p></td>
            <td><p><%= username_db %></p></td>
            <td><p><%= telephone_db %></p></td>
            <td><p><%= role_db %></p></td>
            <td><p><%= email_db %></p></td>
        </tr>
        <%
        }
        %>
    </table>
    <%

        }catch (Exception e) {
            e.printStackTrace();
        }
    %>

    </body>
</html>
