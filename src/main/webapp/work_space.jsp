<%-- 
    Document   : work_space
    Created on : Jun 19, 2022, 2:43:56 PM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <head>
        <!-- basic -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
        <link rel="stylesheet" href="assets/css/header_notifications.css"/>

        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      
        <![endif]-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .modal-dialog.feedbackk {
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
                height: 159px;
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

            body.modal-open {
                overflow: auto !important;
            }

            body.modal-open[style] {
                padding-right: 0px !important;
            }
            body:not(.modal-open){
                padding-right: 0px !important;
            }
            /* =============================== */
            .timeline {
                /*width: 800px;*/
                background-color: #072736;
                color: #fff;
                padding: 30px 60px;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, .5);
            }

            .timeline ul {
                list-style-type: none;
                border-left: 3px solid #094a68;
                padding: 10px 5px;
            }

            .timeline ul li {
                padding: 20px;
                position: relative;
                cursor: pointer;
                transition: .5s;
            }

            .timeline ul li span {
                display: inline-block;
                background-color: #1685b8;
                border-radius: 25px;
                padding: 5px 15px;
                font-size: 15px;
                text-align: center;
                transition: 0.3s linear;
            }

            .timeline ul li .content h3 {
                color: #34ace0;
                font-size: 18px;
                padding-top: 18px;
            }

            .timeline ul li .content p {
                font-size: 15px;
                color: #fff;
            }

            .timeline ul li:before {
                position: absolute;
                content: '';
                width: 10px;
                height: 10px;
                background-color: #34ace0;
                border-radius: 50%;
                left: -12px;
                top: 30px;
                transition: .5s;
            }

            .timeline ul li:hover {
                background-color: #071f2a7f;
            }
            .timeline ul li:hover span{
                margin: 0px 10px;
                transition: 0.3s linear;
            }
            .timeline ul li:hover:before {
                background-color: #0F0;
                box-shadow: 0px 0px 10px 2px #0F0;
            }

            .timeline ul .overtime span{
                opacity: 0.5;
            }
            .timeline ul .overtime .content{
                opacity: 0.5;
            }
            .timeline ul li.overtime:hover:before {
                background-color: rgba(249, 55, 55, 0.968);
                box-shadow: 0px 0px 10px 4px rgba(249, 55, 55, 0.968);
            }

            @media (max-width:300px) {
                .timeline {
                    width: 100%;
                    padding: 30px 5px 30px 10px;
                }

                .timeline ul li .content h3 {
                    color: #34ace0;
                    font-size: 15px;
                }

            }
            /* =============================== */
            .mileStoneModal {
                display: flex;
                position: absolute;
                top: -9%;
                right: 5%;
            }
            .btn_milestone {
                border: 1px solid #5255f3;
                border-radius: 5px;
                position: relative;
                overflow: hidden;
                font-size: 18px;
                padding: 10px;
                color: #5255f3 !important;
                background-color: white;
                font-weight: 500;
            }
            .btn_milestone:hover {
                box-shadow: 1px 1px 25px 5px rgba(146, 148, 248, 0.4);
                /*color: #5255f3 !important;*/
            }
            .btn_milestone:before {
                content: "";
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(120deg, transparent,rgba(146, 148, 248, 0.4), transparent);
                transition: all 650ms;
            }
            .btn_milestone:hover:before {
                left: 100%;
            }
            
            .timeline:hover h2 i{
                transform: rotate(360deg);
                transition: 0.8s linear;
            }
            .timeline>h2 i{
                transition: 0.5s linear;
            }
        </style>
    </head>
    <body class="" style="padding-right: 0 !important">
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

                                    <div class="info_people" style="height: 280px; position: relative">
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
                                            <button class="buttonVip border-0" onclick="showJobDetail(${requestScope.CONTRACT_DETAIL_SIZE}, ${count.count})"><a href="#contractCard${count.count}" style="color: white">View Detail</a></button> <a class="buttonVip border-0 ml-4" href="ShowMessage?idSend=${sessionScope.LOGIN_USER.id}&idReceive=${contract.idPartner}">Chat</a>
                                        </div>

                                        <c:if test="${sessionScope.MODE == 'EMPLOYER'}">
                                            <div class="mileStoneModal" style="cursor: pointer">
                                                <a class="btn_milestone" style="text-decoration: none;" data-toggle="modal" data-target="#milestoneModal${count.count}">Milestone <i class="fas fa-plus"></i></a>
                                            </div>
                                        </c:if>
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
                                                            <p class="progress_head">You have plenty of time </br> Happy Code Happy Life <3</p>
                                                        </c:if>
                                                        <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) > 50 && Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) <= 85}">
                                                            <p class="progress_head">Half of the time has passed </br> Try Harder !!</p>
                                                        </c:if>
                                                        <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) > 85 && Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) <= 100}">
                                                            <p class="progress_head">Time is running out </br> Hurry up !!</p>
                                                        </c:if>
                                                        <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) == 100}">
                                                            <p class="progress_head">Prepare to submit !</p>
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
                                                                <span class="skill" style="width: ${contract.showDuration(Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)))}%;">
                                                                    <c:if test="${contract.showDuration(Math.floor(contract.contract_remaining_time/24)) == 1}">
                                                                        <span class="info_valume">
                                                                            <strong class="text-danger">${contract.showDuration(Math.ceil(contract.contract_remaining_time/24))}</strong> day left !
                                                                        </span>
                                                                    </c:if>
                                                                    <c:if test="${contract.showDuration(Math.floor(contract.contract_remaining_time/24)) != 1}">
                                                                        <span class="info_valume">
                                                                            <strong class="text-danger">${contract.showDuration(Math.ceil(contract.contract_remaining_time/24))}</strong> days left !
                                                                        </span>
                                                                    </c:if>
                                                                </span>                
                                                                <div class="progress skill-bar ">
                                                                    <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: ${contract.showDuration(Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)))}%;"></div>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${Math.floor(100-((contract.contract_remaining_time/(contract.contract_job_duration*24))*100)) > 100}">
                                                                <span class="skill" style="width: 100%;"><span class="info_valume text-danger">Overdue (end)</span></span>                
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
                                <div class="modal fade" id="feedbackModal${count.count}" style="font-family: 'The Girl Next Door', cursive">
                                    <div class="modal-dialog modal-dialog-centered modal-lg feedbackk">
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
                                                    <h6 class="mt-4">Rate your Freelancer</h6>
                                                    <span id="ratingText_${count.count}" style="font-size: 17px; font-weight: 600;">rating</span>
                                                    <div class="rating-wrapper row justify-content-center mb-3 mt-3">
                                                        <!-- star 5 -->
                                                        <input type="radio" id="1-star-rating_${count.count}" name="star-rating" value="5" />
                                                        <label for="1-star-rating_${count.count}" class="star-rating star">
                                                            <i class="fas fa-star" onclick="renderRating(5, ${count.count})"></i>
                                                        </label>

                                                        <!-- star 4 -->
                                                        <input type="radio" id="2-star-rating_${count.count}" name="star-rating" value="4" />
                                                        <label for="2-star-rating_${count.count}" class="star-rating star">
                                                            <i class="fas fa-star" onclick="renderRating(4, ${count.count})"></i>
                                                        </label>
                                                        <!-- star 3 -->
                                                        <input type="radio" id="3-star-rating_${count.count}" name="star-rating" value="3" />
                                                        <label for="3-star-rating_${count.count}" class="star-rating star">
                                                            <i class="fas fa-star" onclick="renderRating(3, ${count.count})"></i>
                                                        </label>
                                                        <!-- star 2 -->
                                                        <input type="radio" id="4-star-rating_${count.count}" name="star-rating" value="2" />
                                                        <label for="4-star-rating_${count.count}" class="star-rating star">
                                                            <i class="fas fa-star" onclick="renderRating(2, ${count.count})"></i>
                                                        </label>

                                                        <!-- star 1 -->
                                                        <input type="radio" id="5-star-rating_${count.count}" name="star-rating" value="1" />
                                                        <label for="5-star-rating_${count.count}" class="star-rating">
                                                            <i class="fas fa-star" onclick="renderRating(1, ${count.count})"></i>
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

                            <div class="modal fade" id="milestoneModal${count.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-xl" style="max-width: 700px !important">
                                    <div class="modal-content">
                                        <div class="timeline">
                                            <div class="row mb-3 justify-content-between">
                                                <h1 class="col-6 justify-content-center align-self-center">Milestone</h1>
                                                <button class="col-4" style="background-color: transparent; border: none; font-size: 35px; cursor: pointer;" onclick="addMilestone(${count.count}, '${contract.contract_job_start_date}', '${contract.contract_job_end_date}')"><i class="far fa-plus-square mr-3"></i><span class="align-self-center" style="font-size: 14px; transform: translateY(-8px);">Add new one</span> </button>
                                            </div>
                                            <form action="AddMilestoneController" method="POST">
                                                <ul id="addMilestoneId${count.count}">
                                                    <li class="countMilestone">
                                                        <strong>From </strong> <span class="ml-3"><input name="startDate1" type="date" min="${contract.contract_job_start_date}" max="${contract.contract_job_end_date}" style="background-color: transparent; color: white; border: none; font-size: 18px"/></span>
                                                        <strong class="ml-3">To </strong> <span class="ml-3"><input name="endDate1" type="date" min="${contract.contract_job_start_date}" max="${contract.contract_job_end_date}" style="background-color: transparent; color: white; border: none; font-size: 18px"/></span>
                                                        <span class="ml-3 bg-danger"><i class="fas fa-minus"></i></span>
                                                        <div class="content">
                                                            <h3>Milestone Tittle <input name="tittle1" required="" style="border-radius: 5px; margin-left: 15px; padding: 10px; width: 65%"/></h3>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <div class="text-right">
                                                    <button style="background-color: #1685b8; color: white; padding: 15px 25px; font-size: 20px; border-radius: 10px; cursor: pointer; ">Create <i class="fas fa-feather-alt ml-3"></i></button>
                                                </div>
                                                <input type="hidden" name="idJob" value="${contract.contract_job_id}"/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- end row -->
                    <c:forEach var="contractDetail" items="${requestScope.LIST_CONTRACT_DETAIL_FREELANCER}" varStatus="count">
                        <div class="row column4 graph justify-content-center">
                            <c:if test="${count.count == 1}">
                                <div style="display: block" class="col-lg-4 align-self-center" role="milestone" id="milestoneCard${count.count}">
                                </c:if>
                                <c:if test="${count.count != 1}">
                                    <div style="display: none" class="col-lg-4 align-self-center" role="milestone" id="milestoneCard${count.count}">
                                    </c:if>
                                    <div role="milestone">
                                        <div class="timeline">
                                            <h2 class="mb-4">Milestone <i class="fas fa-hourglass ml-3"></i></h2>
                                            <ul>
                                                <c:forEach var="milestone" items="${contractDetail.contract_list_milestone}">
                                                    <c:if test="${milestone.status == 1}">
                                                        <li>
                                                        </c:if>
                                                        <c:if test="${milestone.status == 0}">
                                                        <li class="overtime">
                                                        </c:if>
                                                        <label style="font-size: 20px; margin-right: 10px">Period </label>
                                                        <span>${milestone.startDate}</span>
                                                        <i class="fas fa-long-arrow-alt-right ml-2 mr-2" style="font-size: 20px;"></i>
                                                        <span>${milestone.endDate}</span>
                                                        <div class="content">
                                                            <p style="font-size: 20px; margin: 8px 0px">Tittle</p>
                                                            <h3 style="background-color: #1685b8; border-radius: 15px; color: white; padding: 15px; font-size: 17px; font-weight: 400;">${milestone.tittle}</h3>
                                                        </div>
                                                    </li>
                                                    <c:if test="${contractDetail.contract_list_milestone.size() == 0}">
                                                        <li>
                                                            <span>${contractDetail.contract_job_start_date}</span>
                                                            <i class="fas fa-long-arrow-alt-right"></i>
                                                            <span>${contractDetail.contract_job_end_date}</span>
                                                            <div class="content">
                                                                <h3>No milestones have been added yet !!</h3>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <c:if test="${count.count == 1}">
                                    <div style="display: block;" class="col-md-7 align-self-center" id="contractCard${count.count}">
                                    </c:if>
                                    <c:if test="${count.count != 1}">
                                        <div style="display: none;" class="col-md-7 align-self-center" id="contractCard${count.count}">
                                        </c:if>
                                        <div role="detail">
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
                                                        <button class="btn btn-success border-0 ml-4 p-2 pl-4 pr-4" data-toggle="modal" data-target="#feedbackModal${count.count}">Submit <i class="fas fa-check-double ml-3"></i></button>
                                                    </h5>
                                                </c:if>
                                                <footer class="blockquote-footer pt-4 mt-4 border-top font-italic">Handled by <span class="font-weight-bold">${contractDetail.contract_freelancer_name}</span></footer>
                                            </blockquote>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>

                            <div class="row column4 graph mt-5">
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

