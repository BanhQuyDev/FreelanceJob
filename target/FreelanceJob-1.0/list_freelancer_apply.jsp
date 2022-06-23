<%-- 
    Document   : job_listing
    Created on : May 28, 2022, 10:42:37 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <c:if test="${sessionScope.LOGIN_USER == NULL || sessionScope.MODE eq 'FREELANCER' }">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <main>
            <!-- Hero Area Start-->
            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
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
            <div class="job-listing-area pt-50 pb-120">
                <div class="container">
                    <div class="row">
                        <!-- Left content -->
                        <div class="col-xl-12 col-lg-12 col-md-4">
                            <button class="btn" style="padding: 18px 20px; border-radius: 5px" onclick="history.back()">Previous</button>
                            <div class="row mb-3" style="display: flex; flex-direction: row; justify-content: left; align-items: center">
                                <!-- Job Category Listing start -->
                                <!-- single one -->
                                <div class="count-job font-weight-bold text-monospace">
                                    <span>List Freelancers:</span>
                                </div>
                                <form action="FilterFreelancerApplyController" method="GET">                                         
                                    <!-- Select job items start -->
                                    <select name="selectedJob" onchange="this.form.submit()">
                                        <option value="0">All Job</option>                   
                                        <c:forEach var="job" items="${sessionScope.LIST_JOB_EMPLOYEER}">
                                            <option ${job.idJob == requestScope.JOB_SELECTED ? "selected":""} value="${job.idJob}">${job.title}</option>
                                        </c:forEach>
                                    </select>

                                    <!--  Select job items End-->   
                                </form>

                                <!-- Job Category Listing End -->
                            </div>
                        </div>
                        <!-- Right content -->
                        <div class="col-xl-12 col-lg-12 col-md-8">
                            <!-- Featured_job_start -->
                            <section class="featured-job-area">
                                <div class="container">
                                    <!-- Count of Job list Start -->

                                    <!-- Count of Job list End -->
                                    <!-- single-job-content -->
                                    <c:choose>
                                        <c:when test="${requestScope.LIST_FREELANCER_APPLY.size() == 0}">
                                            <div class="text-center">
                                                <span class="text-danger font-weight-bold">Empty List</span>
                                            </div>
                                        </c:when>
                                        <c:when test="${requestScope.LIST_FREELANCER_APPLY != NULL}">
                                            <c:if test="${requestScope.SUCCESS_MESSAGE_APPROVE != NULL}">
                                                <div class="alert alert-success">
                                                    <center>
                                                        <strong>Success!</strong> ${requestScope.SUCCESS_MESSAGE_APPROVE}
                                                    </center>
                                                </div>
                                            </c:if>
                                            <div  style="display: grid; grid-template-columns:repeat(3, 1fr); gap: 10px">
                                                <c:forEach items="${requestScope.LIST_FREELANCER_APPLY}" var="LF">
                                                    <form action="ApproveFreelancerController" method="POST">
                                                        <div class="w-100 h-100 p-3" style="border-radius: 8px; border: 1px solid #007bff">
                                                            <div class="freelancer d-flex border-bottom" style="gap: 10px; padding-bottom: 10px;">
                                                                <div class="freelancer_img ">
                                                                    <img class="border rounded-circle" style="object-fit: cover; flex-shrink: 0" src="${LF.picture != null ? LF.picture : 
                                                                                               'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="${LF.fullName}"/>
                                                                </div>
                                                                <div class="freelancer_info d-flex flex-column" style="row-gap: 20px;">
                                                                    <div class="freelancer_info_name font-weight-bold text-primary">
                                                                        <span>${LF.fullName}</span>
                                                                    </div>
                                                                    <div class="freelancer_info_email font-weight-bold" style="color: #FAC213">
                                                                        <span>${LF.email}</span>
                                                                    </div>
                                                                    <div class="freelancer_info_email font-weight-normal font-weight-bold d-flex flex-column">
                                                                        <span style="outline-color: #0063FF">Apply for Job:</span>
                                                                        <a class="text-center text-success" href="#">${LF.title}</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex">
                                                                <div class="text-center mt-4">
                                                                    <a class="btn btn-outline-primary mb-2 p-4 border" style="border-radius: 16px" href="FreeLancerDetailController?id_freelancer=${LF.id_freelancer}">View Profile</a>
                                                                </div>
                                                                <div class="text-center mt-4 mx-auto" >
                                                                    <button type="submit"  class="btn-outline-success mb-2 border" style="padding: 10px;border-radius: 16px;display: flex;justify-content: center; cursor: pointer; align-items: center">
                                                                        <img style="width: 30px; height: 30px; border-radius: 100rem; object-fit: cover; margin-right: 10px" src="https://icon-library.com/images/check-image-icon/check-image-icon-5.jpg" alt="alt"/>
                                                                        Approve
                                                                    </button>
                                                                </div> 
                                                            </div>

                                                        </div>
                                                        <input name="id_freelancer" value="${LF.id_freelancer}" type="hidden">
                                                        <input name="id_job" value="${LF.id_job}" type="hidden">
                                                    </form>
                                                </c:forEach>

                                            </div>
                                        </c:when>
                                    </c:choose>

                                </div>
                            </section>
                            <!-- Featured_job_end -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Job List Area End -->
            <!--Pagination Start  -->
            <!--            <div class="pagination-area pb-115 text-center">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="single-wrap d-flex justify-content-center">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-start">
                                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                                    <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
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
        <script>
                                        window.setTimeout(function () {
                                            $(".alert").fadeTo(400, 0).slideUp(400, function () {
                                                $(this).remove();
                                            });
                                        }, 3000);
        </script>
    </body>
</html>
