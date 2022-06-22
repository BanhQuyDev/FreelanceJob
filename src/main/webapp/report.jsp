<%-- 
    Document   : report
    Created on : Jun 21, 2022, 10:17:37 PM
    Author     : Tung Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Content Report</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="report/styles.css" rel="stylesheet">
        <script src="//cdn.ckeditor.com/4.19.0/basic/ckeditor.js"></script>
    </head>

    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="be-comment-block">
                <c:set var="r" value="${requestScope.THIS_JOB}"/>
                <h1 style="text-align:center; background-color:orange; padding: 20px">${r.jobReport.title}</h1>
                <h1 class="comments-title">Reports (${r.numOfReport})</h1>
                <c:forEach var="report" items="${requestScope.LIST_REPORT}">
                    <div class="be-comment">
                        <div class="be-img-comment">
                            <a href="#">
                                <img src="${report.avatar_user_report}" alt="" class="be-ava-comment">
                            </a>
                        </div>
                        <div class="be-comment-content">

                            <span class="be-comment-name">
                                <a href="#">${report.fullname_user_report}</a>
                            </span>
                            <span class="be-comment-time">
                                <i class="fa fa-clock-o"></i>
                                ${report.create_date}
                            </span>

                            <p class="be-comment-text" readonly="">
                                ${report.content_report}
                            </p>
                        </div>
                    </div>
                </c:forEach>
                <a href="GetAllReport" class="btn btn-success pull-right">BACK</a>
            </div>



        </div>
    </div>

</body>

</html>