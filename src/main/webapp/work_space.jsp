<%-- 
    Document   : work_space
    Created on : Jun 19, 2022, 2:43:56 PM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>FreeLance Job</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- site icon -->
        <link rel="icon" href="images/fevicon.png" type="image/png" />
        <!-- bootstrap css -->
        <link rel="stylesheet" href="work-space/css/bootstrap.min.css" />
        <!-- site css -->
        <link rel="stylesheet" href="work-space/css/style.css" />
        <!-- responsive css -->
        <link rel="stylesheet" href="work-space/css/responsive.css" />
        <!-- color css -->
        <link rel="stylesheet" href="work-space/css/colors.css" />
        <!-- select bootstrap -->
        <link rel="stylesheet" href="work-space/css/bootstrap-select.css" />
        <!-- scrollbar css -->
        <link rel="stylesheet" href="work-space/css/perfect-scrollbar.css" />
        <!-- custom css -->
        <link rel="stylesheet" href="work-space/css/custom.css" />
        <!-- calendar file css -->
        <link rel="stylesheet" href="work-space/js/semantic.min.css" />
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
        <link rel="stylesheet" href="assets/css/header_notification.css"/>

        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      
        <![endif]-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .modal-dialog {
                width: 600px;
            }

            .modal-content{
                border-radius: 20px;
            }

            .card {
                border: none;
                border-radius: 20px;
            }

            .circle-image img {
                border: 6px solid #fff;
                border-radius: 100%;
                padding: 0px;
                top: -55px;
                position: relative;
                width: 120px;
                height: 120px;
                border-radius: 100%;
                z-index: 1;
                background: #e7d184;
                cursor: pointer;
            }

            .dot {
                height: 23px;
                width: 23px;
                background-color: blue;
                border-radius: 50%;
                display: inline-block;
                position: relative;
                border: 3px solid #fff;
                top: -84px;
                left: 320px;
                z-index: 1000;
            }

            .name {
                margin-top: -65px;
                font-size: 24px;
            }

            .rate {
                border-bottom-right-radius: 20px;
                border-bottom-left-radius: 20px;
                height: 130px;
            }

            .buttons {
                padding: 0 30%;
                top: 5px;
                position: relative;
                cursor: pointer;
            }

            .rating-submit {
                border-radius: 15px;
                color: #fff;
                height: 50px;
                cursor: pointer;
            }

            .rating-submit:hover {
                color: #fff;
            }

            .rating-wrapper {
                border-radius: 5rem;
                padding: 0rem 2.5rem;
                flex-direction: row-reverse;
            }

            .rating-wrapper label {
                color: #E1E6F6;
                cursor: pointer;
                display: inline-flex;
                font-size: 1.5rem;
                padding: 0rem .3rem;
                transition: color 0.5s;
            }

            .rating-wrapper svg {
                -webkit-text-fill-color: transparent;
                -webkit-filter: drop-shadow (4px 1px 6px rgba(198, 206, 237, 1));
                filter: drop-shadow(5px 1px 3px rgba(198, 206, 237, 1));
            }

            .rating-wrapper input {
                appearance: none;
            }

            .rating-wrapper label:hover,
            label:hover~label,
            input:checked~label {
                color: #FFD600;
            }

            .rating-wrapper label:hover,
            label:hover~label,
            input:checked~label {
                color: #FFD600;
            }

            body.modal-open[style] {
                padding-right: 0px !important;
            }
        </style>
    </head>
    <body class="inner_page widgets">
        <div class="full_container">
            <jsp:include page="component/header.jsp"></jsp:include>
                <div class="slider-area">
                    <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/working_space.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap text-center">
                                        <h2>Workspace</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- dashboard inner -->
                <div class="midde_cont ">
                    <div class="container-fluid">
                        <!-- row -->
                        <div class="row column1 mt-5 mb-5">
                        <c:forEach var="contract" items="${requestScope.LIST_CONTRACT_FREELANCER}" varStatus="count">
                            <div class="col-md-6 col-lg-4">
                                <div class="full white_shd margin_bottom_30" style="height: 300px">
                                    <div class="info_people" style="height: 280px">
                                        <div class="p_info_img align-self-center">
                                            <img src="${contract.contract_user_avatar}" alt="#" />
                                        </div>
                                        <div class="user_info_cont">
                                            <h3>${contract.contract_job_tittle}</h3>
                                            <c:if test="${sessionScope.MODE == 'FREELANCER'}">
                                                <p><strong>Hired by :</strong> ${contract.contract_employer_name}</p>
                                            </c:if>
                                            <c:if test="${sessionScope.MODE == 'EMPLOYER'}">
                                                <p><strong>Hiring :</strong> ${contract.contract_freelancer_name}</p>                                           
                                            </c:if>
                                            <p><strong>Start date :</strong> ${contract.contract_job_start_date}</p>
                                            <p class="p_status"><strong>Duration :</strong> ${contract.showDuration(contract.contract_job_duration)} day(s)</p>
                                        </div>
                                        <div class="info_button pt-3">
                                            <!--<button class="buttonVip border-0" onclick="showJobDetail_${count.count}()">View Detail</button> <a href="ShowMessage?idSend=${sessionScope.LOGIN_USER.id}&idReceive=${contract.idPartner}"><button class="buttonVip border-0 ml-4">Chat</button></a>-->
                                            <button class="buttonVip border-0" onclick="showJobDetail_(${requestScope.CONTRACT_DETAIL_SIZE}, ${count.count})">View Detail</button> <a href="ShowMessage?idSend=${sessionScope.LOGIN_USER.id}&idReceive=${contract.idPartner}"><button class="buttonVip border-0 ml-4">Chat</button></a>
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button class="col-3 bg-info border rounded rounded-pill p-2 ml-5 dropdown-toggle buttonFocus" type="button" id="dropdownMenuu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            See more  <i class="fas fa-angle-down ml-2"></i>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuu">
                                            <div class="dropdown-item">
                                                <div class="widget_progress_bar">
                                                    <p class="progress_no dropdown-header"><strong>Work Progress</strong></p>
                                                    <c:if test="${contract.contract_remaining_time > contract.contract_job_duration*24}">
                                                        <p class="progress_head">Not started yet </br> Prepare well</p>
                                                    </c:if>
                                                    <c:if test="${contract.contract_remaining_time < contract.contract_job_duration*24}">
                                                        <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) <= 50}">
                                                            <p class="progress_head">You have plenty of time </br> Happy Code Happy Life</p>
                                                        </c:if>
                                                        <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) > 50 && Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) <= 85}">
                                                            <p class="progress_head">Half of the time has passed </br> Try Harder !!</p>
                                                        </c:if>
                                                        <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) > 85 && Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) <= 100}">
                                                            <p class="progress_head">Time is running out </br> Prepare to submit !!</p>
                                                        </c:if>
                                                        <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) == 100}">
                                                            <p class="progress_head">You die !</p>
                                                        </c:if>
                                                    </c:if>
                                                    <div class="dropdown-divider"></div>
                                                    <div class="progress_bar">
                                                        <p class="mb-0">Deadline <i class="fas fa-clock"></i></p>
                                                            <c:if test="${contract.contract_remaining_time > contract.contract_job_duration*24}">
                                                            <span class="skill" style="width: 0%;"><span class="info_valume">0%</span></span>                
                                                            <div class="progress skill-bar ">
                                                                <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${contract.contract_remaining_time < contract.contract_job_duration*24}">
                                                            <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) <= 100}">
                                                                <span class="skill" style="width: ${contract.showDuration(Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)))}%;"><span class="info_valume">${contract.showDuration(Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)))}% </span></span>                
                                                                <div class="progress skill-bar ">
                                                                    <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: ${contract.showDuration(Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)))}%;"></div>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) > 100}">
                                                                <span class="skill" style="width: 100%;"><span class="info_valume text-danger">100% (end)</span></span>                
                                                                <div class="progress skill-bar ">
                                                                    <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
                                                                </div>
                                                            </c:if>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form action="FeedbackController" method="POST">
                                <c:if test="${sessionScope.MODE == 'EMPLOYER'}">
                                    <input name="idFreelancer" value="${contract.idPartner}" hidden=""/>
                                    <input name="idEmployer" value="${sessionScope.LOGIN_USER.id}" hidden=""/>
                                    <input name="idJob" value="${contract.contract_job_id}" hidden=""/>
                                </c:if>
                                <div style="font-family: 'The Girl Next Door', cursive" class="modal fade" id="feedbackModal">
                                    <div class="modal-dialog modal-dialog-centered modal-lg">
                                        <div class="modal-content">
                                            <div class="card text-center">
                                                <div class="circle-image">
                                                    <img src="${contract.contract_user_avatar}" width="40" />
                                                </div>
                                                <span class="dot"></span>
                                                <span class="name mb-1"><strong>Feedback</strong></span>
                                                <div class="mt-4">
                                                    <h5 class="mb-3">Write feedback to ${contract.contract_freelancer_name} : </h5>
                                                    <textarea style="width: 70%; border-radius: 6px; padding: 10px;" class="" name="contentFeedback" rows="3"
                                                              placeholder="Typing...." required=""></textarea>
                                                </div>
                                                <div class="rate bg-success text-white mt-3">
                                                    <h6 class="m-4">Rate your Freelancer</h6>
                                                    <div class="rating-wrapper row justify-content-center m-3">
                                                        <!-- star 1 -->
                                                        <input type="radio" id="1-star-rating" name="star-rating" value="5" />
                                                        <label for="1-star-rating" class="star-rating star">
                                                            <i class="fas fa-star d-inline-block"></i>
                                                        </label>

                                                        <!-- star 2 -->
                                                        <input type="radio" id="2-star-rating" name="star-rating" value="4" />
                                                        <label for="2-star-rating" class="star-rating star">
                                                            <i class="fas fa-star"></i>
                                                        </label>
                                                        <!-- star 3 -->
                                                        <input type="radio" id="3-star-rating" name="star-rating" value="3" />
                                                        <label for="3-star-rating" class="star-rating star">
                                                            <i class="fas fa-star"></i>
                                                        </label>
                                                        <!-- star 4 -->
                                                        <input type="radio" id="4-star-rating" name="star-rating" value="2" />
                                                        <label for="4-star-rating" class="star-rating star">
                                                            <i class="fas fa-star"></i>
                                                        </label>

                                                        <!-- star 5 -->
                                                        <input type="radio" id="5-star-rating" name="star-rating" value="1" />
                                                        <label for="5-star-rating" class="star-rating">
                                                            <i class="fas fa-star"></i>
                                                        </label>
                                                    </div>
                                                    <div class="buttons mt-0">
                                                        <button class="btn-warning btn-block rating-submit">
                                                            Finish
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </c:forEach>
                    </div>
                    <!-- end row -->
                    <div class="row column4 graph">
                        <c:forEach var="contractDetail" items="${requestScope.LIST_CONTRACT_DETAIL_FREELANCER}" varStatus="count">
                            <c:if test="${count.count == 1}">
                                <div style="display: block; height: 480px" class="col-md-12 mt-5 mb-5" id="contractCard${count.count}">
                                </c:if>
                                <c:if test="${count.count != 1}">
                                    <div style="display: none; height: 480px" class="col-md-12 mt-5 mb-5" id="contractCard${count.count}">
                                    </c:if>
                                    <div class="row">
                                        <div class="col-lg-6 mx-auto">
                                            <blockquote style="position: relative;" class="blockquote blockquote-custom bg-white p-5 shadow-lg rounded">
                                                <div style="width: 50px; height: 50px; position: absolute; top: -25px; left: 50px; line-height: 50px; text-align: center" class="blockquote-custom-icon bg-info shadow-sm rounded-circle justify-content-center">
                                                    <i class="fa fa-quote-left text-white"></i>
                                                </div>
                                                <!--content here-->
                                                <h1 class="text-center mb-3">${contractDetail.contract_job_tittle}</h1>
                                                <p class="mb-0 mt-2 "><strong>Description : </strong> ${contractDetail.contract_job_description}</p>
                                                <p class="mb-0 mt-2 "><strong>Salary : </strong> ${contractDetail.showPrice(contractDetail.contract_job_price)} VNĐ</p>
                                                <p class="mb-0 mt-2 ">
                                                    <span>
                                                        <strong>Start date : </strong> ${contractDetail.contract_job_start_date}
                                                    </span>
                                                    <i class="fas fa-arrow-right ml-5 mr-5"></i>
                                                    <span>
                                                        <strong>End date : </strong> ${contractDetail.contract_job_end_date}
                                                    </span>
                                                </p>
                                                <c:if test="${sessionScope.MODE == 'FREELANCER'}">
                                                    <h5 style="font-family: serif; margin-top: 10px">
                                                        <strong>File Submission :</strong>
                                                        <button style="width: 40px; height: 40px; line-height: 40px;" class="rounded-circle border-0 bg-success ml-4"><i class="fas fa-file-upload text-light"></i></button>
                                                    </h5>
                                                </c:if>
                                                <c:if test="${sessionScope.MODE == 'EMPLOYER'}">
                                                    <h5 style="font-family: serif; margin-top: 20px">
                                                        <strong>File Submission :</strong>
                                                        <button style="width: 40px; height: 40px; line-height: 40px;" class="rounded-circle border-0 bg-success ml-4"><i class="fas fa-file-upload text-light"></i></button>
                                                    </h5>
                                                    <h5 style="font-family: serif; margin-top: 15px">
                                                        <strong class="self-align-center">Ready to Finish :</strong>
                                                        <button class="btn btn-success border-0 ml-4 p-2 pl-4 pr-4" data-toggle="modal" data-target="#feedbackModal">Submit <i class="fas fa-check-double ml-3"></i></button>
                                                    </h5>
                                                </c:if>
                                                <footer class="blockquote-footer pt-4 mt-4 border-top font-italic">Handled by <span class="font-weight-bold">${contractDetail.contract_freelancer_name}</span></footer>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="row column4 graph">
                                <div class="col-md-4">
                                    <div class="white_shd full margin_bottom_30">
                                        <div class="full graph_head">
                                            <div class="heading1 margin_0">
                                                <h2>Lis Job Doing</h2>
                                            </div>
                                        </div>
                                        <div class="full progress_bar_inner">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="msg_section">
                                                        <div class="msg_list_main">
                                                            <ul class="msg_list">
                                                                <li>
                                                                    <span>
                                                                        <span class="name_user">Job title</span>
                                                                        <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                        <span style="padding-right: 18px;" class="time_ago">Start date</span>
                                                                        <span style="padding-left: 90px;" class="time_end">End date</span>
                                                                </li>     
                                                                <li>
                                                                    <span>
                                                                        <span class="name_user">Job title</span>
                                                                        <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                        <span style="padding-right: 18px;" class="time_ago">Start date</span>
                                                                        <span style="padding-left: 90px;" class="time_end">End date</span>
                                                                </li>  
                                                                <li>
                                                                    <span>
                                                                        <span class="name_user">Job title</span>
                                                                        <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                        <span style="padding-right: 18px;" class="time_ago">Start date</span>
                                                                        <span style="padding-left: 90px;" class="time_end">End date</span>
                                                                </li>   
                                                                <li>
                                                                    <span>
                                                                        <span class="name_user">Job title</span>
                                                                        <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                        <span style="padding-right: 18px;" class="time_ago">Start date</span>
                                                                        <span style="padding-left: 90px;" class="time_end">End date</span>
                                                                </li>                                           
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="white_shd full margin_bottom_30">
                                        <div class="full graph_head">
                                            <div class="heading1 margin_0">
                                                <h2>Job Title</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="white_shd full margin_bottom_30">
                                        <div class="full graph_head">
                                            <div class="heading1 margin_0">
                                                <h2>Update</h2>
                                            </div>
                                        </div>
                                        <div class="full progress_bar_inner">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="msg_list_main">
                                                        <ul class="msg_list">
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">Herman Beck</span>
                                                                    <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">On the other hand, we denounce.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">On the other hand, we denounce.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="white_shd full margin_bottom_30">
                                        <div class="full graph_head">
                                            <div class="heading1 margin_0">
                                                <h2>Daily feed</h2>
                                            </div>
                                        </div>
                                        <div class="full progress_bar_inner">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="msg_list_main">
                                                        <ul class="msg_list">
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">Herman Beck</span>
                                                                    <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">On the other hand, we denounce.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">Sales</span>
                                                                    <span class="msg_user">On the other hand, we denounce.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="white_shd full margin_bottom_30">
                                        <div class="full graph_head">
                                            <div class="heading1 margin_0">
                                                <h2>Last Comments</h2>
                                            </div>
                                        </div>
                                        <div class="full progress_bar_inner">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="msg_list_main">
                                                        <ul class="msg_list">
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">Herman Beck</span>
                                                                    <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">On the other hand, we denounce.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span>
                                                                    <span class="name_user">John Smith</span>
                                                                    <span class="msg_user">On the other hand, we denounce.</span>
                                                                    <span class="time_ago">12 min ago</span>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- footer -->
                            <!-- end dashboard inner -->
                        </div>
                    </div>
                    <jsp:include page="component/footer.jsp"></jsp:include>
                </div>
                <script src="./work-space/js/render_job_detail.js"></script>
                <!-- jQuery -->
                <script src="work-space/js/jquery.min.js"></script>
                <script src="work-space/js/popper.min.js"></script>
                <script src="work-space/js/bootstrap.min.js"></script>
                <!-- wow animation -->
                <script src="work-space/js/animate.js"></script>
                <!-- select country -->
                <script src="work-space/js/bootstrap-select.js"></script>
                <!-- owl carousel -->
                <script src="work-space/js/owl.carousel.js"></script> 
                <!-- chart js -->
                <script src="work-space/js/Chart.min.js"></script>
                <script src="work-space/js/Chart.bundle.min.js"></script>
                <script src="work-space/js/utils.js"></script>
                <script src="work-space/js/analyser.js"></script>
                <!-- nice scrollbar -->
                <script src="work-space/js/perfect-scrollbar.min.js"></script>
                <script>
                                                var ps = new PerfectScrollbar('#sidebar');
                </script>
                <!-- custom js -->
                <script src="work-space/js/custom.js"></script>
                <!-- calendar file css -->    
                <script src="work-space/js/semantic.min.js"></script>
                <script></script>
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
                <script>
                                                $('.dropdown-toggle').dropdown()
                </script>
                </body>
                </html>

