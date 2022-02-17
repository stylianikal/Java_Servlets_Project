<%--
  Created by IntelliJ IDEA.
  User: Styliani
  Date: 7/13/2021
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="default.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<title>Doctors</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    body {font-family: "Times New Roman", Georgia, Serif;}
    h1, h2, h3, h4, h5, h6 {
        font-family: "Playfair Display";
        letter-spacing: 5px;
    }
</style>
<body>

>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px">
<br><br><br>
    <!-- About Section -->
    <div class="w3-row w3-padding-64" id="about">
        <div class="w3-col m6 w3-padding-large w3-hide-small">
            <img src="download%20(4).jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="600" height="750">
        </div>

        <div class="w3-col m6 w3-padding-large">
            <h1 class="w3-center">About Doctor Stavros</h1><br>
            <h5 class="w3-center"> since 2018</h5>
            <p class="w3-large">Studying at Harvard University with excelent grades. He join our community 3 years ago and we are lucky to have this talnted doctor.eu fugiat nulla pariatur.We only use <span class="w3-tag w3-light-grey">seasonal</span> </p>

        </div>
    </div>
    <!-- About Section -->
    <div class="w3-row w3-padding-64" id="about2">
        <div class="w3-col m6 w3-padding-large w3-hide-small">
            <img src="download%20(3).jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="600" height="750">
        </div>

        <div class="w3-col m6 w3-padding-large">
            <h1 class="w3-center">About Doctor Maria</h1><br>
            <h5 class="w3-center">since 2009</h5>
            <p class="w3-large">Studying at Bistol University and have specialty in gynecologist. He join our community 11 years ago and he help lot of families to have children. <span class="w3-tag w3-light-grey">seasonal</span> </p>

        </div>
    </div>

    <hr>

    <!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
    <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>

</body>
</html>

