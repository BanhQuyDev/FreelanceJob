<%-- 
    Document   : report
    Created on : Jun 21, 2022, 10:17:37 PM
    Author     : Tung Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Freelance Job</title>
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="assets/img/logo/logo_freelancer.png"
            />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="report/styles.css" rel="stylesheet">
        <!-- CSS here -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/price_rangs.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/editlogin.css">
        <link rel="stylesheet" href="assets/css/header_notifications.css"/>
    </head>
    <!--assets/img/hero/Background_Report.jpg-->
    <body style="background-color: #ccc;">
        <div class="container">
            <div class="be-comment-block" style="background-color: #f8f9fa45; height: 650px; position: relative">
                <c:set var="r" value="${requestScope.THIS_JOB}"/>

                <h1 style="text-align:center; background-color: orange; padding: 20px; border-radius: 15px; font-weight: 700">${r.jobReport.title}</h1>
                <c:if test="${r.numOfReport > 0}">
                    <h1 class="comments-title mt-5 mb-5" style="font-size: 20px">Total <strong class="text-danger">${r.numOfReport}</strong> Report(s) <i class="far fa-flag text-danger ml-3"></i></h1>
                    </c:if>
                    <c:if test="${r.numOfReport == 0}">
                    <h1 class="comments-title mt-5 mb-5" style="font-size: 20px">Total <strong class="text-success">${r.numOfReport}</strong> Report <i class="far fa-thumbs-up text-success ml-3"></i></h1>
                    </c:if>
                    <c:forEach var="report" items="${requestScope.LIST_REPORT}">
                    <div class="be-comment">
                        <div class="be-img-comment">
                            <a href="#">
                                <img src="${report.avatar_user_report}" alt="" class="be-ava-comment">
                            </a>
                        </div>
                        <div class="be-comment-content">
                            <span class="be-comment-name" style="font-weight: 700; font-size: 18px">
                                <a href="#">${report.fullname_user_report}</a>
                            </span>

                            <c:set var="date" value="${fn:split(report.create_date, ' ')}"/>
                            <span class="be-comment-time" style="color: black; font-size: 20px">
                                <i class="fa fa-clock-o"></i>
                                ${date[0]}
                            </span>

                            <p style="font-size: 18px; line-height: 18px; border: 2px solid #000000; padding: 18px; border-radius: 10px; color: black" class="be-comment-text" readonly="">
                                ${report.content_report}
                            </p>
                        </div>
                    </div>
                </c:forEach>
                <a href="GetAllReport" class="btn btn-info" style="border-radius: 8px; font-size: 15px; position: absolute; bottom: -32px; right: 73px"><i class="fas fa-arrow-alt-circle-left mr-2"></i> Back</a>
            </div>
        </div>
    </div>


    <!-- All JS Custom Plugins Link Here here -->
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Range -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <script src="./assets/js/price_rangs.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

    <!-- Jquery Plugins, main Jquery -->	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
</body>

</html>