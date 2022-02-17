<html>
    <head>

        <LINK REL=STYLESHEET
            HREF="Menu.css"
            TYPE="text/css">

        <LINK REL=STYLESHEET
            HREF="Basics.css"
            TYPE="text/css">

        <LINK REL=STYLESHEET
            HREF="Forms.css"
            TYPE="text/css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <style>
            * {
                border: 0;
                margin: 0;
                padding: 0;
                outline: 0;
            }
            BODY {

                background: url("bac.jpg") no-repeat fixed;
                background-size: 100% 100% ;
                font-family: "Gill Sans MT", serif;
                font-size: 18px;
                font-weight: bold;
                color: white;
            }
        </style>
        <title></title>

    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    </head>
        <div class="nav">
            <a href = "index.jsp"><i class="fa fa-home"></i> Home</a>
            <a href="Doctors.jsp"> <i class="fa fa-about-alt"></i> Doctors</a>
            <a href = "HospInfo.jsp"><i class="fas fa-about-alt"></i> About Hospital</a>
            <a href = "Contact.jsp"><i class="fas fa-about-alt"></i> Contact Us</a>
            <%
                HttpSession sess = request.getSession(true);
                String _username= (String) sess.getAttribute("username");
                String _role = (String) sess.getAttribute("role");
                if (_username == null) {
                     %>
                    <a style="float: right;" href = "Login.jsp"><i class="fas fa-user-lock"></i> Login</a>
                    <a style="float: right;" href = "Register.jsp"><i class="fas fa-user-plus"></i> Register</a>
                 <%
                } else {
                %>
                <div class="dropdown">
                    <button class="dropbtn"><i class="fas fa-user"></i> <%=_username%>
                        <i class="fa fa-caret-down"></i>
                 </button>
                <div class="dropdown-content">
                    <a href="Profile.jsp"><i class="far fa-address-card"></i> Profile</a>
                    <a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </div>
            </div>
            <%
             if (_role.equalsIgnoreCase("Doctor")) {
             %>
            <div class="dropdown">
                <button class="dropbtn"><i class="fas fa-toolbox"></i>
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="Panel_Users_View.jsp"><i class="fas fa-user-plus"></i> View All Users</a>
                    <a href="Panel_User_Create.jsp"><i class="fas fa-user-plus"></i> Create User</a>
                    <a href="Panel_User_Delete.jsp"><i class="fas fa-user-times"></i> Delete User</a>
                    <a href="Panel_Add_Appointment"><i class="fas-fa-plus"></i>Add Appointment </a>

                </div>

            </div>
            <%
            } else if (_role.equalsIgnoreCase("Administrator")) {
            %>
            <div class="dropdown">
                <button class="dropbtn"><i class="fas fa-toolbox"></i>
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="Panel_Users_View.jsp"><i class="fas fa-user-plus"></i> View All Users</a>
                    <a href="Panel_User_Create.jsp"><i class="fas fa-user-plus"></i> Create User</a>
                    <a href="Panel_User_Delete.jsp"><i class="fas fa-user-times"></i> Delete User</a>
                    <a href="Panel_Add_Appointment"><i class="fas-fa-plus"></i>Add Appointment </a>
                </div>
            </div>
            <%
            }
        } %>
        </div>
    <body>

    </body>
</html>
