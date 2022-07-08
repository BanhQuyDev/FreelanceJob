<%-- 
    Document   : index
    Created on : May 28, 2022, 10:38:23 AM
    Author     : QUANG HUY
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>FreeLance Job</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="manifest" href="site.webmanifest" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="assets/img/favicon.ico"
            />
        <link rel="stylesheet" href="./home/home.css"/>
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
        <c:if test="${sessionScope.TYPE == 'admin'}">
            <c:redirect url="LogoutController"></c:redirect>
        </c:if>
        <jsp:include page="component/header.jsp"></jsp:include>
            <main>
                <div style="width: 100%">
                    <div>
                        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#mycarousel" style="height: 10px;
                                    width: 10px;
                                    border-radius: 999rem;" data-slide-to="0" class="active"></li>
                                <li data-target="#mycarousel" style="height: 10px;
                                    width: 10px;
                                    border-radius: 999rem;" data-slide-to="1"></li>
                                <li data-target="#mycarousel" style="height: 10px;
                                    width: 10px;
                                    border-radius: 999rem;" data-slide-to="2"></li>
                            </ol>   
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active" >
                                    <form action="JobListingController" method="POST">
                                        <div style="position: relative; width: 100%; background-color: #363e51">
                                            <img class="d-block img-thumbnail carousel-img" style=" position: absolute; padding: 0"
                                                 src="assets/img/logo/bannerguy.avif" alt="Uthappizza">
                                            <img style="width: 100%; height: 422px; object-fit: cover" src="assets/img/logo/banner.svg" alt="alt"/>
                                        </div>
                                        <div class="carousel-caption d-none d-md-block carousel-content">
                                            <p>Find & Hire <br>Expert Freelancers 
                                            </p>
                                            <p class="carousel-content-p">Work with the best freelance talent from around the world on our secure,<br>
                                                flexible and cost-effective platform.</p>
                                            <c:if test="${sessionScope.LOGIN_USER == null}">                      
                                            <div style="margin-top: 2rem; position: relative">
                                                <!-- <input class="carousel-search position-relative" type="text" name="search" value="" placeholder="What skill are you looking for ?" autocomplete="off">
                                              <button class="carousel-search-button position-absolute">
                                                <svg viewBox="0 0 20 16" height="48" width="18" role="img" style="color: #2777C6"
                                                  class="u-svg-ico" aria-labelledby="searchGuru">
                                                   <title id="searchGuru">Search Freelancers</title>
                                                  <path d="M19.76 18.58l-4.81-4.8a8.43 8.43 0 10-1.18 1.18l4.8 4.8a.83.83 0 001.19-1.18zM8.5 15a6.5 6.5 0 11.01-13.01A6.5 6.5 0 018.5 15z"></path>
                                               </svg>
                                                </button>-->
                                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                                    <a href="JobListingController" class="carousel-button">Find a Job - It's Free</a>
                                                </c:if>
                                                <span style="margin: 0 12px">Or</span>
                                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/FreelanceJob/LoginGoogleController&response_type=code
                                                       &client_id=834451449766-1ckcd4te1p20miirpljhmdc2t3ae1m5b.apps.googleusercontent.com&approval_prompt=force" class="carousel-button">Post a Job - It's Free</a>
                                                </c:if>
                                                <c:if test="${sessionScope.LOGIN_USER != null}">
                                                    <a href="RenderSkillPostJob" class="carousel-button">Post a Job - It's Free</a>
                                                </c:if>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.LOGIN_USER != null && sessionScope.MODE eq 'FREELANCER'}">                      
                                            <div style="margin-top: 2rem; position: relative">
                                                <!--    <input class="carousel-search position-relative" type="text" name="search" value="" placeholder="What job are you looking for ?" autocomplete="off">
                                                <button class="carousel-search-button position-absolute">
                                                    <svg viewBox="0 0 20 16" height="48" width="18" role="img" style="color: #2777C6"
                                                         class="u-svg-ico" aria-labelledby="searchGuru">
                                                    <title id="searchGuru">Search Freelancers</title>
                                                    <path d="M19.76 18.58l-4.81-4.8a8.43 8.43 0 10-1.18 1.18l4.8 4.8a.83.83 0 001.19-1.18zM8.5 15a6.5 6.5 0 11.01-13.01A6.5 6.5 0 018.5 15z"></path>
                                                    </svg>
                                                </button>-->
                                                <a href="JobListingController" class="carousel-button">Find a Job - It's Free</a>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.LOGIN_USER != null && sessionScope.MODE eq 'EMPLOYER'}">                      
                                            <div style="margin-top: 2rem; position: relative">

                                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/FreelanceJob/LoginGoogleController&response_type=code
                                                       &client_id=834451449766-1ckcd4te1p20miirpljhmdc2t3ae1m5b.apps.googleusercontent.com&approval_prompt=force" class="carousel-button">Post a Job - It's Free</a>
                                                </c:if>
                                                <c:if test="${sessionScope.LOGIN_USER != null}">
                                                    <a href="RenderSkillPostJob" class="carousel-button">Post a Job - It's Free</a>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </div>
                                </form>
                            </div>
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <div class="carousel-item carousel-item-2">
                                    <div class="hero-area" style="position: relative; width: 100%; height: 422px; background: #4353FF;">   
                                        <img class="position-absolute carousel-item-2__img" style="left: 60%" src="assets/img/logo/hero-image.png" alt="alt"/>
                                        <img class="position-absolute" style="right: 0;
                                             position: absolute;
                                             left: 50%;
                                             top: 30%;
                                             height: 50px;
                                             width: 50px;
                                             margin-left: -25px;" 
                                             src="assets/img/logo/shape1.svg" alt="alt"/>
                                        <img class="position-absolute" style="
                                             position: absolute;
                                             right: 10%;
                                             bottom: 0%;
                                             height: 50px;
                                             width: 50px;
                                             margin-left: -25px;" 
                                             src="assets/img/logo/shape4.svg" alt="alt"/>
                                    </div>
                                    <div class="carousel-caption d-none d-md-block carousel-content-item-2 carousel-item-2__p">
                                        <p>Find talent
                                            <br>your way 
                                        </p>
                                        <p class="carousel-content-p">Work with the largest network of independent professionals and <br> get things done—from quick turnarounds to big transformations.</p>
                                        <div class="carousel-item-2_button button-login">
                                            <a  href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/FreelanceJob/LoginGoogleController&response_type=code
                                                &client_id=834451449766-1ckcd4te1p20miirpljhmdc2t3ae1m5b.apps.googleusercontent.com&approval_prompt=force"
                                                role="button">Login</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <div class="carousel-item">
                                    <div style="width: 100%">
                                        <img style="height: 422px; width: 100%; object-fit: cover" src="assets/img/logo/slide_3.jpg" alt="alt"/>
                                    </div>
                                    <div class="carousel-caption d-none d-md-block carousel-content-item-3 carousel-item-2__p" style="margin-top: 30px">
                                        <p>WE ARE READY TO HELP YOU    
                                        </p>
                                        <p class="carousel-content-p">You are allowed to use this template for your company websites.
                                            <br>You are NOT allowed to re-distribute this template ZIP file on any template download website. Please contact TemplateMo for more detail.</p>
                                        <div class="carousel-item-3_button button-login">
                                            <a  href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/FreelanceJob/LoginGoogleController&response_type=code
                                                &client_id=834451449766-1ckcd4te1p20miirpljhmdc2t3ae1m5b.apps.googleusercontent.com&approval_prompt=force"
                                                role="button">OUR SERVICES</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.MODE eq 'FREELANCER'}">
                                <div class="carousel-item">
                                    <div style="width: 100%">
                                        <img style="height: 422px; width: 100%; object-fit: cover" src="assets/img/logo/slide_02(freelancer).jpg" alt="alt"/>
                                    </div>
                                    <div class="carousel-caption d-none d-md-block carousel-content-item-3 carousel-item-2__p" style="margin-top: 30px;">
                                        <p style=" font-size: 30px; font-weight:800; color: white">HELLO 
                                            <br>FREELANCER   
                                        </p>

                                        <form action="JobApplyController" method="POST">
                                            <button type="submit" class="button_slide-item-2"><span>List Job Apply</span></button>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.MODE eq 'EMPLOYER'}">
                                <div class="carousel-item">
                                    <div style="width: 100%">
                                        <img style="height: 422px; width: 100%; object-fit: cover" src="assets/img/logo/slide02(employer).webp" alt="alt"/>
                                    </div>
                                    <div class="carousel-caption d-none d-md-block carousel-content-item-3 carousel-item-2__p" style="margin-top: 30px;">
                                        <p style=" font-size: 55px; font-weight:800; color: white">Top Recruiting Website
                                            <br>For Employers   
                                        </p>

                                        <form action="RenderJobPostController" method="POST">
                                            <button type="submit" class="button_slide-item-2"><span>Your Post</span></button>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.MODE eq 'FREELANCER' || sessionScope.MODE eq 'EMPLOYER'}">
                                <div class="carousel-item carousel-item-2">
                                    <div class="hero-area_slide3" style="position: relative; width: 100%; height: 422px; background: #ccc">   
                                        <img class="position-absolute carousel-item-3__img" style="left: 65%" src="assets/img/logo/slide_03(freelancer).png" alt="alt"/>
                                        <img class="position-absolute shape1" style="right: 0" src="assets/img/logo/shape1.svg" alt="alt"/>
                                    </div>
                                    <div class="carousel-caption d-none d-md-block carousel-content-item-3 carousel-item-3__p">
                                        <p style="color: white">UPDATE YOUR SKILL
                                        </p>
                                        <p class="carousel-content-p" style="color: #293651">
                                            To show off your skills developed throughout your
                                            <br>work history instead of the specific positions you have held.</p>
                                        <div class="button_slide-item-3" style="background-color: #ccc">
                                            <a href="freelancer_detail.jsp">Edit Now</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>


                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>

                    </div>
                </div>
            </div>
            <!-- slider Area End-->
            <!-- Our Services Start -->
            <div class="our-services section-pad-t30" style="padding-top: 100px">
                <div class="container">
                    <!-- Section Tittle -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-tittle text-center">
                                <span>FEATURED TOURS Packages</span>
                                <h2>Browse Top Categories</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-contnet-center reveal">
                        <c:forEach var="major" items="${requestScope.LIST_MAJOR}">
                            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                                <div class="single-services text-center mb-30">
                                    <a href="JobListingController?selectedMajor=${major.major_name}">
                                        <div class="services-ion">
                                            <span ><img style="width: 60%;margin-bottom:10px" src="${major.image_major}"/></span>
                                        </div>                                       
                                        <div class="services-cap">
                                            <h5>${major.id_major}</h5>
                                            <span style="color: #5d5df4">${major.totalJob} job(s)</span><br>
                                            <span>${major.major_name}</span>
                                        </div>
                                    </a>                           
                                </div>
                            </div>
                        </c:forEach>                      
                    </div>
                    <!-- More Btn -->
                    <!-- Section Button -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="browse-btn2 text-center">
                                <a href="JobListingController" class="border-btn2"
                                   >Browse All Jobs</a
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Our Services End -->
            <!-- Featured_job_start -->
            <section class="featured-job-area feature-padding">
                <div class="container">
                    <!-- Section Tittle -->
                    <div class="row reveal fade-left">
                        <div class="col-lg-12">
                            <div class="section-tittle text-center">
                                <span>Top 4 latest jobs</span>
                                <h2>Latest Jobs</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center reveal fade-left">
                        <div class="col-xl-10">
                            <!-- single-job-content -->
                            <c:forEach var="job" items="${requestScope.LIST_TOP_4_LATEST_JOB}">
                                <div class="single-job-items mb-30">
                                    <div class="job-items">
                                        <div class="company-img">
                                            <a href="JobDetailController?jobId=${job.idJob}"
                                               ><img style="width: 85px" src="assets/img/icon/job-list.png" alt=""
                                                  /></a>
                                        </div>
                                        <div class="job-tittle">
                                            <a href="JobDetailController?jobId=${job.idJob}"><h4>${job.title}</h4></a>
                                            <ul>
                                                <li>${job.nameEmployer}</li>
                                                <li><i class="fa-solid fa-business-time"></i>${job.showDuration(job.duration)} day(s)</li>
                                                    <c:set var="salary" value="${job.salary}"/>
                                                <li>${job.showPrice(salary)} VNĐ</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="items-link f-right">
                                        <c:choose>
                                            <c:when test="${job.nameEmployer != sessionScope.LOGIN_USER.name && sessionScope.MODE != 'EMPLOYER'}">
                                                <c:if test="${job.jobApplication != 0}">
                                                    <a style="pointer-events: none; background-color: #f2722970">Processsing...</a>
                                                </c:if>
                                                <c:if test="${job.jobApplication == 0}">
                                                    <a href="JobDetailController?jobId=${job.idJob}">Apply</a>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${job.nameEmployer == sessionScope.LOGIN_USER.name && sessionScope.MODE != 'EMPLOYER'}">
                                                <div style="cursor: pointer;" tabindex="0" data-toggle="popover" data-trigger="focus" data-placement="right" data-animation="true" title="You can't apply Your Own Job" data-content="Please apply another">
                                                    <a>Apply</a>
                                                </div>                
                                            </c:when>
                                            <c:when test="${sessionScope.MODE == 'EMPLOYER'}">
                                                <div style="cursor: pointer;" tabindex="0" data-toggle="popover" data-trigger="focus" data-placement="right" data-animation="true" title="You can' apply As An Employer" data-content="Please change your mode">
                                                    <a>Apply</a>
                                                </div>
                                            </c:when>
                                        </c:choose>                        
                                        <span> <strong> ${job.freelancerQuantity} </strong> Freelancer(s) Applied !!</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </section>
            <section class="featured-job-area feature-padding">
                <div class="container">
                    <!-- Section Tittle -->
                    <div class="row reveal fade-right" style="margin-bottom: 60px">
                        <div class="col-lg-12">
                            <div class="section-tittle text-center">
                                <span style="color: #fb246a; font-size: 37px; font-family: 700">TOP 4 FREELANCER</span>
                                <span style="color: black; font-size: 15px; margin: auto; width: 50%">Freelancer of month</span>
                            </div>
                        </div>
                    </div>

                    <div class="row reveal fade-right">
                        <c:forEach var="feedbackTop4" items="${requestScope.LIST_TOP_4_FREELACER}" varStatus="count">
                            <div class="col-lg-3 col-md-6 col-12" style="padding: 0 20px">
                                <div style="padding: 25px; box-shadow: 0 0rem 20px rgba(0,0,0,20%); border-radius: 15px;">
                                    <!-- Image -->
                                    <div class="shapes position-relative">
                                        <div class="image text-center">
                                            <img style="border-radius: 50%" src="${feedbackTop4.feedback_freelancer_avatar}" alt="#">
                                            <c:choose>
                                                <c:when test="${count.count == 1}">
                                                    <span class="shape1 position-absolute" style="top: 6%; left: 6%; font-size: 18px; font-weight: 900; border: 2px solid; border-radius: 10px; padding: 4px; color: white; background-color: #ffdd86; box-shadow: 0 0 10px #ffdd86;">Top ${count.count}</span>
                                                    <span class="shape2 position-absolute" style="bottom: 65%; right: 0; font-size: 30px; color: #ffdd86;"><i class="fas fa-medal"></i></span>
                                                </c:when>
                                                <c:when test="${count.count == 2}">
                                                    <span class="shape1 position-absolute" style="top: 6%; left: 6%; font-size: 18px; font-weight: 900; border: 2px solid; border-radius: 10px; padding: 4px; color: white; background-color: #98999f; box-shadow: 0 0 10px #98999f;">Top ${count.count}</span>
                                                    <span class="shape2 position-absolute" style="bottom: 65%; right: 0; font-size: 30px; color: #98999f"><i class="fas fa-medal"></i></span>
                                                    </c:when>
                                                    <c:when test="${count.count == 3}">
                                                    <span class="shape1 position-absolute" style="top: 6%; left: 6%; font-size: 18px; font-weight: 900; border: 2px solid; border-radius: 10px; padding: 4px; color: white; background-color: #893917; box-shadow: 0 0 10px #893917;">Top ${count.count}</span>
                                                    <span class="shape2 position-absolute" style="bottom: 65%; right: 0; font-size: 30px; color: #893917"><i class="fas fa-medal"></i></span>
                                                    </c:when>    
                                                    <c:when test="${count.count == 4}">
                                                    <span class="shape1 position-absolute" style="top: 6%; left: 6%; font-size: 18px; font-weight: 900; border: 2px solid; border-radius: 10px; padding: 4px; color: white; background-color: black; box-shadow: 0 0 10px black;">Top ${count.count}</span>
                                                    <span class="shape2 position-absolute" style="bottom: 65%; right: 0; font-size: 30px;"><i class="fas fa-medal"></i></span>
                                                    </c:when>
                                                </c:choose> 
                                        </div>
                                    </div>
                                    <!-- End Image -->
                                    <div class="rating">
                                        <ul class="row justify-content-center mt-3">
                                            <c:if test="${feedbackTop4.feedback_avg_rating == 5}">
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center ml-1" style="color: #ffee05; text-shadow: 0px 0px 8px #0008ffad; opacity: 1"><i class="fas fa-star" style="font-size: 30px;"></i></li>
                                                </c:if>
                                                <c:if test="${feedbackTop4.feedback_avg_rating == 4}">
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center ml-1" style="color: #000; opacity: 1"><i class="fas fa-star" style="font-size: 30px;"></i></li>
                                                </c:if>
                                                <c:if test="${feedbackTop4.feedback_avg_rating == 3}">
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center ml-1" style="color: #000; opacity: 1"><i class="fas fa-star" style="font-size: 30px;"></i></li>
                                                </c:if>
                                                <c:if test="${feedbackTop4.feedback_avg_rating == 2}">
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center ml-1" style="color: #000; opacity: 1"><i class="fas fa-star" style="font-size: 30px;"></i></li>
                                                </c:if>
                                                <c:if test="${feedbackTop4.feedback_avg_rating == 1}">
                                                <li class="align-self-center" style="color: #ffee05; text-shadow: 0px 0px 5px #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center" style="color: #000; opacity: 0.7"><i class="fas fa-star"></i></li>
                                                <li class="align-self-center ml-1" style="color: #000; opacity: 1"><i class="fas fa-star" style="font-size: 30px;"></i></li>
                                                </c:if>
                                        </ul>
                                    </div>
                                    <div class="info-head mt-3 text-center" style="height: 70px">
                                        <div class="info-box">
                                            <h4 class="name"><a class="section-honorable__name" href="#">${feedbackTop4.feedback_freelancer_name}</a></h4>
                                            <span class="designation"></span>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <h2 class="mb-0 font-weight-bold counter" style="color: #4d12a6">${feedbackTop4.feedback_job_done}</h2>
                                        <p>jobs done</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- Featured_job_end -->
        </main>
        <jsp:include page="component/footer.jsp"></jsp:include>

        <!-- JS here -->

        <!-- All JS Custom Plugins Link Here here -->
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(400, 0).slideUp(400, function () {
                    $(this).remove();
                });
            }, 3000)
        </script> 
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
        <script
            src="https://kit.fontawesome.com/b36bcbb61e.js"
            crossorigin="anonymous"
        ></script>
        <script src="./assets/js/animation.js"></script>

        <!--Countup-->
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
        <script src="./assets/js/jquery.countup.js"></script>
        <script>
            $('.counter').countUp();
        </script>
        <!--End Countup-->
        <script>
            $(function () {
                $('[data-toggle="popover"]').popover(),
                        $('.popover-dismiss').popover({
                    trigger: 'focus'
                })
            })
        </script>

    </body>
</html>
