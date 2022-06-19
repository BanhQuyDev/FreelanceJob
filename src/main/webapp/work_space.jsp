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
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="inner_page widgets">
        <div class="full_container">
            <jsp:include page="component/header.jsp"></jsp:include>
                <!-- dashboard inner -->
                <div class="midde_cont">
                    <div class="container-fluid">
                        <div class="row column_title">
                            <div class="col-md-12">
                                <div class="page_title">
                                    <h2>Work Space</h2>
                                </div>
                            </div>
                        </div>
                        <!-- row -->
                        <div class="row column1">
                            <div class="col-md-6 col-lg-4">
                                <div class="full white_shd margin_bottom_30">
                                    <div class="info_people">
                                        <div class="p_info_img">
                                            <img src="work-space/images/layout_img/msg2.png" alt="#" />
                                        </div>
                                        <div class="user_info_cont">
                                            <h4>Smith</h4>
                                            <p>developer@gmail.com</p>
                                            <p class="p_status">Developer</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="full white_shd margin_bottom_30">
                                    <div class="info_people">
                                        <div class="p_info_img">
                                            <img src="work-space/images/layout_img/msg3.png" alt="#" />
                                        </div>
                                        <div class="user_info_cont">
                                            <h4>David</h4>
                                            <p>developer@gmail.com</p>
                                            <p class="p_status">Developer</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="full white_shd margin_bottom_30">
                                    <div class="info_people">
                                        <div class="p_info_img">
                                            <img src="work-space/images/layout_img/msg4.png" alt="#" />
                                        </div>
                                        <div class="user_info_cont">
                                            <h4>John</h4>
                                            <p>developer@gmail.com</p>
                                            <p class="p_status">Tester</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <!-- row -->
                        <div class="row margin_bottom_30">
                            <div class="col-md-12 col-lg-4 widget_progress_section margin_bottom_30">
                                <div class="white_shd full">
                                    <div class="widget_progress_bar">
                                        <p class="progress_no">73%</p>
                                        <p class="progress_head">Sed ut perspi ciatis unde</p>
                                        <div class="progress_bar">
                                            <!-- Skill Bars -->
                                            <span class="skill" style="width:73%;">Lorem ipsum dolor sit amet <span class="info_valume">73%</span></span>                  
                                            <div class="progress skill-bar ">
                                                <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: 73%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4 widget_progress_section margin_bottom_30">
                                <div class="white_shd full">
                                    <div class="widget_progress_bar">
                                        <p class="progress_no">90%</p>
                                        <p class="progress_head">Sed ut perspi ciatis unde</p>
                                        <div class="progress_bar">
                                            <!-- Skill Bars -->
                                            <span class="skill" style="width:90%;">Lorem ipsum dolor sit amet <span class="info_valume">90%</span></span>                  
                                            <div class="progress skill-bar ">
                                                <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4 widget_progress_section margin_bottom_30">
                                <div class="white_shd full">
                                    <div class="widget_progress_bar">
                                        <p class="progress_no">85%</p>
                                        <p class="progress_head">Sed ut perspi ciatis unde</p>
                                        <div class="progress_bar">
                                            <!-- Skill Bars -->
                                            <span class="skill" style="width:85%;">Lorem ipsum dolor sit amet <span class="info_valume">85%</span></span>                  
                                            <div class="progress skill-bar ">
                                                <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
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
            $(function () {
                $('[data-toggle="popover"]').popover(),
                        $('.popover-dismiss').popover({
                    trigger: 'focus'
                })
            })
        </script>
    </body>
</html>

