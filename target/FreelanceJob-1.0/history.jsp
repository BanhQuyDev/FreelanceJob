<%-- 
    Document   : history
    Created on : Jun 4, 2022, 8:12:56 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Freelance Job </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="./history/history.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

        <!-- CSS here -->
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
    </head>
    <body>
        <jsp:include page="component/header.jsp"></jsp:include>

            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/history_carousel.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2>All your contract is here </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <%--<c:set var="count" value="${1}"/>--%>
        <div class="timeline">
            <c:forEach var="contract" items="${requestScope.LIST_CONTRACT}" varStatus="counting">
                <c:if test="${counting.count % 2 != 0}">
                    <c:if test="${contract.contract_status == 1}">                
                        <div class="item item_done left">
                            <div class="date">${contract.contract_create_date}</div>
                            <i class="icon fa fa-award"></i>
                            <div class="content">
                                <h2><strong>${contract.contract_job_tittle} <i class="fa-regular fa-bookmark ml-1"></i></strong></h2>
                                <p>
                                    From <b>${contract.contract_employer_name}</b> To <b>${contract.contract_freelancer_name}</b>
                                </p>
                                <h2 class="mt-3 mb-0" style="color: #3a33ff; margin-top: 20px;">
                                    <a class="detail_button" data-toggle="modal" data-target="#job_detail${counting.count}"><span>Details</span> <i class="fa-solid fa-angle-right"></i></a>
                                </h2>
                            </div>
                        </div>    
                    </c:if>
                    <c:if test="${contract.contract_status == 0}">                
                        <div class="item item_doing left">
                            <div class="date">${contract.contract_create_date}</div>
                            <i class="icon fa fa-award"></i>
                            <div class="content">
                                <h2><strong>${contract.contract_job_tittle} <i class="fa-regular fa-bookmark ml-1"></i></strong></h2>
                                <p>
                                    From <b>${contract.contract_employer_name}</b> To <b>${contract.contract_freelancer_name}</b>
                                </p>
                                <h2 class="mt-3 mb-0" style="color: #3a33ff; margin-top: 20px;">
                                    <a class="detail_button" data-toggle="modal" data-target="#job_detail${counting.count}"><span>Details</span> <i class="fa-solid fa-angle-right"></i></a>
                                </h2>
                            </div>
                        </div>    
                    </c:if>
                </c:if>
                <c:if test="${counting.count % 2 == 0}">
                    <c:if test="${contract.contract_status == 0}">
                        <div class="item item_doing right">
                            <div class="date">${contract.contract_create_date}</div>
                            <i class="icon fa fa-gauge-high"></i>
                            <div class="content">
                                <h2><strong>${contract.contract_job_tittle} <i class="fa-regular fa-bookmark ml-1"></i></strong></h2>
                                <p>
                                    From <b>${contract.contract_employer_name}</b> To <b>${contract.contract_freelancer_name}</b>
                                </p>
                                <h2 class="mt-3 mb-0" style="color: #3a33ff; margin-top: 20px;">
                                    <a class="detail_button" data-toggle="modal" data-target="#job_detail${counting.count}"><span>Details</span> <i class="fa-solid fa-angle-right"></i></a>
                                </h2>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${contract.contract_status == 1}">
                        <div class="item item_done right">
                            <div class="date">${contract.contract_create_date}</div>
                            <i class="icon fa fa-gauge-high"></i>
                            <div class="content">
                                <h2><strong>${contract.contract_job_tittle} <i class="fa-regular fa-bookmark ml-1"></i></strong></h2>
                                <p>
                                    From <b>${contract.contract_employer_name}</b> To <b>${contract.contract_freelancer_name}</b>
                                </p>
                                <h2 class="mt-3 mb-0" style="color: #3a33ff; margin-top: 20px;">
                                    <a class="detail_button" data-toggle="modal" data-target="#job_detail${counting.count}"><span>Details</span> <i class="fa-solid fa-angle-right"></i></a>
                                </h2>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </c:forEach>

            <c:forEach var="contractDetail" items="${requestScope.CONTRACT_DETAIL}" varStatus="counting">    
                <div class="modal fade" id="job_detail${counting.count}">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="card rounded-2">
                                <div class="card-img">
                                    <img class="rounded-circle" src="./assets/img/hero/detail_avar.jpg">
                                </div>
                                <div class="card-title mt-2">
                                    <p>${contractDetail.contract_job_tittle}</p>
                                </div>
                                <div class="card-text">
                                    <p><strong>Start Date :</strong> ${contractDetail.contract_create_date}</p>
                                    <p><strong>Description :</strong> ${contractDetail.contract_job_description}</p>
                                    <div class="row justify-content-center">
                                        <p class="col-4" style="margin: 0 53px"><strong>Salary :</strong><br/> ${contractDetail.contract_job_price} VND</p>
                                        <p class="col-4" style="margin: 0 53px"><strong>Duration :</strong><br/> ${contractDetail.contract_job_duration} day(s)</p>
                                    </div>
                                </div>
                                <button class="btn mt-4" data-dismiss="modal">Close</button>     
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>

        <!--        <div class="modal fade" id="job_detail">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="card rounded-2">
                                <div class="card-img">
                                    <img class="rounded-circle" src="./assets/img/hero/detail_avar.jpg">
                                </div>
                                <div class="card-title mt-2">
                                    <p></p>
                                </div>
                                <div class="card-text">
                                    <p>Yay! It's a nice order! <br>It will arrive soon.</p>
                                </div>
                                <button class="btn mt-4" data-dismiss="modal">Close</button>     
                            </div>
                        </div>
                    </div>
                </div>-->



        <jsp:include page="component/footer.jsp"></jsp:include>
        <!-- JS here -->

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
