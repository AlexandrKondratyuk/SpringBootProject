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

        .img-responsive {
            height: 50%;
        }

        .center-block {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>

<body>

<h1 align="center" class="my-header">${message}</h1>

<div class="container-fluide">
    <div class="row">
        <div class="col-md-6">
            <%--<a href="/products">--%>
            <a href="${pageContext.request.contextPath}/products">
                <img src="<c:url value="${pageContext.request.contextPath}/../resourses/images/products.png"/>"
                     class="img-responsive center-block"
                     alt="Img products">
            </a>
        </div>
        <div class="col-md-6">
            <%--<a href="/users">--%>
            <a href="${pageContext.request.contextPath}/users">
                <img src="<c:url value="${pageContext.request.contextPath}/../resourses/images/users.png"   />"
                     class="img-responsive center-block"
                     alt="Img Users">
            </a>
        </div>
    </div>
</div>

</body>

</html>