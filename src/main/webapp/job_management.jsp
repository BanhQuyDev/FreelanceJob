<%-- 
    Document   : history
    Created on : Jun 4, 2022, 8:12:56 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

        <<link rel="stylesheet" href="./job-management/job-management.css"/>

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
                <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/job_application_carousel.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2>Job Application</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div style="background: #ddd ; padding: 50px 0px">
                <div class="container bootstrap snippets bootdey" >
                    <section id="news" class="bg-white padding-top-bottom" style="background: #ddd !important;">
                        <div class="container snippets bootdey">
                            <div class="timeline">
                                <div class="date-title">
                                    <span>Timeline</span>
                                </div>
                                <div class="row">
                                <c:forEach var="job" items="${requestScope.LIST_APPLIED_JOB}" varStatus="counting">
                                    <c:set var="date" value="${fn:split(job.createDateJobApplication, '-')}"/>
                                    <c:if test="${counting.count % 2 != 0}">
                                        <div class="col-sm-6 news-item">
                                            <c:if test="${job.statusJobApplication == 1}">
                                                <div class="news-content news-done">
                                                    <div class="date">
                                                        <p>${date[2]}/${date[1]}</p>
                                                        <small>${date[0]}</small>
                                                    </div>
                                                    <h2 class="news-title"> ${job.title} <i style="" class="fas fa-check-circle"></i></h2>
                                                        <c:if test="${job.executionTimeJobApplication < 0}">
                                                        <h5><i class="far fa-lightbulb"></i> This job will start in <strong>${job.showDuration(Math.floor((job.executionTimeJobApplication*(-1))/24))}</strong> day(s)</h5>
                                                        <p>Prepare yourself</p>
                                                    </c:if>
                                                    <c:if test="${Math.floor(job.executionTimeJobApplication/24) == 0}">
                                                        <h5><i class="fas fa-map-marker-alt"></i> You are doing this job !!</h5>
                                                        <p>Have a nice day at work</p>
                                                    </c:if>
                                                    <c:if test="${Math.floor(job.executionTimeJobApplication/24) > 0}">
                                                        <h5><i class="fas fa-lightbulb"></i> You have been working for <strong>${job.showDuration(Math.floor(job.executionTimeJobApplication/24))}</strong> day(s)</h5>
                                                        <p>Keep going !!</p>
                                                    </c:if>
                                                    <div style="text-align: center; margin-left: 60%;">
                                                        <label style="text-shadow: 3px 3px 10px #fff; font-size: 19px; cursor: pointer" class="read-more" data-toggle="modal" data-target="#modalVupro${counting.count}">More detail <i class="far fa-arrow-alt-circle-right"></i></label>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${job.statusJobApplication == 0}">
                                                <div class="news-content news-doing">
                                                    <div class="date">
                                                        <p>${date[2]}/${date[1]}</p>
                                                        <small>${date[0]}</small>
                                                    </div>
                                                    <h2 class="news-title">${job.title} <i class="far fa-check-circle"></i></h2>
                                                        <c:if test="${Math.floor(job.appliedTimeJobApplication/24) != 0}">
                                                        <h5><i class="fas fa-caret-right"></i> You have applied this job for <strong>${job.showDuration(Math.floor(job.appliedTimeJobApplication/24))}</strong> day(s).</h5>
                                                        <p>Please wait for Approval ...</p>
                                                    </c:if>
                                                    <c:if test="${Math.floor(job.appliedTimeJobApplication/24) == 0}">
                                                        <h5><i class="fas fa-caret-right"></i> You have just applied for this job !</h5>
                                                        <p>Please wait for Approval ...</p>
                                                    </c:if>
                                                    <div style="text-align: center; margin-left: 60%;">
                                                        <label style="text-shadow: 3px 3px 10px #fff; font-size: 19px; cursor: pointer" class="read-more" data-toggle="modal" data-target="#modalVupro${counting.count}">More detail <i class="far fa-arrow-alt-circle-right"></i></label>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:if>
                                    <c:if test="${counting.count % 2 == 0}">
                                        <div class="col-sm-6 news-item right">
                                            <c:if test="${job.statusJobApplication == 1}">
                                                <div class="news-content news-done">
                                                    <div class="date">
                                                        <p>${date[2]}/${date[1]}</p>
                                                        <small>${date[0]}</small>
                                                    </div>
                                                    <h2 class="news-title">${job.title} <i style="" class="fas fa-check-circle"></i></h2>
                                                        <c:if test="${job.executionTimeJobApplication < 0}">
                                                        <h5><i class="far fa-lightbulb"></i> This job will start in <strong>${job.showDuration(Math.floor((job.executionTimeJobApplication*(-1))/24))}</strong> day(s)</h5>
                                                        <p>Prepare yourself</p>
                                                    </c:if>
                                                    <c:if test="${Math.floor(job.executionTimeJobApplication/24) == 0}">
                                                        <h5><i class="fas fa-map-marker-alt"></i> You are doing this job !!</h5>
                                                        <p>Have a nice day at work </p>
                                                    </c:if>
                                                    <c:if test="${Math.floor(job.executionTimeJobApplication/24) > 0}">
                                                        <h5><i class="fas fa-lightbulb"></i> You have been working for <strong>${job.showDuration(Math.floor(job.executionTimeJobApplication/24))}</strong> day(s)</h5>
                                                        <p>Keep going !!</p>
                                                    </c:if>
                                                    <div style="text-align: center; margin-left: 60%;">
                                                        <label style="text-shadow: 3px 3px 10px #fff; font-size: 19px; cursor: pointer" class="read-more" data-toggle="modal" data-target="#modalVupro${counting.count}">More detail <i class="far fa-arrow-alt-circle-right"></i></label>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${job.statusJobApplication == 0}">
                                                <div class="news-content news-doing">
                                                    <div class="date">
                                                        <p>${date[2]}/${date[1]}</p>
                                                        <small>${date[0]}</small>
                                                    </div>
                                                    <h2 class="news-title">${job.title} <i class="far fa-check-circle"></i></h2>
                                                        <c:if test="${Math.floor(job.appliedTimeJobApplication/24) != 0}">
                                                        <h5><i class="fas fa-caret-right"></i> You have applied this job for <strong>${job.showDuration(Math.floor(job.appliedTimeJobApplication/24))}</strong> day(s).</h5>
                                                        <p>Please wait for Approval ...</p>
                                                    </c:if>
                                                    <c:if test="${Math.floor(job.appliedTimeJobApplication/24) == 0}">
                                                        <h5><i class="fas fa-caret-right"></i> You have just applied for this job !</h5>
                                                        <p>Please wait for Approval ...</p>
                                                    </c:if>                                                  
                                                    <div style="text-align: center; margin-left: 60%;">
                                                        <label style="text-shadow: 3px 3px 10px #fff; font-size: 19px; cursor: pointer" class="read-more" data-toggle="modal" data-target="#modalVupro${counting.count}">More detail <i class="far fa-arrow-alt-circle-right"></i></label>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <c:forEach var="job" items="${requestScope.LIST_APPLIED_JOB}" varStatus="counting">
            <div class="modal fade" id="modalVupro${counting.count}">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <!-- <div class="modal-content"> -->
                    <div class="box">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <div class="cookiesContent content" id="cookiesPopup">
                            <img src="https://cdn-icons-png.flaticon.com/512/1047/1047711.png" alt="cookies-img" />
                            <h2 class="mt-4 mb-4 typing-demo"><strong>${job.title}</strong></h2>
                            <p class="row" style="margin-bottom: 0">
                                <label class="col-7"><strong>Salary :</strong> ${job.showPrice(job.salary)} VNĐ</label>
                                <label class="col-5"><strong>Duration :</strong> ${job.showDuration(job.duration)} day(s)</label>
                            </p>
                            <p><strong>Description :</strong> ${job.description}</p>
                            <p><strong>Major :</strong> ${job.nameMajor}</p>
                            <p>Wedmproving user experience, analytics and marketing.oris!</p>
                            <p>Wedmproving user experience, analytics and marketing.oris!</p>

                        </div>
                    </div>
                    <!-- </div> -->
                </div>
            </div>
        </c:forEach>


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
