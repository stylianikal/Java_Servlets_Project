<jsp:include page="default.jsp"/>

<html>
<head>
  <title>Hospital | Add a new appointment</title>
  <script type="text/javascript">
    //Prosthetoume tin timi tou clicked checkbox
    function checkboxValueCount(input){
      var inpHiddenCategories = document.getElementById("hidden_categories_result");

      if (input.checked == true) {
        if (inpHiddenCategories.value == "") {
          inpHiddenCategories.value = input.value;
        } else {
          inpHiddenCategories.value += "|" + input.value;
        }
      }
      else {
        if (!inpHiddenCategories.value.includes("|") || inpHiddenCategories.value == "NaN") {
          inpHiddenCategories.value = "";
        }
        if (!inpHiddenCategories.value.startsWith("|")) {
          inpHiddenCategories.value = inpHiddenCategories.value.replace(input.value + '|', '');
        }
        if (inpHiddenCategories.value != "") {
          inpHiddenCategories.value = inpHiddenCategories.value.replace('|' + input.value,  '');
        }
      }
    }

    //Function gia na metrisoume posa checkboxes einai checked
    function checkboxCount() {
      var inputElems = document.getElementsByTagName("input"), categoryCount = 0;

      for (var i = 0; i < inputElems.length; i++) {
        if (inputElems[i].type == "checkbox" && inputElems[i].checked == true){
          categoryCount++;
        }
      }
      return categoryCount;
    }

    function formCheck(_categoryCount) {
      document.getElementById("div_Errors").innerHTML = "";
      document.getElementById("div_Errors").style.display = "none";

      var doct_name = document.form_App_Add.doct_name.value;
      var description = document.form_App_Add.field_Desc.value;

      var errors = [];

      if (doct_name == null || doct_name === "") {
        errors.push(" You must enter a film title!");
      }
      if (_categoryCount < 1) {
        errors.push(" You need to add at least 1 category!");
      }
      if (_categoryCount > 3) {
        errors.push(" You can't choose more than 3 categories!");
      }
      if (description == null || description === "") {
        errors.push(" You must enter description!");
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
  String _username = (String) session.getAttribute("username");
  String _usertype = (String) session.getAttribute("role");

  if (_username == null) {
%>
<div style="color: red" class="div-container-black">
  <i class="fas fa-times-circle"></i> You must be logged-in to view this page!
</div>
<%
  return;
}
else if (_usertype.equalsIgnoreCase("User")) {
%>
<div style="color: red" class="div-container-black">
  <i class="fas fa-times-circle"></i> You must be a staff member to view this page!
</div>
<%
  return;
}
else {
%>
<div id="div_Errors" style="display: none;" class="form form-submit-details-wrong"></div>

<div class="form">
  <div class="form-heading">Add New Appointment <i class="fas fa-film"></i></div>
  <form action="Panel_Add_Appointment" name="form_App_Add" method="POST" onsubmit="return formCheck(checkboxCount())">
    <label>
      <span>Title <span class="required">*</span></span>
      <input type="text" class="input-field" name="doct_name" placeholder="Enter doctor name"/>
    </label>

    <br>
    <label>
      <span>Categories <span class="required">*</span></span>
      <ul class="checkbox-grid">
        <li><input onClick="checkboxCount(); checkboxValueCount(this);" type="checkbox" name="checkbox-stavros" id="checkbox-Stavros" value="Stavros" /><label for="checkbox-Stavros">Stavros Stavrou</label></li>

        <li><input onClick="checkboxCount(); checkboxValueCount(this)" type="checkbox" name="checkbox-maria" id="checkbox-Maria" value="Maria" /><label for="checkbox-Maria">Maria Charitou</label></li>


      </ul>

    </label>

    <br>
    <label>
      <span>Description <span class="required">*</span></span>
      <textarea style="margin-top: 10px" name="field_Desc" class="textarea-field" rows="" cols="" placeholder="Enter film description"></textarea>
    </label>
    <input type="submit" value="Add App"/>

    <input type="hidden" name="hidden_categories_result" id="hidden_categories_result"/>
    <br><br>
  </form>
</div>
<%
  }
%>
</body>
</html>
