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

    </head>
    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
        <c:if test="${sessionScope.LOGIN_USER == NULL}">
            <c:redirect url="index.jsp"></c:redirect>
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

                <div>
                  <div class="d-flex align-center mb-2" style="gap: 20px;
                                 align-items: center">
                                <div class="font-weight-bold">Skills: </div></br>
                                <div class="dropdown">
                                    <button type="button" class="dropdown-toggle bg-danger border-0 w-100" style="border-radius: 8px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <c:if test="${requestScope.MAJOR  != NULL}">${requestScope.MAJOR.name}</c:if>
                                        <c:if test="${requestScope.MAJOR  == NULL}">Major</c:if>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="height: 150px;
                                             overflow-y: scroll;">
                                            <a class="dropdown-item" href="freelancer_update_skill.jsp">All majors</a>
                                        <c:forEach items="${sessionScope.LIST_MAJOR}" var="LM">
                                            <a class="dropdown-item" href="FilterMajorController?majorID=${LM.id}">${LM.name}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                      
                        <div class="row" style="height: 200px; overflow: auto;height: 200px; margin: 20px;"> 
                            <div class="card-body">
                            <c:if test="${sessionScope.SKILL.size() == 0 && sessionScope.LIST_SKILL.size() == 0
                                          &&requestScope.LIST_SKILL_MAJOR.size() == 0 && requestScope.SKILL_MAJOR.size() == 0 }">
                                  <div class="col-sm-12" style="margin: auto;
                                       text-align: center;">
                                      <div style="display:block;
                                           ">
                                          Empty List
                                      </div>
                                  </c:if>
                                  <c:if test="${sessionScope.SKILL.size() != 0 || sessionScope.LIST_SKILL.size() != 0
                                                || requestScope.LIST_SKILL_MAJOR.size() != 0 || requestScope.SKILL_MAJOR.size() != 0}">
                                        <div class="col-sm-12">
                                            <div style="display: grid; grid-template-columns: repeat(5, 1fr); grid-gap: 10px; height: 250px;
                                                 ">

                                                <c:if test="${sessionScope.SKILL != NULL && requestScope.SKILL_MAJOR == NULL}">
                                                    <c:forEach items="${sessionScope.SKILL}" var="S" >
                                                        <div class="d-flex border justify-content-center align-items-center h-25"
                                                             style="border-radius: 8px;
                                                             ">
                                                            <div class="w-50 m-2 text-center">
                                                                <span class="font-weight-bold">${S.name}
                                                                </span>

                                                            </div>
                                                            <a class="m-3  text-center" href="UpdateUserSkillController?skillId=${S.skillId}&delete">
                                                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Flat_minus_icon_-_red.svg/1200px-Flat_minus_icon_-_red.svg.png" style="width: 20px;
                                                     height: 20px;
                                                     border-radius: 100rem;
                                                     object-fit: cover;" alt="alt"/>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${requestScope.SKILL_MAJOR != NULL}">
                                                    <c:forEach items="${requestScope.SKILL_MAJOR}" var="S" >
                                                        <div class="d-flex border justify-content-center align-items-center h-25"
                                                             style="border-radius: 8px;
                                                             ">
                                                            <div class="w-50 m-2 text-center">
                                                                <span class="font-weight-bold">${S.name}
                                                                </span>

                                                            </div>
                                                            <a class="m-3 text-center" href="UpdateUserSkillController?skillId=${S.skillId}&delete">
                                                              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Flat_minus_icon_-_red.svg/1200px-Flat_minus_icon_-_red.svg.png" style="width: 20px;
                                                     height: 20px;
                                                     border-radius: 100rem;
                                                     object-fit: cover;" alt="alt"/>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${sessionScope.LIST_SKILL != NULL && requestScope.LIST_SKILL_MAJOR == NULL}">
                                                    <c:forEach items="${sessionScope.LIST_SKILL}" var="LS"> 
                                                        <div class="d-flex border justify-content-center align-items-center h-25"
                                                             style="border-radius: 8px;
                                                             ">
                                                            <div class="w-50 m-2 text-center">
                                                                <span class="font-weight-bold">${LS.name}
                                                                </span>

                                                            </div>
                                                            <a class="m-3 text-center" href="UpdateUserSkillController?skillId=${LS.skillId}&add">
                                                                 <img src="https://icon-library.com/images/add-icon/add-icon-4.jpg" style="width: 20px;
                                                     height: 20px;
                                                     border-radius: 100rem;
                                                     object-fit: cover;" alt="alt"/>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${requestScope.LIST_SKILL_MAJOR != NULL}">
                                                    <c:forEach items="${requestScope.LIST_SKILL_MAJOR}" var="LS"> 
                                                        <div class="d-flex border justify-content-center align-items-center h-25"
                                                             style="border-radius: 8px;
                                                             ">
                                                            <div class="w-50 m-2 text-center">
                                                                <span class="font-weight-bold">${LS.name}
                                                                </span>

                                                            </div>
                                                            <a class="m-3 text-center" href="UpdateUserSkillController?skillId=${LS.skillId}&add">
                                                                 <img src="https://icon-library.com/images/add-icon/add-icon-4.jpg" style="width: 20px;
                                                     height: 20px;
                                                     border-radius: 100rem;
                                                     object-fit: cover;" alt="alt"/>    
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>

                                            </div>
                                        </c:if>

                                  </div>

                            </div>

                            <hr />
                        </div>
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
