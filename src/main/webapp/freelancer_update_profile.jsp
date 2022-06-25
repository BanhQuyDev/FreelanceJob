<%-- 
    Document   : freelancer_detail
    Created on : May 28, 2022, 10:41:13 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Freelance Job</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="manifest" href="site.webmanifest" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="assets/img/favicon.ico"
            />

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
        <link rel="stylesheet" href="assets/css/header_notifications.css"/>

    </head>
    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
        <c:if test="${sessionScope.LOGIN_USER == NULL}">
            <c:redirect url="HomeController"></c:redirect>
        </c:if>
        <div class="container">
            <div class="main-body p-4 border border-danger mt-5 mb-5" style="border-radius: 8px">
                <!-- Breadcrumb -->
                <nav aria-label="breadcrumb" class="main-breadcrumb">
                    <ol class="breadcrumb" style="background-color: #fb246a">
                        <li class="breadcrumb-item "><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item">
                            <a href="javascript:void(0)">User</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">
                            <a href="freelancer_detail.jsp">User Profile</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Edit User Profile
                        </li>
                    </ol>
                </nav>
                <!-- /Breadcrumb -->

                <div class="row">
                    <form action="UpdateProfileUserController" method="POST" style="width: 100%">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="email" class="form-label font-weight-bold">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${sessionScope.LOGIN_USER.email}"
                                           readonly=""> 
                                </div>
                                <div class="col-sm-6">
                                    <label for="fullName" class="form-label font-weight-bold">Full Name:</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${sessionScope.LOGIN_USER.name}" readonly="" >
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="phone" class="form-label font-weight-bold">Phone <span class="text-danger">*</span> :</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.LOGIN_USER.phone.trim()}" 
                                           pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b" placeholder="Please enter your phone..." size="12" required="">
                                </div>
                                <div class="col-sm-6">
                                    <label for="dob" class="form-label font-weight-bold">Date of birth:</label>
                                    <input type="date" class="form-control" id="dob" name="dob" value="${sessionScope.LOGIN_USER.dob}"  min="1900-01-01" max="3000-12-31">
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="bio" class="form-label font-weight-bold">Bio:</label>
                                    <input type="text" class="form-control" id="bio" name="bio" value="${sessionScope.LOGIN_USER.bio}" placeholder="Please enter your bio..." size="255">
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="address" class="form-label font-weight-bold">Address:</label>
                                    <input type="text" class="form-control" id="address" name="address" value="${sessionScope.LOGIN_USER.address}" placeholder="Please enter your address...">
                                </div>
                            </div>
                            <hr />
                            <input type="hidden" name="userID" value="${sessionScope.LOGIN_USER.id}">
                            <div class="d-grid text-center" >
                                <input class="btn btn-outline-success text-uppercase fw-bold font-size-lg" style="border-radius: 8px" 
                                       type="submit" name="edit" value="Edit">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
    </body>
</html>
