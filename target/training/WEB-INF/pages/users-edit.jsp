<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Edit user Form</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
            integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
            crossorigin="anonymous"></script>

    <style>
        .my-margin-block {
            margin: 10px;
        }

    </style>

</head>

<body>
<div class="container">
    <h1 align="center"> Edit User </h1>

    <ul>
        <li><a href="${pageContext.request.contextPath}/">Back --> to Welcome window</a></li>
        <li><a href="${pageContext.request.contextPath}/users">Back --> to View all users window</a></li>
    </ul>

    <%--<div class="alert alert-success alert-dismissable ${showSuccessAlert}">--%>
        <%--<strong>Success!</strong> ${successMsg}--%>
    <%--</div>--%>

    <c:if test="${showSuccessMsg}">
        <div class="alert alert-success alert-dismissable">
            <strong>Success!</strong> ${successMsg}
        </div>
    </c:if>

    <form class="my-margin-block" action="${pageContext.request.contextPath}/users/${user.id}/edit" method="post" >
        <div class="form-group row">
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <%--<div class="input-group-addon">First Name:</div>--%>
                <label for="inlineFormInputFirstName" class="col-sm-2 col-form-label">First Name: </label>
                <input name="firstName" type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       id="inlineFormInputFirstName"
                       placeholder="your first name.." value="${user.firstName}">
            </div>
        </div>

        <div class="form-group row">
            <%--<label>Last Name: </label>--%>
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <label for="inlineFormInputLastName" class="col-sm-2 col-form-label">Last Name: </label>
                <input name="lastName" type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       id="inlineFormInputLastName"
                       placeholder="your last name.." value="${user.lastName}">
            </div>
        </div>

        <div class="form-group row">
            <%--<label>Last Name: </label>--%>
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <label for="inlineFormInputGroupEmail" class="col-sm-2 col-form-label">E-mail: </label>
                <input name="email" type="email" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       id="inlineFormInputGroupEmail"
                       placeholder="your email.." value="${user.email}">
            </div>
        </div>

        <div class="form-group row">
            <%--<label>Last Name: </label>--%>
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <label for="inlineFormInputGroupNickname" class="col-sm-2 col-form-label">Nickname: </label>
                <input name="nickname" type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       id="inlineFormInputGroupNickname"
                       placeholder="your nickname.." value="${user.nickname}">
            </div>
        </div>

        <div class="form-group ">
            <button type="submit" class="btn btn-primary ">Edit </button>
        </div>


    </form>
</div>
</body>
</html>