<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Registration Form</title>
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
    <h1 align="center"> Add product </h1>

    <ul>
        <%--<li><a href="/">Back --> to Welcome window</a></li>--%>
        <%--<li><a href="/products">Back --> to View all products window</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/">Back --> to Welcome window</a></li>
        <li><a href="${pageContext.request.contextPath}/products">Back --> to View all products window</a></li>
    </ul>

    <c:if test="${showSuccessMsg}">
        <div class="alert alert-success alert-dismissable">
            <strong>Success!</strong> ${successMsg}
        </div>
    </c:if>

    <form class="my-margin-block" action="${pageContext.request.contextPath}/products/add" method="POST">
        <div class="form-group row">
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <label for="inlineFormInputName" class="col-sm-2 col-form-label">Name: </label>
                <input name="name" type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       id="inlineFormInputName"
                       placeholder="type NAME of product . . . ">
            </div>
        </div>

        <div class="form-group row">
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <label for="inlineFormInputDescription" class="col-sm-2 col-form-label">Description: </label>
                <input name="description" type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       id="inlineFormInputDescription"
                       placeholder="type DESCRIPTION of product . . . ">
            </div>
        </div>

        <div class="form-group row">
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <label for="inlineFormInputManufacturer" class="col-sm-2 col-form-label">Manufacturer: </label>
                <input name="manufacturer" type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       id="inlineFormInputManufacturer"
                       placeholder="input MANUFACTURER of product . . . ">
            </div>
        </div>

        <div class="form-group row">
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                <label for="inlineFormInputPrice" class="col-sm-2 col-form-label">Price: </label>
                <input name="price" type="number" class="form-control mb-2 mr-sm-2 mb-sm-0"
                       value="0.0"
                       min="0.0"
                       step="0.1"
                       id="inlineFormInputPrice"
                       placeholder="input PRICE of product . . . ">
            </div>
        </div>

        <%--<div class="form-group">--%>
        <%--<div class="form-check mb-2 mr-sm-2 mb-sm-0">--%>
        <%--<label class="form-check-label">--%>
        <%--<input name="rememberMe" class="form-check-input" type="checkbox"> Remember me--%>
        <%--</label>--%>
        <%--</div>--%>
        <%--</div>--%>

        <div class="form-group ">
            <button type="submit" class="btn btn-primary ">Submit</button>
        </div>


    </form>
</div>
</body>
</html>