<%-- 
    Document   : admin
    Created on : May 28, 2022, 10:40:39 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
        <meta name="description"
              content="Chameleon Admin is a modern Bootstrap 4 webapp &amp; admin dashboard html template with a large number of components, elegant design, clean and organized code." />
        <meta name="keywords"
              content="admin template, Chameleon admin template, dashboard template, gradient admin template, responsive admin template, webapp, eCommerce dashboard, analytic dashboard" />
        <meta name="author" content="ThemeSelect" />
        <title>
            Admin Page
        </title>
        <link rel="apple-touch-icon" href="theme-assets/images/ico/apple-icon-120.png" />
        <link rel="shortcut icon" type="image/x-icon" href="theme-assets/images/ico/favicon.ico" />
        <link
            href="https://fonts.googleapis.com/css?family=Muli:300,300i,400,400i,600,600i,700,700i%7CComfortaa:300,400,700"
            rel="stylesheet" />
        <link href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome.min.css" rel="stylesheet" />
        <!-- BEGIN VENDOR CSS-->
        <link rel="stylesheet" type="text/css" href="theme-assets/css/vendors.css" />
        <!-- END VENDOR CSS-->
        <!-- BEGIN CHAMELEON  CSS-->
        <link rel="stylesheet" type="text/css" href="theme-assets/css/app-lite.css" />
        <!-- END CHAMELEON  CSS-->
        <!-- BEGIN Page Level CSS-->
        <link rel="stylesheet" type="text/css" href="theme-assets/css/core/menu/menu-types/vertical-menu.css" />
        <link rel="stylesheet" type="text/css" href="theme-assets/css/core/colors/palette-gradient.css" />
        <!-- END Page Level CSS-->
        <!-- BEGIN Custom CSS-->
        <!-- END Custom CSS-->
    </head>

    <body class="vertical-layout vertical-menu 2-columns menu-expanded fixed-navbar" data-open="click"
          data-menu="vertical-menu" data-color="bg-gradient-x-purple-blue" data-col="2-columns">

        <c:if test="${sessionScope.TYPE != 'admin'}">
            <c:redirect url="HomeController"></c:redirect>
        </c:if>

        <nav
            class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-semi-light">
            <div class="navbar-wrapper">
                <div class="navbar-container content">
                    <div class="collapse navbar-collapse show" id="navbar-mobile">
                        <ul class="nav navbar-nav mr-auto float-left">
                            <li class="nav-item d-block d-md-none">
                                <a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu"></i></a>
                            </li>
                            <li class="nav-item dropdown navbar-search">
                                <a class="nav-link dropdown-toggle hide" data-toggle="dropdown" href="#"><i
                                        class="ficon ft-search"></i></a>
                                <ul class="dropdown-menu">
                                    <li class="arrow_box">
                                        <c:choose>
                                            <c:when test="${requestScope.LIST_JOB_ACCEPTED != null && requestScope.LIST_JOB_UNAPPROPRIATED != null}">
                                                <form action="SearchJob">
                                                    <div class="input-group search-box">
                                                        <div class="position-relative has-icon-right full-width">
                                                            <input class="form-control" id="search" type="text" name="search"
                                                                   placeholder="Search here..." />
                                                            <div class="form-control-position navbar-search-close">
                                                                <i class="ft-x"> </i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <form action="SearchUser">
                                                    <div class="input-group search-box">
                                                        <div class="position-relative has-icon-right full-width">
                                                            <input class="form-control" id="search" type="text" name="search"
                                                                   placeholder="Search here..." />
                                                            <div class="form-control-position navbar-search-close">
                                                                <i class="ft-x"> </i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav float-right">
                            <li class="dropdown dropdown-user nav-item">
                                <a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                    <span class="user-name text-bold-700 ml-1">${sessionScope.LOGIN_USER.name}</span>
                                </a>
                                <!-- img avar => delete đc -->
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="arrow_box_right">
                                        <a class="dropdown-item" href="#">
                                            <img style="border-radius:50%;margin:auto;width: 100%" src="${sessionScope.LOGIN_USER.picture}" alt="avatar"/>
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="LogoutController"><i class="ft-power"></i> Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <!-- ////////////////////////////////////////////////////////////////////////////-->

        <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true"
             data-img="theme-assets/images/backgrounds/02.jpg">
            <!-- img bg side navbar -->
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mr-auto">
                        <a class="navbar-brand" href="admin.jsp">
                            <!-- <img class="brand-logo" style="width:100px" src="" /> -->
                            <!-- img logo -->
                            <h3 class="brand-text ">Admin Page</h3>
                        </a>
                    </li>
                    <li class="nav-item d-md-none">
                        <a class="nav-link close-navbar">
                            <i class="ft-x"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="main-menu-content">
                <ul class="navigation navigation-main pt-5" id="main-menu-navigation" data-menu="menu-navigation">                    
                    <c:choose>
                        <c:when test="${requestScope.LIST_JOB_ACCEPTED != null && requestScope.LIST_JOB_UNAPPROPRIATED != null}">
                            <li id="job_management" class="active">
                                <a href="GetAllJob" ><i class="ft-book"></i><span class="menu-title" data-i18n="">Job
                                        management</span></a>
                            </li>
                            <li id="user_management" class="mt-2">
                                <a href="GetAllUser"><i class="ft-book"></i><span class="menu-title" data-i18n="">User
                                        management</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li id="job_management">
                                <a href="GetAllJob" ><i class="ft-book"></i><span class="menu-title" data-i18n="">Job
                                        management</span></a>
                            </li>
                            <li id="user_management" class="mt-2 active">
                                <a href="GetAllUser"><i class="ft-book"></i><span class="menu-title" data-i18n="">User
                                        management</span></a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="navigation-background"></div>
        </div>
        <c:choose>
            <c:when test="${requestScope.LIST_JOB_ACCEPTED != null && requestScope.LIST_JOB_UNAPPROPRIATED != null}">
                <div class="app-content content">
                    <div class="content-wrapper">
                        <div class="content-wrapper-before"></div>
                        <div class="content-header row">
                            <div class="content-header-left col-md-4 col-12 mb-2">
                                <h3 class="content-header-title">Job management</h3>
                            </div>
                        </div>
                        <div class="content-body">
                            <!-- Basic Tables start -->
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">List of jobs</h4>
                                            <c:if test="${requestScope.SUCCESS != null}">
                                                <div style="margin-top: 20px" class="alert alert-success">
                                                    <center>
                                                        <strong>Success! </strong> ${requestScope.SUCCESS}
                                                    </center>
                                                </div>
                                            </c:if>
                                            <c:if test="${requestScope.FAIL != null}">
                                                <div style="margin-top: 20px" class="alert alert-danger">
                                                    <center>
                                                        <strong>Alert! </strong> ${requestScope.FAIL}
                                                    </center>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="card-content collapse show">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead style="text-align: center">
                                                            <tr>
                                                                <th>No</th>
                                                                <th>Title</th>
                                                                <th>Posted by</th>
                                                                <th>Start Date</th>
                                                                <th>Created date</th>
                                                                <th>Major</th>
                                                                <th>Status</th>
                                                                <th>Spam</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody style="text-align: center">
                                                            <c:forEach var="job" items="${requestScope.LIST_JOB_ACCEPTED}" varStatus="counter">
                                                                <tr>
                                                                    <th scope="row">${counter.count}</th>
                                                                    <th><a href="RenderJobDetail?idJob=${job.idJob}">${job.title}</a></th>
                                                                    <th>${job.nameEmployer}</th>
                                                                    <th>${job.startDate}</th>
                                                                    <th>${job.createDate}</th>
                                                                    <th>${job.idMajor}</th>
                                                                    <th style="color: green">${job.status}</th>                     
                                                                    <th>
                                                                        <a href="UnappropriatedJobController?idJob=${job.idJob}"><button class="btn btn-danger">Spam</button></a>
                                                                    </th>
                                                                </tr>       
                                                            </c:forEach>                                                                 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Spam Job</h4>
                                        </div>
                                        <div class="card-content collapse show">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead style="text-align: center" class="thead-dark">
                                                    <th>No</th>
                                                    <th>Title</th>
                                                    <th>Posted by</th>
                                                    <th>Start Date</th>
                                                    <th>Created date</th>
                                                    <th>Major</th>
                                                    <th>Status</th>
                                                    <th>Recovery</th>
                                                    <th>Delete</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach var="job" items="${requestScope.LIST_JOB_UNAPPROPRIATED}" varStatus="counter">
                                                            <tr>
                                                                <th scope="row">${counter.count}</th>
                                                                <th><a href="RenderJobDetail?idJob=${job.idJob}">${job.title}</a></th>
                                                                <th>${job.nameEmployer}</th>
                                                                <th>${job.startDate}</th>
                                                                <th>${job.createDate}</th>
                                                                <th>${job.idMajor}</th>
                                                                <th style="color: red">${job.status}</th>                                                                                                             
                                                                <th>
                                                                    <a href="AcceptJobController?idJob=${job.idJob}"><button class="btn btn-success">Recovery</button></a>
                                                                </th>
                                                                <th>
                                                                    <a href="DenyJobController?idJob=${job.idJob}"><button class="btn btn-danger">Delete</button></a>
                                                                </th>
                                                            </tr>  
                                                        </c:forEach>                                              
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="app-content content">
                    <div class="content-wrapper">
                        <div class="content-wrapper-before"></div>
                        <div class="content-header row">
                            <div class="content-header-left col-md-4 col-12 mb-2">
                                <h3 class="content-header-title">User management</h3>
                            </div>
                        </div>
                        <div class="content-body">
                            <!-- Basic Tables start -->
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">List of users</h4>
                                            <c:if test="${requestScope.SUCCESS != null}">
                                                <div style="margin-top: 20px" class="alert alert-success">
                                                    <center>
                                                        <strong>Success! </strong> ${requestScope.SUCCESS}
                                                    </center>
                                                </div>
                                            </c:if>
                                            <c:if test="${requestScope.FAIL != null}">
                                                <div style="margin-top: 20px" class="alert alert-danger">
                                                    <center>
                                                        <strong>Alert! </strong> ${requestScope.FAIL}
                                                    </center>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="card-content collapse show">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead style="text-align: center">
                                                            <tr>
                                                                <th>No</th>
                                                                <th>Full Name</th>
                                                                <th>Email</th>
                                                                <th>Day Of Birth</th>
                                                                <th>Phone</th>
                                                                <th>Num Of Spam</th>
                                                                <th>Ban</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody style="text-align: center">
                                                            <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
                                                                <tr>
                                                                    <th scope="row">${counter.count}</th>
                                                                    <th>${user.name}</th>
                                                                    <th>${user.email}</th>
                                                                    <th>${user.dob}</th>
                                                                    <th>${user.phone}</th>
                                                                    <th>${user.numOfSpam}</th>  
                                                                    <th>
                                                                        <a href="BanUserController?idUser=${user.id}"><button class="btn btn-danger">Ban</button></a>
                                                                    </th>
                                                                </tr>       
                                                            </c:forEach>                                                                 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">List of banned users</h4>
                                        </div>
                                        <div class="card-content collapse show">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>No</th>
                                                            <th>Full Name</th>
                                                            <th>Email</th>
                                                            <th>Day Of Birth</th>
                                                            <th>Phone</th>
                                                            <th>Num Of Spam</th>
                                                            <th>Unban</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="user" items="${requestScope.LIST_USER_BAN}" varStatus="counter">
                                                            <tr>
                                                                <th scope="row">${counter.count}</th>
                                                                <th>${user.name}</th>
                                                                <th>${user.email}</th>
                                                                <th>${user.dob}</th>
                                                                <th>${user.phone}</th>                    
                                                                <th>${user.numOfSpam}</th>                    
                                                                <th>
                                                                    <a href="UnbanUserController?idUser=${user.id}"><button class="btn btn-success">Unban</button></a>
                                                                </th>
                                                            </tr>  
                                                        </c:forEach>                                              
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- ////////////////////////////////////////////////////////////////////////////-->

        <footer class="footer footer-static footer-light navbar-border navbar-shadow">
            <div class="clearfix blue-grey lighten-2 text-sm-center mb-0 px-2">
                <span class="float-md-left d-block d-md-inline-block">  <script>
                    document.write(new Date().getFullYear());
                    </script> &copy; Copyright
                    <a class="text-bold-800 grey darken-2" href="https://themeselection.com"
                       target="_blank">Group 4</a></span>
                <ul class="list-inline float-md-right d-block d-md-inline-blockd-none d-lg-block mb-0">
                    <li class="list-inline-item">
                        <a class="my-1" href="https://themeselection.com/" target="_blank">More themes</a>
                    </li>
                    <li class="list-inline-item">
                        <a class="my-1" href="https://themeselection.com/support" target="_blank">Support</a>
                    </li>
                    <li class="list-inline-item">
                        <a class="my-1"
                           href="https://themeselection.com/products/chameleon-admin-modern-bootstrap-webapp-dashboard-html-template-ui-kit/"
                           target="_blank">
                            Purchase</a>
                    </li>
                </ul>
            </div>
        </footer>
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(400, 0).slideUp(400, function () {
                    $(this).remove();
                });
            }, 3000);
        </script>
        <script src="http://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="theme-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
        <script src="theme-assets/js/core/app-menu-lite.js" type="text/javascript"></script>
        <script src="theme-assets/js/core/app-lite.js" type="text/javascript"></script>
    </body>

</html>