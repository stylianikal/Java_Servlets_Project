<%--
  Created by IntelliJ IDEA.
  User: Styliani
  Date: 6/12/2021
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="default.jsp"/>

<LINK REL=STYLESHEET
      HREF="Forms.css"
      TYPE="text/css">


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Hospital | Register</title>
    <style type="text/css">
        .div-link-text {
            display: inline-block;
            margin-left: 70px;
        }
        .div-link {
            display: inline-block;
            font-weight: bold;
            cursor: pointer;
        }
        .div-link:hover {
            color: #018AEB;
            text-decoration: underline;
        }
    </style>
    <script type="text/javascript">
        function formCheck() {
            document.getElementById("div_Errors").innerHTML = "";
            document.getElementById("div_Errors").style.display = "none";

            var full_name = document.form_Register.field_full_name.value;
            var username = document.form_Register.field_username.value;
            var password = document.form_Register.field_password.value;
            var telephone = document.form_Register.field_telephone.value;
            var email = document.form_Register.field_email.value;

            var errors = [];


            var reUsername = /^[A-Za-z0-9]+$/;
            var reOnlyDigits = /^\d+$/;
            //var rePassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$/;

            if(full_name == "" || full_name == null){
                errors.push(" Full Name can't be empty!")
            }
            else if (!reName.test(full_name)){
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
            if (password == null || password === "") {
                errors.push(" You need to enter your password!");
            }
            //else {
                //if (!(rePassword.test(password))) {
                    //errors.push(" Your password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters");
                //}
            //}

            if (telephone != "") {
                if (telephone.length !== 10) {
                    errors.push(" Telephone must contain 10 digits!");
                }
                if (!reOnlyDigits.test(telephone)) {
                    errors.push(" Telephone must be of only digits!");
                }
            }

            if (email == null || email === "") {
                errors.push(" Your Email can't be empty!");
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

    <div id="div_Errors" style="display: none;" class="form form-submit-details-wrong"></div>

    <div class="form"> <%-- Forma gia eggrafi xristi --%>
        <div class="form-heading"><i class="fas fa-user-plus"></i> Sign Up</div>
        <form action="Register_Request.jsp" name="form_Register" method="POST" onsubmit="return formCheck()">
            <label>
                <span style="width: 150px"><i class="fas fa-id-card"></i> Full Name <span class="required">*</span></span>
                <input type="text" class="input-field" name="field_full_name" placeholder="Enter your full name"/>
            </label>
            <label>
                <span style="width: 150px"><i class="fas fa-user-circle"></i> Username <span class="required">*</span></span>
                <input type="text" class="input-field" name="field_username" placeholder="Enter your username" autofocus>
            </label>

            <label>
                <span style="width: 150px"><i class="fas fa-key"></i> Password <span class="required">*</span></span>
                <input type="password" class="input-field" name="field_password" placeholder="Enter your password" autocomplete="off"/>
            </label>

            <br>
            <label>
                <span style="width: 150px"><i class="fas fa-phone"></i> Telephone </span>
                <input type="text" class="input-field" name="field_telephone" placeholder="Enter your phone number"/>
            </label>


            <br>
            <label>
                <span style="width: 150px"><i class="fas fa-medal"></i> Register As <span class="required">*</span></span>
                <select name="field_role" class="select-field">
                    <option selected id="fieldRegisterAsUser">User</option>
                    <option id="fieldRegisterAsCoAdmin">Doctor</option>
                    <option id="fieldRegisterAsAdmin">Administrator</option>
                </select>
            </label>
            <br>
            <label>
                <span style="width: 150px"><i class="fas fa-at"></i> Email <span class="required">*</span></span>
                <input type="text" class="input-field" name="field_email" placeholder="Enter your email address"/>
            </label>

            <button style="margin-left: 170px">Sign Up <i class="fas fa-plus"></i></button>
            <br><br>
        </form>

</div>
</body>
</html>
