<%-- 
    Document   : file_management
    Created on : Jul 6, 2022, 12:58:48 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body style="background-image: url('assets/img/hero/Background_Update_Job.jpg'); background-repeat: no-repeat; background-size: cover; padding: 50px 0px; cursive">
        <div class="container mt-5">
            <h1 class="text-center m-4 text-white">Job Name</h1>
            <table class="table border">
                <thead>
                    <tr>
                        <th class="text-white text-center" scope="col">STT</th>
                        <th class="text-white text-center" scope="col">Url File</th>
                        <th class="text-white text-center" scope="col">Download</th>
                        <th class="text-white text-center" scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="file" items="${requestScope.LIST_FILE}" varStatus="count">
                        <tr>
                            <th class="text-white text-center"scope="row">${count.count}</th>
                            <td class="text-white text-center">${file.urlS3}</td>
                            <td class="text-white text-center" ><a class="btn btn-primary" href="${file.urlS3}" target="_blank">Download</a></td>
                            <td class="text-white text-center"><a class="btn btn-danger" href="#">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</html>
