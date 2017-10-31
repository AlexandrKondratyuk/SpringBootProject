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
    <%--<li><a href="/products/add">Add product</a></li>--%>
    <li><a href="/training/products/add">Add product</a></li>
    <%--<li><a href="/">Back --> to Welcome window</a></li>--%>
    <li><a href="/training/">Back --> to Welcome window</a></li>
</ul>

<c:if test="${showSuccessMsg}">
    <div class="alert alert-success alert-dismissable">
        <strong>Success!</strong> ${successMsg}
    </div>
</c:if>

<table class="table">
    <thead class="thead-default">
    <tr>
        <th>No</th>
        <th>Name</th>
        <th>Description</th>
        <th>Manufacturer</th>
        <th>Price</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${products}" var="product" varStatus="raw">
        <tr>
            <th scope="row">${raw.count}</th>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td>${product.price}</td>
            <%--<td><a href="products/${product.id}/edit">Edit</a></td>--%>
            <td><a href="${pageContext.request.contextPath}/products/${product.id}/edit/">Edit</a></td>
            <%--<td><a href="products/${product.id}/delete">Delete</a>--%>
            <td><a href="${pageContext.request.contextPath}/products/${product.id}/delete">Delete</a></td>
        </tr>
    </c:forEach>


    </tbody>
</table>
</body>
</html>