<%-- 
    Document   : index
    Created on : May 28, 2022, 10:38:23 AM
    Author     : QUANG HUY
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>FreeLance Job</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="manifest" href="site.webmanifest" />
    <linkss
        rel="shortcut icon"
        type="image/x-icon"
        href="assets/img/favicon.ico"
        />

    <<link rel="stylesheet" href="./home/home.css"/>

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="assets/css/flaticon.css" />
    <link rel="stylesheet" href="assets/css/price_rangs.css" />
    <link rel="stylesheet" href="assets/css/slicknav.css" />
    <link rel="stylesheet" href="assets/css/animate.min.css" />
    <link rel="stylesheet" href="assets/css/magnific-popup.css" />
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="assets/css/themify-icons.css" />
    <link rel="stylesheet" href="assets/css/slick.css" />
    <link rel="stylesheet" href="assets/css/nice-select.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/editlogin.css" />
</head>

<body>
    <c:if test="${sessionScope.TYPE == 'admin'}">
        <c:redirect url="LogoutController"></c:redirect>
    </c:if>
    <jsp:include page="component/header.jsp"></jsp:include>
        <main>
            <!-- slider Area Start-->
            <div class="slider-area">
                <!-- Mobile Menu -->
                <div class="slider-active">
                    <div
                        class="single-slider slider-height d-flex align-items-center"
                        style="
                        background-image: url(assets/img/logo/remote-work-part-2.png);
                        background-position: initial;
                        background-repeat: no-repeat;
                        background-size: cover;
                        min-height: 500px;
                        "
                        ></div>
                </div>
            </div>
            <!-- slider Area End-->
            <!-- Our Services Start -->
            <div class="our-services section-pad-t30">
                <div class="container">
                    <!-- Section Tittle -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-tittle text-center">
                                <span>FEATURED TOURS Packages</span>
                                <h2>Browse Top Categories</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-contnet-center">
                    <c:forEach var="major" items="${requestScope.LIST_MAJOR}">
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-services text-center mb-30">
                                <a href="JobListingController?selectedMajor=${major.major_name}">
                                    <div class="services-ion">
                                        <span ><img style="width: 60%;margin-bottom:10px" src="${major.image_major}"/></span>
                                    </div>                                       
                                    <div class="services-cap">
                                        <h5>${major.id_major}</h5>
                                        <span style="color: #5d5df4">${major.totalJob} job(s)</span><br>
                                        <span>${major.major_name}</span>
                                    </div>
                                </a>                           
                            </div>
                        </div>
                    </c:forEach>                      
                </div>
                <!-- More Btn -->
                <!-- Section Button -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="browse-btn2 text-center mt-50">
                            <a href="JobListingController" class="border-btn2"
                               >Browse All Sectors</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Our Services End -->
        <!-- Featured_job_start -->
        <section class="featured-job-area feature-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>Recent Job</span>
                            <h2>Featured Jobs</h2>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <!-- single-job-content -->
                        <c:forEach var="job" items="${requestScope.LIST_TOP_4_LATEST_JOB}">
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
                                            <li>${job.nameEmployer}</li>
                                            <li><i class="fa-solid fa-business-time"></i>${job.showDuration(job.duration)} day(s)</li>
                                                <c:set var="salary" value="${job.salary}"/>
                                            <li>${job.showPrice(salary)} VNĐ</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="items-link f-right">
                                    <c:choose>
                                        <c:when test="${job.nameEmployer != sessionScope.LOGIN_USER.name && sessionScope.MODE != 'EMPLOYER'}">
                                            <a href="JobDetailController?jobId=${job.idJob}">Apply</a>
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
                </div>
            </div>
        </section>
        <!-- Featured_job_end -->
    </main>
    <jsp:include page="component/footer.jsp"></jsp:include>

    <!-- JS here -->

    <!-- All JS Custom Plugins Link Here here -->
    <script>
        window.setTimeout(function () {
            $(".alert").fadeTo(400, 0).slideUp(400, function () {
                $(this).remove();
            });
        }, 3000)
    </script> 

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
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
