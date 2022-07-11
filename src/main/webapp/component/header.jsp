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
        <div class="headder-top header-sticky" style="border-bottom: 1px solid #ccc">
            <div class="container">
                <div class="row align-items-center">
                    <div class="d-none d-md-block col-lg-2 col-md-2">
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
                    <div class="col-lg-10 col-md-9">
                        <div class="menu-wrapper" style="justify-content: space-around">
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
                                                        <li><a href="JobApplyController">List Job Apply</a></li>
                                                        <li><a href="WorkspaceController">Work Space</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="HistoryController">History</a></li>
                                                <li class="nav-item dropdown" style="position: relative">
                                                    <a class="nav-link dropdown-toggle" href="#"
                                                       id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                                       aria-expanded="false">
                                                        <i class="fa fa-bell" style="position: relative">
                                                            <c:if test="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD.size() == 0}">
                                                            </c:if>  
                                                            <c:if test="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD.size() != 0}">
                                                                <span class="notification--count">
                                                                    ${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD.size() }
                                                                </span>
                                                            </c:if>
                                                        </i>

                                                    </a>
                                                    <div class="dropdown-menu dropdown-notification"
                                                         aria-labelledby="navbarDropdown">                                                        
                                                        <div class="text-center arrow_box_right notification--header">
                                                            <div>
                                                                <span>Notifications</span>
                                                            </div>
                                                            <div>
                                                                <a href="GetAllNotifycationsController" class="text-bold-700" 
                                                                   style="text-decoration: underline; text-align: right; font-size: 16px; color: #fb246a;
                                                                   display: inline-block; padding: 10px 10px; " >View All</a>
                                                            </div>                                                        
                                                        </div>
                                                        <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD}" var="LN">
                                                            <a href="#" class="notification_unread" style="padding: 0">
                                                                <div class="notification--list">
                                                                    <div class="notification-list_img">
                                                                        <img class="notification--img" src="${LN.avatar != null ? LN.avatar : 
                                                                                                              'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="user">
                                                                    </div>
                                                                    <div class="notification-list_detail">
                                                                        <p class="notification--font" style="margin-bottom: 0;"><b style="color: #fb246a">${LN.employerName}</b> <strong>${LN.content}</strong></p>
                                                                        <p style="text-align: right"><small>${LN.timeAgo}</small></p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </c:forEach>

                                                        <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_READ}" var="LN">
                                                            <a href="#" class="notification_read" style="padding: 0">
                                                                <div class="notification--list">
                                                                    <div class="notification-list_img">
                                                                        <img class="notification--img" src="${LN.avatar != null ? LN.avatar : 
                                                                                                              'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="user">
                                                                    </div>
                                                                    <div class="notification-list_detail">
                                                                        <p class="notification--font" style="margin-bottom: 0;"><b style="color: #fb246a">${LN.employerName}</b> <strong>${LN.content}</strong></p>
                                                                        <p style="text-align: right"><small>${LN.timeAgo}</small></p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </c:forEach>

                                                    </div>
                                                </li>
                                            </c:when>                                              
                                            <c:when test="${sessionScope.MODE == 'EMPLOYER'}">
                                                <li><a href="RenderSkillPostJob">Post a Job </a></li>
                                                <li>
                                                    <a href="#">Job Management</a>
                                                    <ul class="submenu">
                                                        <li><a href="RenderJobPostController">Your Post</a></li>
                                                        <li><a href="GetAllFreelancerApplyController">List Freelancer Apply</a></li>
                                                        <li><a href="WorkspaceController">Work Space</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="HistoryController">History</a></li>
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#"
                                                       id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                                       aria-expanded="false">
                                                        <i class="fa fa-bell" style="position: relative">
                                                            <c:if test="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD.size() == 0}">
                                                            </c:if>  
                                                            <c:if test="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD.size() != 0}">
                                                                <span class="notification--count">
                                                                    ${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD.size() }
                                                                </span>
                                                            </c:if>
                                                        </i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-notification"
                                                         aria-labelledby="navbarDropdown">                                                        
                                                        <div class="text-center arrow_box_right notification--header">
                                                            <div>
                                                                <span>Notifications</span>
                                                            </div>
                                                            <div>
                                                                <a href="GetAllNotifycationsController" class="text-bold-700" 
                                                                   style="text-decoration: underline; text-align: right; font-size: 16px; color: #fb246a;
                                                                   display: inline-block; padding: 10px 10px; " >View All</a>
                                                            </div>                                                        
                                                        </div>
                                                        <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD}" var="LN">
                                                            <c:if test="${LN.content.contains('recovered')}">
                                                                <a href="RenderJobPostController?id_noti=${LN.id_noti}" class="notification_unread" style="padding: 0">
                                                                    <div class="notification--list">
                                                                        <div class="notification-list_img">
                                                                            <img class="notification--img" src="${LN.avatar != null ? LN.avatar : 
                                                                                                                  'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="user">
                                                                        </div>
                                                                        <div class="notification-list_detail">
                                                                            <p class="notification--font" style="margin-bottom: 0;"><b style="color: #fb246a">${LN.employerName}</b> <strong>${LN.content}</strong></p>
                                                                            <p style="text-align: right"><small>${LN.timeAgo}</small></p>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${LN.content.contains('applied')}">
                                                                <a href="GetAllFreelancerApplyController?id_noti=${LN.id_noti}" class="notification_unread" style="padding: 0">
                                                                    <div class="notification--list">
                                                                        <div class="notification-list_img">
                                                                            <img class="notification--img" src="${LN.avatar != null ? LN.avatar : 
                                                                                                                  'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="user">
                                                                        </div>
                                                                        <div class="notification-list_detail">
                                                                            <p class="notification--font" style="margin-bottom: 0;"><b style="color: #fb246a">${LN.employerName}</b> <strong>${LN.content}</strong></p>
                                                                            <p style="text-align: right"><small>${LN.timeAgo}</small></p>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </c:if>

                                                        </c:forEach>

                                                        <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_READ}" var="LN">
                                                            <a href="GetAllFreelancerApplyController?id_noti=${LN.id_noti}" class="notification_read" style="padding: 0">
                                                                <div class="notification--list">
                                                                    <div class="notification-list_img">
                                                                        <img class="notification--img" src="${LN.avatar != null ? LN.avatar : 
                                                                                                              'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="user">
                                                                    </div>
                                                                    <div class="notification-list_detail">
                                                                        <p class="notification--font" style="margin-bottom: 0;"><b style="color: #fb246a">${LN.employerName}</b> <strong>${LN.content}</strong></p>
                                                                        <p style="text-align: right"><small>${LN.timeAgo}</small></p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </li>
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
                                    <ul class="nav navbar-nav float-right" >
                                        <li class="dropdown dropdown-user nav-item">
                                            <a class="dropdown-toggle nav-link dropdown-user-link user_hover" href="#" data-toggle="dropdown">
                                                <span class="avatar avatar-online">
                                                    <div class="row mt-2" style="display: flex;
                                                         justify-content: center;
                                                         align-items: center;">
                                                        <div class="col-9 mt-4">
                                                            <p style="color: black;font-size: 19px; text-align: center; margin-bottom: 0"
                                                               class="user-name text-bold-700">${sessionScope.LOGIN_USER.name}
                                                            </p>
                                                            <p style="color: black; text-align: center; font-size: 14px;" class="user-name text-bold-700 ml-1">(${sessionScope.MODE})</p>                              
                                                        </div>
                                                        <div class="col-3">
                                                            <img style="border-radius: 50%;border: 1px solid #363E51; height: 60px; width: 60px; object-fit: cover" src="${sessionScope.LOGIN_USER.picture}"
                                                                 alt="avatar" />
                                                        </div>
                                                    </div>                                                       
                                                </span>
                                            </a>

                                            <div class="dropdown-menu dropdown-menu-right" style="border-radius: 16px;">
                                                <div class="arrow_box_right">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.MODE == 'FREELANCER'}">
                                                            <a class="dropdown-item" href="ChangeModeController?type=freelancer"><i class="ft-power"></i><button class="btn btn-primary mode_hover" style="background-color: #fb246a;
                                                                                                                                                                 border-radius: 16px;">Freelancer</button></a>
                                                            <a class="dropdown-item" href="ChangeModeController?type=employer"><i class="ft-power"></i> Employer</a>
                                                        </c:when>
                                                        <c:when test="${sessionScope.MODE == 'EMPLOYER'}">
                                                            <a class="dropdown-item" href="ChangeModeController?type=freelancer"><i class="ft-power"></i> Freelancer</a>
                                                            <a class="dropdown-item" href="ChangeModeController?type=employer"><i class="ft-power"></i><button class="btn btn-primary mode_hover" style="background-color: #fb246a;
                                                                                                                                                               border-radius: 16px;">Employer</button></a>
                                                                </c:when>
                                                                <c:otherwise>
                                                            <a class="dropdown-item" href="ChangeModeController?type=freelancer"><i class="ft-power"></i> Freelancer</a>
                                                            <a class="dropdown-item" href="ChangeModeController?type=employer"><i class="ft-power"></i> Employer</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                            <a>Balance <i class="fa-solid fa-money-bill"></i>: ${sessionScope.LOGIN_USER.showPrice(sessionScope.LOGIN_USER.balance)} VNĐ</a>
                                                    <a class="dropdown-item " href="freelancer_detail.jsp">
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" style="width: 24px;
                                                             height: 21px;
                                                             padding-right: 8px;">
                                                        <path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304z"/></svg> Profile</a>
                                                    <a class="dropdown-item" href="LogoutController"><i style="padding-right: 8px;" class="fas fa-sign-out-alt"></i> <i class="ft-power"></i> Logout</a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <div>
                                        <a
                                            class=" login__button"
                                            href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/FreelanceJob/LoginGoogleController&response_type=code
                                            &client_id=834451449766-1ckcd4te1p20miirpljhmdc2t3ae1m5b.apps.googleusercontent.com&approval_prompt=force"
                                            role="button"
                                            >
                                            <img class="google-icon" src="assets/img/logo/google_logo.webp" alt="alt"/>
                                            Continue with
                                            @fpt.edu.vn email
                                        </a> 
                                    </div>
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
            <c:if test="${requestScope.APPLY_SUCCESS != null}">
                <div class="alert alert-success">
                    <center>
                        <strong>Apply successfully! </strong> ${requestScope.APPLY_SUCCESS}
                    </center>
                </div>
            </c:if>

        </div>
    </div>
    <!-- Header End -->
</header>