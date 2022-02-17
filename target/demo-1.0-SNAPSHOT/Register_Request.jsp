
<%@ page import="java.util.ArrayList" %>
<%@ page import="Administrators.Admins" %>

<jsp:include page="default.jsp"/>

<html>
    <head>
        <title>Hospital | Register Confirmation</title>
    </head>
    <body>
        <br><br><br><br><br>
        <%
        Admins adminsClass = new Admins();
        String full_name_Form = request.getParameter("field_full_name");
        String username_Form = request.getParameter("field_username");
        String password_Form = request.getParameter("field_password");
        String telephone_Form = request.getParameter("field_telephone");
        String role_Form = request.getParameter("field_role");
        String email_Form = request.getParameter("field_email");

        ArrayList errors = new ArrayList();

        if (username_Form == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        if (adminsClass.searchUsername(username_Form)) {
            errors.add(" Username already exists!");
        }
        if (adminsClass.searchEmail(email_Form)) {
            errors.add(" Email already exists!");
        }
        if (!errors.isEmpty()) {
            %>
            <div style="color: red;" class="form content-container">
                <%
                for (int i = 0; i < errors.size(); i++) {
                    %><i class="fas fa-times-circle"></i><%
                    out.println(errors.get(i));
                    %><br><%
                }
                %>
            </div>
            <%
            return;
        }
        boolean r = adminsClass.createUser(full_name_Form, username_Form ,password_Form, telephone_Form, role_Form,
                    email_Form);
        if (r) {
            %>
            <div style="color: #32f024" class="form content-container">
                <i class="fas fa-check-circle"></i> You have successfully registered your account!
            </div>
            <%
        }
        else {
            %>
            <div style="color: red" class="form content-container">
                <i class="fas fa-times-circle"></i> There was an error while registering your account!
            </div>
            <%
        }
        %>
    </body>
</html>