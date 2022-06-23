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
        <title>Post Job Management</title>
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
        <link rel="stylesheet" href="assets/css/header_notification.css"/>
    </head>

    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
            <main>
                <!-- Hero Area Start-->
                <div class="slider-area">
                    <div class="single-slider section-overly slider-height2 d-flex align-items-center"
                         data-background="assets/img/hero/about.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap text-center">
                                        <h2>Post Job Management</h2>
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
                                                    width="20px" height="12px">
                                                <path fill-rule="evenodd" fill="rgb(27, 207, 107)"
                                                      d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z"/>
                                                </svg>
                                            </div>
                                            <h4>Filter Posts</h4>
                                        </div>
                                    </div>
                                </div>

                                <!-- Job Category Listing start -->
                                <form action="RenderJobPostController" method="GET">
                                    <div class="job-category-listing mb-50" style="padding-bottom: 5em">
                                        <!-- single one -->
                                        <div class="single-listing">
                                            <div class="small-section-tittle2">
                                                <h4>By Major</h4>
                                            </div>
                                            <input type="hidden" name="position" value="job_management"/>
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
                                </div>

                                <div class="job-category-listing mb-50">
                                    <div class="single-listing">
                                        <div class="small-section-tittle2">
                                            <h4>By Status</h4>
                                        </div>
                                        <!-- Status CheckBox Start -->
                                        <c:set var="status" value="${requestScope.LIST_STATUS}"/>
                                        <c:set var="selectedStatus" value="${requestScope.SELECTED_STATUS}"/>
                                        <c:forEach begin="0" end="${status.size() - 1}" var="i">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="chkStatus" value="${status.get(i).getId_status()}" onchange="this.form.submit()" id="flexCheckDefault" ${selectedStatus[i] ? "checked":""}>
                                                <label class="form-check-label" for="flexCheckDefault">${status.get(i).getStatus_name()}</label>
                                            </div>
                                        </c:forEach>
                                        <!--  Status CheckBox End -->
                                    </div>
                                </div>
                            </form>
                            <!-- Job Category Listing End -->
                        </div>
                        <!-- Right content -->
                        <div class="col-xl-9 col-lg-9 col-md-8">
                            <!-- Featured_job_start -->
                            <section class="featured-job-area">
                                <div class="container">
                                    <div class="row">
                                        <!--Card Start-->
                                        <c:set var="post_list" value="${requestScope.POST_LIST}"/>
                                        <c:forEach var="p" items="${post_list}">
                                            <a href="#">
                                                <div class="col-md-4">
                                                    <div class="card p-3 mb-2" style="border-radius: 10px;">
                                                        <div class="d-flex justify-content-between">
                                                            <div class="d-flex flex-row align-items-center">
                                                                <div class="icon"><i class="bx bxl-mailchimp"></i></div>
                                                                <div class="ms-2 c-details">
                                                                    <h6 class="mb-0">${p.nameMajor}</h6>
                                                                </div>
                                                            </div>
                                                            <c:set var="status" value="${p.status}"/>
                                                            <c:choose>
                                                                <c:when test="${status eq 'Posted'}">
                                                                    <div class="badge">
                                                                        <span style="background-color: #c2ffb9; width: 60px; height: 25px; padding-bottom: 3px; border-radius: 5px; display: flex; color: #02bf00; justify-content: center; align-items: center">${status}</span>
                                                                    </div>
                                                                </c:when>
                                                                <c:when test="${status eq 'Spam'}">
                                                                    <div class="badge">
                                                                        <span style="background-color: #ffd4ba; width: 60px; height: 25px; padding-bottom: 3px; border-radius: 5px; display: flex; color: #ff3d25; justify-content: center; align-items: center">${status}</span>
                                                                    </div>
                                                                </c:when>
                                                                <c:when test="${status eq 'Updated'}">
                                                                    <div class="badge">
                                                                        <span style="background-color: #fffe91; width: 60px; height: 25px; padding-bottom: 3px; border-radius: 5px; display: flex; color: #cccb00; justify-content: center; align-items: center">${status}</span>
                                                                    </div>
                                                                </c:when>
                                                                <c:when test="${status eq 'Applied'}">
                                                                    <div class="badge">
                                                                        <span style="background-color: #008cffcf; width: 60px; height: 25px; padding-bottom: 3px; border-radius: 5px; display: flex; justify-content: center; align-items: center">${status}</span>
                                                                    </div>
                                                                </c:when>
                                                            </c:choose>

                                                        </div>
                                                        <div class="mt-5 text-truncate">
                                                            <a href="UpdateJobController?id_job=${p.idJob}&action=render">
                                                                <h5 class="heading"><strong>${p.title}</strong></h5>
                                                            </a>
                                                            <c:choose>
                                                                <c:when test="${status eq 'Applied'}">
                                                                    <div class="mt-5">
                                                                        <a style="color: #1a8df4;" href="HistoryController?selectedContractStatus=2">
                                                                            <span class="text1 font-weight-bold">Go Contract</span>
                                                                        </a>
                                                                    </div>
                                                                </c:when>
                                                                <c:when test="${status eq 'Spam'}">
                                                                    <div class="mt-5">
                                                                        <a class="text-danger" href="UpdateJobController?id_job=${p.idJob}&action=render">
                                                                            <span class="text1 font-weight-bold">Update Your Post</span>
                                                                        </a>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="mt-5">
                                                                        <a class="text-success" href="FilterFreelancerApplyController?selectedJob=${p.idJob}">
                                                                            <span class="text1 font-weight-bold">${p.freelancerQuantity} Applied</span>
                                                                        </a>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </c:forEach>
                                        <!--Card End-->
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
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(400, 0).slideUp(400, function () {
                    $(this).remove();
                });
            }, 3000)
        </script> 

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
