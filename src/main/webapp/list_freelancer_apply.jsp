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
    </head>

    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
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
                <div class="job-listing-area pt-120 pb-120">
                    <div class="container">
                        <div class="row">
                            <!-- Left content -->
                            <div class="col-xl-2 col-lg-2 col-md-4">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="small-section-tittle2 mb-45">
                                            <div class="ion"> <svg 
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                    width="20px" height="12px">
                                                <path fill-rule="evenodd"  fill="rgb(27, 207, 107)"
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
                                    <form action="JobListingController" method="GET">
                                        <div class="single-listing">
                                            <div class="small-section-tittle2">
                                                <!--                                                <button style="padding: 20px; margin-left: 60%; border-radius: 8px" class="btn btn-info" type="submit">Filter</button>-->
                                                <h4>By Job</h4>
                                            </div>
                                            <!-- Select job items start -->
                                            <select name="selectedMajor" onchange="this.form.submit()">
                                            <%--<c:choose>--%>
                                            <%--<c:when test="${!empty requestScope.SELECTED_MAJOR}">--%>
                                            <option value="All">All Job</option>
                                            <%--</c:when>--%>
                                            <%--<c:otherwise>--%>
                                                <!--<option value="${requestScope.SELECTED_MAJOR}">${requestScope.SELECTED_MAJOR}</option>-->
                                            <%--</c:otherwise>--%>
                                            <%--</c:choose>--%>
                                            <c:forEach var="major" items="${requestScope.LIST_MAJOR}">
                                                <option value="${major.id_major.trim()}">${major.id_major}</option>
                                            </c:forEach>
                                        </select>

                                        <!--  Select job items End-->   
                                    </div>
                                </form>
                            </div>
                            <!-- Job Category Listing End -->
                        </div>
                        <!-- Right content -->
                        <div class="col-xl-10 col-lg-10 col-md-8">
                            <!-- Featured_job_start -->
                            <section class="featured-job-area">
                                <div class="container">
                                    <!-- Count of Job list Start -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="count-job mb-35 font-weight-bold text-monospace">
                                                <span>${requestScope.LIST_JOB.size()} List Freelancers:</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Count of Job list End -->
                                    <!-- single-job-content -->
                                    <div  style="display: grid; grid-template-columns:repeat(3, 1fr); gap: 10px">
                                        <c:forEach items="${requestScope.LIST_FREELANCER_APPLY}" var="LF">
                                            <div class="w-100 h-100 p-3" style="border-radius: 8px; border: 1px solid #fb246a">
                                                <div class="freelancer d-flex border-bottom" style="gap: 10px; padding-bottom: 10px;">
                                                    <div class="freelancer_img ">
                                                        <img class="border rounded-circle" style="object-fit: cover; flex-shrink: 0" src=${LF.picture} alt=${LF.fullName}/>
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
                                                <div class="text-center mt-4">
                                                    <a class="btn btn-outline-success mb-2 p-4 border" style="border-radius: 16px" href="FreeLancerDetailController?id_freelancer=${LF.id_freelancer}">View Profile</a>
                                                </div>
                                                <div style="display: grid; grid-template-columns: repeat(2, 1fr); column-gap: 10px" >

                                                    <div class="text-center mt-4" >
                                                        <a class="btn-outline-success mb-2 border" style="padding: 10px;border-radius: 16px;display: flex;justify-content: center;
}"  href="#">
                                                            <img style="width: 30px; height: 30px; border-radius: 100rem; object-fit: cover" src="https://icon-library.com/images/check-image-icon/check-image-icon-5.jpg" alt="alt"/>
                                                        </a>
                                                    </div>
                                                    <div class="text-center mt-4" >
                                                        <a class="btn-outline-danger mb-2 border" style="padding: 10px;border-radius: 16px;display: flex;justify-content: center;
}"  href="#">
                                                            <img style="width: 30px; height: 30px; border-radius: 100rem; object-fit: cover" src="https://w7.pngwing.com/pngs/349/105/png-transparent-false-error-missing-absent-x-red-cross-letter-circle-gui-thumbnail.png" alt="alt"/>
                                                        </a>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:forEach>

                                    </div>
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
                                        <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li>
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

    </body>
</html>
