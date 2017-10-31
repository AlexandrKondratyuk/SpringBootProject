<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<form class="form-inline my-margin-block" action="/add-form" method="post">
    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
        <div class="input-group-addon">Name:</div>
        <input name="name" type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="inlineFormInput">
    </div>

    <%--<label class="sr-only" for="inlineFormInputGroup">Username</label>--%>
    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
        <div class="input-group-addon">Username:</div>
        <input name="username" type="text" class="form-control" id="inlineFormInputGroup"/>
    </div>

    <div class="form-check mb-2 mr-sm-2 mb-sm-0">
        <label class="form-check-label">
            <input name="rememberme" class="form-check-input" type="checkbox"> Remember me
        </label>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>