<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
            integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
            crossorigin="anonymous"></script>

    <style>
        .my-margin-block {
            margin: 10px;
        }

        .my-header {
            color: black;
        }

    </style>
</head>
<body>
<h1 align="center" class="my-header">${message}</h1>

<ul>
    <li><a href="${pageContext.request.contextPath}/users/add">Add user</a></li>
    <li><a href="${pageContext.request.contextPath}/">Back --> to Welcome window</a></li>
</ul>

<c:if test="${showSuccessMsg}">
    <div class="alert alert-success alert-dismissable">
        <strong>Success!</strong> ${successMsg}
    </div>
</c:if>

<table class="table">
    <thead class="thead-default">
    <tr>
        <th>#</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>E-mail</th>
        <th>Nickname</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${users}" var="user" varStatus="raw">
        <tr>
            <th scope="row">${raw.count}</th>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.email}</td>
            <td>${user.nickname}</td>
            <td><a href="${pageContext.request.contextPath}/users/${user.id}/edit">Edit</a></td>
            <td><a href="${pageContext.request.contextPath}/users/${user.id}/delete">Delete</a>
            </td>
        </tr>
    </c:forEach>


    <%--<c:forEach items="users" var="user" varStatus="raw">--%>
    <%--<tr>--%>
    <%--<th scope="row">${raw.count}</th>--%>
    <%--<td>${user.getFirstName()}</td>--%>
    <%--<td>${user.getLastName()}</td>--%>
    <%--<td>${user.getUsername()}</td>--%>
    <%--</tr>--%>
    <%--</c:forEach>--%>

    </tbody>
</table>
</body>
</html>