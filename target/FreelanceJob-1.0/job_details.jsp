<%-- 
    Document   : job_details
    Created on : May 28, 2022, 10:41:56 AM
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
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/price_rangs.css">
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
                                        <h2>Job Detail</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Hero Area End -->
                <!-- job post company Start -->
            <c:set var="job" value="${requestScope.JOB_DETAIL}"/>
            <div class="job-post-company pt-120 pb-120">
                <div class="container">
                    <div class="row justify-content-between">
                        <!-- Left Content -->
                        <div class="col-xl-7 col-lg-8">
                            <!-- job single -->
                            <div class="single-job-items mb-50">
                                <div class="job-items">
                                    <div class="company-img company-img-details mb-3">
                                        <a href="#"><img style="width: 85px" src="assets/img/icon/job-list.png" alt=""></a>
                                        <span style="font-size: 30px">${job.title}</span>
                                        <c:if test="${sessionScope.LOGIN_USER != null}">
                                            <a data-toggle="modal" data-target="#exampleModalCenter" data-whatever="@mdo" ><i style="color:#e50505; margin-left: 50px; font-size:20px" class="fa fa-flag" aria-hidden="true"></i></a>                                    
                                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <form action="ReportController" method="POST">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Your Report</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label for="message-text" class="col-form-label">Reason:</label>
                                                                    <textarea name="content" class="form-control" id="message-text" rows="3"></textarea>
                                                                    <input type="hidden" name="jobId" value="${job.idJob}">
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer d-flex justify-content-center">
                                                                <button type="submit" class="btn" style="background-color:#e53805d6">Send Report</button>
                                                            </div>
                                                      </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>                                       
                                    </div>
                                    <div class="job-tittle">
                                        <ul>
                                            <li>${job.nameEmployer}</li>
                                            <li><i class="fa-solid fa-business-time"></i>${job.showDuration(job.duration)} day(s)</li>
                                                <c:set var="salary" value="${job.salary}"/>
                                            <li>${job.idMajor} - ${job.nameMajor}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- job single End -->

                            <div class="job-post-details">
                                <div class="post-details1 mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle text-center">                                        
                                        <h4 class="text-monospace">(<span style="color: blue">${requestScope.COUNTING_FREELANCER}</span>) Freelancer(s) Applied this job</h4>
                                    </div>
                                </div>
                                <div class="post-details1 mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4 class="text-monospace">Job Description</h4>
                                    </div>
                                    <p>${job.description}</p>
                                </div>
                                <div class="post-details1 mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4 class="text-monospace">Skill Needed</h4>
                                    </div>
                                    <div style="column-gap: 10%; row-gap: 28px" class="row justify-content-between text-center p-4">
                                        <c:forEach var="skillName" items="${requestScope.SKILL_JOB}">
                                            <!--<button type="button" class="btn col-3"></button>-->
                                            <p class="col-3 shadow-lg rounded text-success font-weight-bold p-2">${skillName}</p>
                                        </c:forEach>                                      
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Right Content -->
                        <div class="col-xl-4 col-lg-4">
                            <div class="post-details3  mb-50 rounded" style="border: 3px solid #ededed;">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4 class="text-monospace">Job Payment</h4>
                                </div>
                                <ul>
                                    <li>Start Date : <span>${job.startDate}</span></li>
                                    <li>End Date : <span>${job.endDate}</span></li>
                                    <li>Create date : <span>${job.createDate}</span></li>
                                    <li>Salary :  <span>${job.showPrice(salary)}VNĐ</span></li>
                                </ul>
                                <div class="apply-btn2">
                                    <c:choose>
                                        <c:when test="${sessionScope.LOGIN_USER == null}">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/FreelanceJob/LoginGoogleController&response_type=code
                                                       &client_id=834451449766-1ckcd4te1p20miirpljhmdc2t3ae1m5b.apps.googleusercontent.com&approval_prompt=force" 
                                                       class="btn" style="padding-left:25px;padding-right:25px;">Apply Now</a>
                                                </div>
                                                <div class="col-sm-8">
                                                    <button class="btn" style="margin-left: 60px;" onclick="history.back()">Previous</button>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${job.nameEmployer == sessionScope.LOGIN_USER.name && sessionScope.MODE != 'EMPLOYER'}">
                                            <button class="btn" onclick="history.back()">Previous</button>
                                        </c:when>
                                        <c:when test="${requestScope.APPLY_SUCCESS == null && sessionScope.MODE != 'EMPLOYER' && requestScope.JOB_APPLICATION_ID == 0}">                
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <a class="btn rounded" style="padding-left:25px;padding-right:25px;" href="ApplyJobController?jobId=${job.idJob}">Apply Now</a>
                                                </div>
                                                <div class="col-sm-8">
                                                    <a href="JobListingController?selectedMajor=All Major" class="btn" style="margin-left: 60px;">Previous</a>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${requestScope.APPLY_SUCCESS != null  && sessionScope.MODE != 'EMPLOYER' && requestScope.JOB_APPLICATION_ID != 0}">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <button class="btn" style="padding-left:25px;padding-right:25px; background-color: #f2722970;">Processsing...</button>
                                                </div>
                                                <div class="col-sm-8">
                                                    <a href="JobListingController?selectedMajor=All Major" class="btn" style="margin-left: 60px;">Previous</a>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${job.nameEmployer == sessionScope.LOGIN_USER.name && sessionScope.MODE == 'EMPLOYER'}">
                                            <button class="btn" onclick="history.back()">Previous</button>
                                        </c:when>
                                        <c:when test="${requestScope.JOB_APPLICATION_ID != 0}">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <button class="btn" style="padding-left:25px;padding-right:25px; background-color: #f2722970;">Processsing...</button>
                                                </div>
                                                <div class="col-sm-8">
                                                    <button class="btn" style="margin-left: 60px;" onclick="history.back()">Previous</button>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- job post company End -->

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
        <script src="https://kit.fontawesome.com/b36bcbb61e.js" crossorigin="anonymous"></script>

    </body>
</html>
