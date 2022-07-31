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
            href="assets/img/logo/logo_freelancer.png"
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
            <div class="main-body p-2 border border-danger mt-5 mb-5" style="border-radius: 8px">
                <!-- Breadcrumb -->
                <nav aria-label="breadcrumb" class="main-breadcrumb">
                    <ol class="breadcrumb" style="background-color: #fb246a">
                        <li class="breadcrumb-item "><a href="HomeController">Home</a></li>
                        <li class="breadcrumb-item">
                            <a href="javascript:void(0)">User</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            User Profile
                        </li>
                    </ol>
                </nav>
                <!-- /Breadcrumb -->

                <div class="row gutters-sm">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img
                                        src="${sessionScope.LOGIN_USER.picture}"
                                        alt="${sessionScope.LOGIN_USER.name}"
                                        class="rounded-circle"
                                        width="150"
                                        />
                                    <div class="mt-3">
                                        <h4>${sessionScope.LOGIN_USER.name}</h4>
                                        <p class="text-muted font-size-lg"><strong>Balance: </strong>${sessionScope.LOGIN_USER.showPrice(requestScope.BALANCE)} VNĐ</p>
                                        <p class="text-muted font-size-lg"><strong>Bio: </strong> ${sessionScope.LOGIN_USER.bio}</p>
                                        <div class="text-left">
                                            <span class="font-weight-bold">Skills: </span>
                                            <c:forEach items="${sessionScope.SKILL}" var="S">
                                                <span class="badge badge-info">
                                                    ${S.name}
                                                </span>
                                            </c:forEach>
                                            <a href="freelancer_update_skill.jsp">
                                                <img src="https://icon-library.com/images/add-icon/add-icon-4.jpg" style="width: 20px;
                                                     height: 20px;
                                                     border-radius: 100rem;
                                                     object-fit: cover;" alt="alt"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mt-3">
                            <ul class="list-group list-group-flush">
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                                    >
                                    <div style="display: flex; gap: 20px; justify-content: center; align-items: center;">
                                        <img style="height: 30px; width: 30px" src="https://upload.wikimedia.org/wikipedia/commons/8/8c/Gmail_Icon_%282013-2020%29.svg" alt="alt"/>
                                        <h6 class="mb-0">
                                            Gmail
                                        </h6>
                                    </div>

                                    <span class="text-secondary">${sessionScope.LOGIN_USER.email}</span>
                                </li>
                            </ul>
                        </div>
                        <div class="card mt-3">
                            <ul class="list-group list-group-flush">
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                                    >
                                    <div style="display: flex; gap: 20px; justify-content: space-between; align-items: center; width: 100%">
                                        <div style="display: flex; flex-direction: column">
                                            <div style="font-weight: 700">
                                                <span>Total Star: </span>
                                                <i style="color: #E59819" class="fas fa-star">
                                                    ${sessionScope.TOTAl_STAR}
                                                </i>
                                            </div>
                                            <div style="font-weight: 700">
                                                <span>Total Job: </span>
                                                ${sessionScope.TOTAl_JOB}
                                            </div>
                                        </div>
                                        <a class="bg-info text-light border-0" style="border: 2px solid black; padding: 8px 20px; border-radius: 8px; cursor: pointer" data-toggle="modal" data-target="#noteModal">
                                            View all feedback
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="modal fade" id="noteModal">
                            <div class="modal-dialog modal-dialog-centered">

                                <div class="modal-content dropdown-notification"  style="width: 600px">
                                    <div class="text-center arrow_box_right notification--header">
                                        <div style="width: 100%; text-align: center; color: #117A8B">
                                            <span>View All Feedback</span>
                                        </div>                                              
                                    </div>
                                    <c:forEach items="${sessionScope.ALL_FEEDBACK}" var="F">
                                        <div class="" style="padding: 10px; border: 1px solid #ccc; margin-bottom: 10px; border-radius: 8px">
                                            <div class="notification--list">
                                                <div class="notification-list_img">
                                                    <img class="notification--img" src="${F.feedback_employer_avatar}" alt="user">
                                                </div>
                                                <div class="notification-list_detail">
                                                    <p class="notification--font" style="margin-bottom: 0;"><b style="color: #fb246a">${F.feedback_employer_name}</b> <strong>${F.feedback_content}</strong></p>

                                                    <i style="color: #E59819" class="fas fa-star"></i>${F.feedback_rating}
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3" style="height: 100%">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">${sessionScope.LOGIN_USER.name}</div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">${sessionScope.LOGIN_USER.email}</div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">${sessionScope.LOGIN_USER.phone}</div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Date of birth</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">${sessionScope.LOGIN_USER.dob}</div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        ${sessionScope.LOGIN_USER.address}
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-12 text-center">
                                        <a style="border-radius: 8px" href="freelancer_update_profile.jsp" class="btn btn-outline-success mb-2 w-25">
                                            <i class="bi bi-box-arrow-in-down"></i> Edit
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="component/footer.jsp"></jsp:include>
        <!-- JS here -->
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(400, 0).slideUp(400, function () {
                    $(this).remove();
                });
            }, 3000);
        </script>
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
