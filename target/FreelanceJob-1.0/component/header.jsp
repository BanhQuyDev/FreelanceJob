<%-- 
    Document   : header
    Created on : May 28, 2022, 10:37:55 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Preloader Start -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img
                    style="max-width: 100%; border-radius: 50%"
                    src="assets/img/logo/logo_freelancer.png"
                    alt=""
                    />
            </div>
        </div>
    </div>
</div>
<!-- Preloader Start -->
<header>

    <!-- Header Start -->
    <div class="header-area header-transparrent">
        <div class="headder-top header-sticky">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-2">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="HomeController"
                               ><img
                                    src="assets/img/logo/logo_freelancer.png"
                                    style="max-width: 90%"
                                    alt=""
                                    /></a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="menu-wrapper">
                            <!-- Main-menu -->
                            <div class="main-menu">
                                <nav class="d-none d-lg-block">
                                    <ul id="navigation">
                                        <li><a href="HomeController">Home</a></li>
                                            <c:choose>
                                                <c:when test="${sessionScope.MODE == 'FREELANCER'}">
                                                <li><a href="JobListingController">Find Jobs </a></li>
                                                <li>
                                                    <a style="color: black" href="#">Job Management</a>
                                                    <ul class="submenu">
                                                        <li><a href="#">List Job Apply</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">History</a></li>
                                                </c:when>                                              
                                                <c:when test="${sessionScope.MODE == 'EMPLOYER'}">
                                                <li><a href="RenderSkillPostJob">Post a Job </a></li>
                                                <li>
                                                    <a href="#">Job Management</a>
                                                    <ul class="submenu">
                                                        <li><a href="#">Your Post</a></li>
                                                        <li><a href="GetAllFreelancerApplyController">List Freelancer Apply</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">History</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li><a href="JobListingController">Find Jobs </a></li>
                                                <li>
                                                    <a href="#">About</a>
                                                </li>
                                                <li><a href="#">Contact</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                    </ul>
                                </nav>
                            </div>
                            <!-- Header-btn -->

                            <c:choose>
                                <c:when test="${sessionScope.LOGIN_USER != null}">
                                    <ul class="nav navbar-nav float-right">
                                        <li class="dropdown dropdown-user nav-item">
                                            <a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                                <span class="avatar avatar-online">
                                                    <div class="row mt-2">
                                                        <div class="col-7 mt-4">
                                                            <span style="color: black;font-size: 19px;"
                                                                  class="user-name text-bold-700 ml-1">${sessionScope.LOGIN_USER.name}
                                                            </span>
                                                            <p style="color: black;" class="user-name text-bold-700 ml-1">(${sessionScope.MODE})</p>                              
                                                        </div>
                                                        <div class="col-5">
                                                            <img style="border-radius: 50%;margin-left: 30px;" src="${sessionScope.LOGIN_USER.picture}"
                                                                 alt="avatar" />
                                                        </div>
                                                    </div>                                                       
                                                </span>
                                            </a>

                                            <div class="dropdown-menu dropdown-menu-right">
                                                <div class="arrow_box_right">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.MODE == 'FREELANCER'}">
                                                            <a class="dropdown-item" href="ChangeModeController?type=freelancer"><i class="ft-power"></i><button class="btn btn-primary">Freelancer</button></a>
                                                            <a class="dropdown-item" href="ChangeModeController?type=employer"><i class="ft-power"></i> Employer</a>
                                                        </c:when>
                                                        <c:when test="${sessionScope.MODE == 'EMPLOYER'}">
                                                            <a class="dropdown-item" href="ChangeModeController?type=freelancer"><i class="ft-power"></i> Freelancer</a>
                                                            <a class="dropdown-item" href="ChangeModeController?type=employer"><i class="ft-power"></i><button class="btn btn-primary">Employer</button></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="dropdown-item" href="ChangeModeController?type=freelancer"><i class="ft-power"></i> Freelancer</a>
                                                            <a class="dropdown-item" href="ChangeModeController?type=employer"><i class="ft-power"></i> Employer</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a class="dropdown-item" href="freelancer_detail.jsp"><i class="ft-power"></i> Profile</a>
                                                    <a class="dropdown-item" href="LogoutController"><i class="ft-power"></i> Logout</a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <a
                                        class="login btn btn-light btn-lg"
                                        style="
                                        background-color: rgba(37, 37, 240, 0.747);
                                        font-size: 70%;
                                        text-transform: none;
                                        font-weight: bold;
                                        "
                                        href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/FreelanceJob/LoginGoogleController&response_type=code
                                        &client_id=834451449766-1ckcd4te1p20miirpljhmdc2t3ae1m5b.apps.googleusercontent.com&approval_prompt=force"
                                        role="button"
                                        >
                                        <i class="fab fa-google me-2 m-2"></i>Continue with
                                        @fpt.edu.vn email
                                    </a> 
                                </c:otherwise>
                            </c:choose>
                        </div> 
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
            <c:if test="${requestScope.ERROR_MESSAGE != null}">
                <div class="alert alert-danger">
                    <center>
                        <strong>Alert!</strong> ${requestScope.ERROR_MESSAGE}
                    </center>
                </div>
            </c:if>
            <c:if test="${requestScope.SUCCESS_MESSAGE != null}">
                <div class="alert alert-success">
                    <center>
                        <strong>Success!</strong> ${requestScope.SUCCESS_MESSAGE}
                    </center>
                </div>
            </c:if>
        </div>
    </div>
    <!-- Header End -->
</header>
