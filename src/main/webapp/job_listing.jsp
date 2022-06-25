<%-- 
    Document   : job_listing
    Created on : May 28, 2022, 10:42:37 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Freelance Job </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

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
       <link rel="stylesheet" href="assets/css/header_notifications.css"/>
    </head>

    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
            <main>
                <!-- Hero Area Start-->
                <div class="slider-area ">
                    <div class="single-slider section-overly slider-height2 d-flex align-items-center"
                         data-background="assets/img/hero/about.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap text-center">
                                        <h2>Get your job</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Hero Area End -->
                <!-- Job List Area Start -->
                <div class="job-listing-area pt-120 pb-120">
                    <div class="container">
                        <div class="row">
                            <!-- Left content -->
                            <div class="col-xl-3 col-lg-3 col-md-4">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="small-section-tittle2 mb-45">
                                            <div class="ion">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                    width="20px" height="12px">
                                                <path fill-rule="evenodd" fill="rgb(27, 207, 107)"
                                                      d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z"/>
                                                </svg>
                                            </div>
                                            <h4>Filter Jobs</h4>
                                        </div>
                                    </div>
                                </div>
                                <!-- Job Category Listing start -->
                                <div class="job-category-listing mb-50">
                                    <!-- single one -->
                                    <form action="JobListingController" method="POST">
                                        <div class="single-listing">
                                            <div class="small-section-tittle2">
                                                <h4>By Major</h4>
                                            </div>
                                            <!-- Select job items start -->
                                        <c:set var="selectedMajor" value="${param.selectedMajor}"/>
                                        <select name="selectedMajor" onchange="this.form.submit()">
                                            <c:choose>
                                                <c:when test="${empty selectedMajor}">
                                                    <option value="All Major">All Major</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="all" value="All Major"/>
                                                    <c:if test="${selectedMajor ne all}">
                                                        <option value="${selectedMajor}">${selectedMajor}</option>
                                                        <option value="All Major">All Major</option>
                                                    </c:if>
                                                    <c:if test="${selectedMajor eq all}">
                                                        <option value="${selectedMajor}">${selectedMajor}</option>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:forEach items="${requestScope.LIST_MAJOR}" var="c">
                                                <c:if test="${c.major_name ne selectedMajor}">
                                                    <option value="${c.major_name}">${c.major_name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>

                                        <!--  Select job items End-->
                                    </div>
                                </form>
                            </div>
                            <!-- Job Category Listing End -->
                        </div>
                        <!-- Right content -->
                        <div class="col-xl-9 col-lg-9 col-md-8">
                            <!-- Featured_job_start -->
                            <section class="featured-job-area">
                                <div class="container">
                                    <!-- Count of Job list Start -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="count-job mb-35 font-weight-bold text-monospace">
                                                <span>${requestScope.LIST_JOB.size()} Job(s) found</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Count of Job list End -->
                                    <!-- single-job-content -->
                                    <c:forEach var="job" items="${requestScope.LIST_JOB}">
                                        <div class="single-job-items mb-30">
                                            <div class="job-items">
                                                <div class="company-img">
                                                    <a href="JobDetailController?jobId=${job.idJob}"
                                                       ><img style="width: 85px" src="assets/img/icon/job-list.png" alt=""
                                                          /></a>
                                                </div>
                                                <div class="job-tittle">
                                                    <a href="JobDetailController?jobId=${job.idJob}"><h4>${job.title}</h4></a>
                                                    <ul>
                                                        <li style="margin-right: 40px!important;">${job.nameEmployer}</li>
                                                        <li><i class="fa-solid fa-business-time"></i>${job.showDuration(job.duration)} day(s)</li>
                                                            <c:set var="salary" value="${job.salary}"/>
                                                        <li>${job.showPrice(salary)} VNĐ</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="items-link f-right">
                                                <c:choose>
                                                    <c:when test="${job.nameEmployer != sessionScope.LOGIN_USER.name && sessionScope.MODE != 'EMPLOYER'}">
                                                        <c:if test="${job.jobApplication != 0}">
                                                            <a style="pointer-events: none; background-color: #f2722970">Processsing...</a>
                                                        </c:if>
                                                        <c:if test="${job.jobApplication == 0}">
                                                            <a href="JobDetailController?jobId=${job.idJob}">Apply</a>
                                                        </c:if>
                                                    </c:when>
                                                    <c:when test="${job.nameEmployer == sessionScope.LOGIN_USER.name && sessionScope.MODE != 'EMPLOYER'}">
                                                        <div style="cursor: pointer;" tabindex="0" data-toggle="popover" data-trigger="focus" data-placement="right" data-animation="true" title="You can't apply Your Own Job" data-content="Please apply another">
                                                            <a>Apply</a>
                                                        </div>                
                                                    </c:when>
                                                    <c:when test="${sessionScope.MODE == 'EMPLOYER'}">
                                                        <div style="cursor: pointer;" tabindex="0" data-toggle="popover" data-trigger="focus" data-placement="right" data-animation="true" title="You can' apply As An Employer" data-content="Please change your mode">
                                                            <a>Apply</a>
                                                        </div>
                                                    </c:when>
                                                </c:choose>                        
                                                <span> <strong> ${job.freelancerQuantity} </strong> Freelancer(s) Applied !!</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </section>
                            <!-- Featured_job_end -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Job List Area End -->
            <!--Pagination Start  -->
            <div class="pagination-area pb-115 text-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="single-wrap d-flex justify-content-center">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-start">
                                        <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                        <li class="page-item"><a class="page-link" href="#">02</a></li>
                                        <li class="page-item"><a class="page-link" href="#">03</a></li>
                                        <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Pagination End  -->
        </main>
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
        <script
            src="https://kit.fontawesome.com/b36bcbb61e.js"
            crossorigin="anonymous"
        ></script>
        <script>
                                            $(function () {
                                                $('[data-toggle="popover"]').popover(),
                                                        $('.popover-dismiss').popover({
                                                    trigger: 'focus'
                                                })
                                            })
        </script>
    </body>
</html>
