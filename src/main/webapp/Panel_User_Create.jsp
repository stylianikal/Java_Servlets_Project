<jsp:include page="default.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hospital</title>
    <script type="text/javascript">
        function formCheck() {
            document.getElementById("div_Errors").innerHTML = "";
            document.getElementById("div_Errors").style.display = "none";

            var full_name = document.form_CreateUser.field_full_name.value;
            var username = document.form_CreateUser.field_username.value;
            var password = document.form_CreateUser.field_password.value;
            var telephone = document.form_CreateUser.field_telephone.value;
            var email = document.form_CreateUser.field_email.value;

            var errors = [];

            var reName = /^[A-Za-z]+$/;
            var reUsername = /^[A-Za-z0-9]+$/;
            var reOnlyDigits = /^\d+$/;
            var rePassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$/;


            /*Elexoi gia ean einai kena ta pedia firstname kai lastname
            kai ser periptosi pou den einai, to periexomeno tous na min periexei xaraktires i arithmous*/
            if (full_name == "" || full_name == null) {
                errors.push(" Full Name can't be empty!");
            }
            else if (!reName.test(full_namename)) {
                errors.push(" Full Name can't have special characters or any digits!");
            }

            if (username == "" || username == null) {
                errors.push(" Username can't be empty!");
            }
            else {
                if (!reUsername.test(username)) {
                    errors.push(" Username must not contain special characters!");
                }
                for (var i = 0; i < username.length; i++) {
                    var j = username[i];
                    if (j == " "){
                        errors.push(" Username must not contain spaces!");
                    }
                }
            }
            if (password == "") {
                errors.push(" Password can't be empty!");
            }
            else {
                if (!(rePassword.test(password))) {
                    errors.push(" Your new password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters");
                }
            }

            if (telephone != "") {
                if (telephone.length !== 10) {
                    errors.push(" Telephone must contain 10 digits!");
                }
                if (!reOnlyDigits.test(telephone)) {
                    errors.push(" Telephone must be of only digits!");
                }
            }
            if (email == null || email === "") {
                errors.push(" Email can't be empty!");
            }
            else {
                if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
                {
                    errors.push(" Invalid Email address!");
                }
            }
            if (errors.length !== 0) {
                document.getElementById("div_Errors").style.display = "block";
                document.getElementById("div_Errors").style.color = "Red";
                for (i = 0; i < errors.length; i++) {
                    document.getElementById("div_Errors").innerHTML += '<i class="fas fa-times-circle"></i>' + errors[i] + '<br />';
                }
                return false;
            }
        }
    </script>
</head>
<body>
<br><br><br><br>
<%
    String username_Session = (String) session.getAttribute("username");
    String role_Session = (String) session.getAttribute("role");
    if (username_Session == null) {
        %>
<div style="color: red" class="form content-container">
    <i class="fas fa-times-circle"></i> You must be logged-in to view this page!
</div>
<%
        return;
    }
    else if (!role_Session.equalsIgnoreCase("Administrator")) {
        %>
<div style="color: red" class="form content-container">
    <i class="fas fa-times-circle"></i> You must be a staff member to view this page!
</div>
<%
        return;
    }
    %>

<div id="div_Errors" style="display: none;" class="form form-submit-details-wrong"></div>

<%--Forma gia dimiourgia xristi--%>
<div class="form">
    <div class="form-heading"><i class="fas fa-user-plus"></i> Create User</div>
    <form action="Panel_User_Create_Request.jsp" name="form_CreateUser" method="POST" onsubmit="return formCheck()">
        <label>
            <span style="width: 150px"><i class="fas fa-id-card"></i> Full Name <span class="required">*</span></span>
            <input type="text" class="input-field" name="field_full_name" placeholder="Enter User's fullname"/>
        </label>

        <label>
            <span style="width: 150px"><i class="fas fa-user-circle"></i> Username <span class="required">*</span></span>
            <input type="text" class="input-field" name="field_username" placeholder="Enter User's username" autofocus>
        </label>

        <label>
            <span style="width: 150px"><i class="fas fa-key"></i> Password <span class="required">*</span></span>
            <input type="password" class="input-field" name="field_password" placeholder="Enter User's password" autocomplete="off"/>
        </label>

        <br>

        <label>
            <span style="width: 150px"><i class="fas fa-at"></i> Email <span class="required">*</span></span>
            <input type="text" class="input-field" name="field_email" placeholder="Enter User's email address"/>
        </label>


        <label>
            <span style="width: 150px"><i class="fas fa-medal"></i> User Type <span class="required">*</span></span>
            <select name="field_role" class="select-field">
                <option selected id="fieldRegisterAsUser">User</option>
                <option id="fieldRegisterAsCoAdmin">Doctor</option>
                <option id="fieldRegisterAsAdmin">Administrator</option>
            </select>
        </label>
        <label>
            <span style="width: 150px"><i class="fas fa-phone"></i> Telephone </span>
            <input type="text" class="input-field" name="field_telephone" placeholder="Enter User's phone number"/>
        </label>
        <br>
        <button style="margin-left: 170px">Create <i class="fas fa-plus"></i></button>
        <br><br>
    </form>
</div>


</body>
</html>
