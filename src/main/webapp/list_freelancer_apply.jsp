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

        <style>
            .social-link {
                width: 30px;
                height: 30px;
                border: 1px solid #ddd;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #666;
                border-radius: 50%;
                transition: all 0.3s;
                font-size: 0.9rem;
            }

            .social-link:hover, .social-link:focus {
                background: #ddd;
                text-decoration: none;
                color: #555;
            }
        </style>
    </head>

    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
        <c:if test="${sessionScope.LOGIN_USER == NULL || sessionScope.MODE eq 'FREELANCER' }">
            <c:redirect url="HomeController"></c:redirect>
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
                        <button class="btn mb-3" style="padding: 20px; border-radius: 5px" onclick="history.back()">Previous</button>
                        <div class="col-xl-12 col-lg-12 col-md-4 mt-4 mb-4">
                            <div class="row justify-content-between mb-3">
                                <!-- Job Category Listing start -->
                                <!-- single one -->
                                <div class="col-7 count-job font-weight-bold text-right">
                                    <h2>List Freelancers</span>
                                </div>
                                <form class="col-2 text-left" action="FilterFreelancerApplyController" method="GET">                                         
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
                                            <c:if test="${requestScope.SUCCESS_MESSAGE_DENY != NULL}">
                                                <div class="alert alert-danger">
                                                    <center>
                                                        <strong>Not Success!</strong> ${requestScope.SUCCESS_MESSAGE_DENY}
                                                    </center>
                                                </div>
                                            </c:if>
                                            <div class="row">
                                                <c:forEach items="${requestScope.LIST_FREELANCER_APPLY}" var="LF" varStatus="counting">
                                                    <form class="col-4" style="position: relative; margin-bottom: 35px" action="ApproveFreelancerController" method="POST">
                                                        <div class="p-4 h-100 w-100" style="border-radius: 14px; border: 2px solid #007bff">

                                                            <div class="row freelancer border-bottom" style="padding-bottom: 30px; height: 150px">
                                                                <div class="freelancer_img col-4 align-self-center">
                                                                    <img class="border rounded-circle w-100" src="${LF.picture}" alt="${LF.fullName}"/>
                                                                </div>
                                                                <div class="freelancer_info col-8">
                                                                    <div class="freelancer_info_name font-weight-bold text-primary mt-2 mb-1">
                                                                        <span><i class="fas fa-user mr-2"></i>${LF.fullName}</span>
                                                                    </div>
                                                                    <div class="freelancer_info_email font-weight-bold">
                                                                        <span>Apply for Job : </span><br/><span class="text-center text-success"><i class="fas fa-caret-right mr-2"></i>${LF.title}</span>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="row text-center mt-4">
                                                                <div class="col-6">
                                                                    <a href="FreeLancerDetailController?id_freelancer=${LF.id_freelancer}">
                                                                        <button type="button" class="bg-info text-light border-0 p-3" style="cursor: pointer; border-radius: 15px; font-size: 17px; font-weight: 600;">
                                                                            <i class="fas fa-address-card mr-2"></i> Profile
                                                                        </button>
                                                                    </a>
                                                                </div>
                                                                <div class="col-6" >
                                                                    <button type="submit" class="bg-success text-light border-0 p-3" style="cursor: pointer; border-radius: 15px; font-weight: 600;">
                                                                        <i class="fas fa-check-circle mr-2"></i> Approve
                                                                    </button>
                                                                </div> 
                                                            </div>

                                                        </div>
                                                        <input name="id_freelancer" value="${LF.id_freelancer}" type="hidden">
                                                        <input name="id_job" value="${LF.id_job}" type="hidden">
                                                        <%--<c:if test="${LF.note != null}">--%>
                                                        <a class="bg-info text-light border-0" style="position: absolute; top: -6.5%; right: 13%; border: 2px solid black; padding: 8px 20px; border-radius: 8px; cursor: pointer" data-toggle="modal" data-target="#noteModal${counting.count}">
                                                            <i class="fas fa-envelope font-weight-bold"></i>
                                                            <c:if test="${LF.note != null || LF.note.size() > 0}">
                                                                <div class="freelancer_noti"></div>
                                                            </c:if>
                                                            
                                                        </a>
                                                        <%--</c:if>--%>
                                                    </form>

                                                    <div class="modal fade" id="noteModal${counting.count}">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="mb-5 text-center">
                                                                    <div class="bg-white rounded py-5 px-4"><img src="${LF.picture}" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                                                                        <h5 class="mb-0">${LF.fullName}</h5><span class="small text-uppercase text-muted">Send you a message</span>
                                                                        <p class="text-left border rounded mx-5 mb-0 mt-4 p-2">${LF.note}</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
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
