<%-- 
    Document   : job_listing
    Created on : May 28, 2022, 10:42:37 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" href="assets/css/price_rangs.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/editlogin.css">
        <link rel="stylesheet" href="assets/css/header_notifications.css"/>
    </head>

    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
            <main>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
                <div class="container" style="margin-top: 20px ">
                <c:if test="${sessionScope.MODE eq 'FREELANCER'}">
                    <div style="width: 500px; margin: auto">
                        <div class="col-lg-12">
                            <div class="boxrounded bg-white mb-3" style="box-shadow: rgb(0 0 0 / 12%) 0 3px 13px 1px;">
                                <div class="box-title p-3">
                                    <div class="d-flex">
                                        <p class="m-0" style="font-size: 20px; font-weight: 700" >Notifications</p>

                                        <span class="ml-auto mb-auto">
                                            <div class="btn-group">
                                                <button type="button" class="rounded notifications-button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <img src="assets/img/notifications/dots-horizontal.svg" alt="alt"/>
                                                </button>
                                                <form action="GetAllNotifycationsController" method="POST">
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <button name="readAll" value="readAll" class="dropdown-item" type="submit" style="font-size: 16px; font-family: 700; cursor: pointer"><i class="fa-solid fa-check mr-1"></i> Mark as read</button>
                                                        <button name="deleteAll" value="readAll" class="dropdown-item" type="submit" style="font-size: 16px; font-family: 700; cursor: pointer"><i class="fa-solid fa-trash-can mr-1"></i> Delete All</button>                                                       
                                                        <c:if test="${requestScope.UN_READ != null}">
                                                            <input type="hidden" name="unRead">
                                                        </c:if>
                                                    </div>
                                                </form>
                                            </div>

                                        </span>


                                    </div>
                                    <div class="d-flex justify-content-left align-items-center" style="gap: 10px; margin-top: 10px">
                                        <c:if test="${requestScope.UN_READ != null}">
                                            <a href="GetAllNotifycationsController" class="unread_hover" style="color: black;
                                               font-weight: 600;
                                               padding: 4px 20px;
                                               border-radius: 16px;

                                               ">All</a>
                                            <form action="GetAllNotifycationsController" method="POST">
                                                <button name="unRead" type="submit" class="unread_hover" style="color: #FB246A;
                                                        padding: 4px 20px;
                                                        background-color: rgba(45, 136, 255, 0.2);
                                                        border-radius: 16px;
                                                        font-weight: 600;
                                                        border: none;
                                                        cursor: pointer             
                                                        ">Unread
                                                </button>
                                            </form>
                                        </c:if>
                                        <c:if test="${requestScope.UN_READ == null}">
                                            <a href="GetAllNotifycationsController" class="unread_hover" style="color: #FB246A;
                                               padding: 4px 20px;
                                               background-color: rgba(45, 136, 255, 0.2);
                                               border-radius: 16px;
                                               font-weight: 600;
                                               ">All</a>
                                            <form action="GetAllNotifycationsController" method="POST">
                                                <button name="unRead" type="submit" class="unread_hover" style="color: black;
                                                        font-weight: 600;
                                                        padding: 4px 20px;
                                                        border-radius: 16px;
                                                        cursor: pointer;
                                                        border: none
                                                        ">Unread
                                                </button>
                                            </form>
                                        </c:if>
                                    </div>
                                </div>


                                <div class="box-title border-bottom p-3">
                                    <c:if test="${requestScope.UN_READ != null}">
                                        <c:if test="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD.size() == 0}"></c:if>
                                        <c:if test="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD.size() != 0}">
                                            <h6 class="m-0">Recent</h6>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${requestScope.UN_READ == null}">
                                        <c:if test="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD.size() == 0 
                                                      && sessionScope.LIST_NOTIFICATIONS_FREELANCER_READ.size() == 0}"></c:if>
                                        <c:if test="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD.size() != 0 
                                                      || sessionScope.LIST_NOTIFICATIONS_FREELANCER_READ.size() != 0}">
                                              <h6 class="m-0">Recent</h6>
                                        </c:if>
                                    </c:if>
                                </div>

                                <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_UNREAD}" var="LN">
                                    <div class="box-body p-0 notification__unread mb-2 position-relative">
                                        <a href="#" class="p-3 d-flex align-items-center border osahan-post-header unread_hover">
                                            <div class="dropdown-list-image mr-3">
                                                <img class="rounded-circle" src="${LN.avatar != null ? LN.avatar : 'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="" />
                                            </div>
                                            <div class="font-weight-bold mr-3">
                                                <div class="text-truncate" style="color: #FB246A">${LN.employerName}</div>
                                                <div class="big" style="color: black">${LN.content}</div>
                                            </div>

                                            <span class="ml-auto mb-auto" style="text-align: right;">
                                                <div class="btn-group__hover">
                                                    <button type="button" class="rounded notification__button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="mdi mdi-dots-vertical"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right ">
                                                        <form action="GetAllNotifycationsController" method="POST">
                                                            <button class="dropdown-item " name="delete" type="submit" style="cursor: pointer"><i class="fa-solid fa-trash-can"></i> Delete</button>
                                                            <button class="dropdown-item" name="read" type="submit" style="cursor: pointer"><i class="fa-solid fa-check mr-1"></i> Read</button>
                                                            <input type="hidden" name="id_noti" value="${LN.id_noti}">
                                                            <c:if test="${requestScope.UN_READ != null}">
                                                                <input type="hidden" name="unRead">
                                                            </c:if>
                                                        </form>
                                                    </div>
                                                    <br />
                                                    <div class="text-right text-muted pt-1">${LN.timeAgo}</div>
                                                </div>
                                            </span>

                                        </a>
                                    </div>
                                </c:forEach>
                                <c:if test="${requestScope.UN_READ == null}">
                                    <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_FREELANCER_READ}" var="LN">
                                        <div class="box-body p-0 mb-2">
                                            <a href="#" class="p-3 d-flex align-items-center border osahan-post-header unread_hover">
                                                <div class="dropdown-list-image mr-3">
                                                    <img class="rounded-circle" src="${LN.avatar != null ? LN.avatar : 'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="" />
                                                </div>
                                                <div class="font-weight-bold mr-3">
                                                    <div class="text-truncate" style="color: #FB246A">${LN.employerName}</div>
                                                    <div class="big" style="color: black">${LN.content}</div>
                                                </div>

                                                <span class="ml-auto mb-auto" style="text-align: right;">
                                                    <div class="btn-group__hover">
                                                        <button type="button" class="rounded notification__button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="mdi mdi-dots-vertical"></i>
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right ">
                                                            <form action="GetAllNotifycationsController" method="POST">
                                                                <button class="dropdown-item " name="delete" type="submit" style="cursor: pointer"><i class="fa-solid fa-trash-can"></i> Delete</button>
                                                                <input type="hidden" name="id_noti" value="${LN.id_noti}">
                                                            </form>
                                                        </div>
                                                        <br />
                                                        <div class="text-right text-muted pt-1">${LN.timeAgo}</div>
                                                    </div>
                                                </span>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                            <c:if test="${sessionScope.MODE eq 'EMPLOYER'}">
                                <div style="width: 500px; margin: auto">
                                    <div class="col-lg-12">
                                        <div class="boxrounded bg-white mb-3" style="box-shadow: rgb(0 0 0 / 12%) 0 3px 13px 1px;">
                                            <div class="box-title p-3">
                                                <div class="d-flex">
                                                    <p class="m-0" style="font-size: 20px; font-weight: 700" >Notifications</p>

                                                    <span class="ml-auto mb-auto">
                                                        <div class="btn-group">
                                                            <button type="button" class="rounded notifications-button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <img src="assets/img/notifications/dots-horizontal.svg" alt="alt"/>
                                                            </button>
                                                            <form action="GetAllNotifycationsController" method="POST">
                                                                <div class="dropdown-menu dropdown-menu-right">
                                                                    <button name="readAll" value="readAll" class="dropdown-item" type="submit" style="font-size: 16px; font-family: 700; cursor: pointer"><i class="fa-solid fa-check mr-1"></i> Mark as read</button>
                                                                    <button name="deleteAll" value="readAll" class="dropdown-item" type="submit" style="font-size: 16px; font-family: 700; cursor: pointer"><i class="fa-solid fa-trash-can mr-1"></i> Delete All</button>                                                       
                                                                    <c:if test="${requestScope.UN_READ != null}">
                                                                        <input type="hidden" name="unRead">
                                                                    </c:if>
                                                                </div>
                                                            </form>
                                                        </div>

                                                    </span>


                                                </div>
                                                <div class="d-flex justify-content-left align-items-center" style="gap: 10px; margin-top: 10px">
                                                    <c:if test="${requestScope.UN_READ != null}">
                                                        <a href="GetAllNotifycationsController" class="unread_hover" style="color: black;
                                                           font-weight: 600;
                                                           padding: 4px 20px;
                                                           border-radius: 16px;

                                                           ">All</a>
                                                        <form action="GetAllNotifycationsController" method="POST">
                                                            <button name="unRead" type="submit" class="unread_hover" style="color: #FB246A;
                                                                    padding: 4px 20px;
                                                                    background-color: rgba(45, 136, 255, 0.2);
                                                                    border-radius: 16px;
                                                                    font-weight: 600;
                                                                    border: none;
                                                                    cursor: pointer             
                                                                    ">Unread
                                                            </button>
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${requestScope.UN_READ == null}">
                                                        <a href="GetAllNotifycationsController" class="unread_hover" style="color: #FB246A;
                                                           padding: 4px 20px;
                                                           background-color: rgba(45, 136, 255, 0.2);
                                                           border-radius: 16px;
                                                           font-weight: 600;
                                                           ">All</a>
                                                        <form action="GetAllNotifycationsController" method="POST">
                                                            <button name="unRead" type="submit" class="unread_hover" style="color: black;
                                                                    font-weight: 600;
                                                                    padding: 4px 20px;
                                                                    border-radius: 16px;
                                                                    cursor: pointer;
                                                                    border: none
                                                                    ">Unread
                                                            </button>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </div>


                                            <div class="box-title border-bottom p-3">
                                                <c:if test="${requestScope.UN_READ != null}">
                                                    <c:if test="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD.size() == 0}"></c:if>
                                                    <c:if test="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD.size() != 0}">
                                                        <h6 class="m-0">Recent</h6>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.UN_READ == null}">
                                                    <c:if test="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD.size() == 0 
                                                                  && sessionScope.LIST_NOTIFICATIONS_EMPLOYER_READ.size() == 0}"></c:if>
                                                    <c:if test="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD.size() != 0 
                                                                  || sessionScope.LIST_NOTIFICATIONS_EMPLOYER_READ.size() != 0}">
                                                          <h6 class="m-0">Recent</h6>
                                                    </c:if>
                                                </c:if>
                                            </div>

                                            <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_UNREAD}" var="LN">
                                                <div class="box-body p-0 notification__unread mb-2 position-relative">
                                                    <a href="GetAllFreelancerApplyController?id_noti=${LN.id_noti}" class="p-3 d-flex align-items-center border osahan-post-header unread_hover">
                                                        <div class="dropdown-list-image mr-3">
                                                            <img class="rounded-circle" src="${LN.avatar != null ? LN.avatar : 
                                                                                               'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="" />
                                                        </div>
                                                        <div class="font-weight-bold mr-3">
                                                            <div class="text-truncate" style="color: #FB246A">${LN.employerName}</div>
                                                            <div class="big" style="color: black">${LN.content}</div>
                                                        </div>
                                                        <span class="ml-auto mb-auto" style="text-align: right;">
                                                            <div class="btn-group__hover">
                                                                <button type="button" class="rounded notification__button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    <i class="mdi mdi-dots-vertical"></i>
                                                                </button>
                                                                <div class="dropdown-menu dropdown-menu-right ">
                                                                    <form action="GetAllNotifycationsController" method="GET">
                                                                        <button class="dropdown-item " name="delete" type="submit" style="cursor: pointer"><i class="fa-solid fa-trash-can"></i> Delete</button>
                                                                        <button class="dropdown-item" name="read" type="submit" style="cursor: pointer"><i class="fa-solid fa-check mr-1"></i> Read</button>
                                                                        <input type="hidden" name="id_noti" value="${LN.id_noti}">
                                                                        <c:if test="${requestScope.UN_READ != null}">
                                                                            <input type="hidden" name="unRead">
                                                                        </c:if>
                                                                    </form>
                                                                </div>
                                                                <br />
                                                                <div class="text-right text-muted pt-1">${LN.timeAgo}</div>
                                                            </div>
                                                        </span>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                            <c:if test="${requestScope.UN_READ == null}">
                                                <c:forEach items="${sessionScope.LIST_NOTIFICATIONS_EMPLOYER_READ}" var="LN">
                                                    <div class="box-body p-0 mb-2">
                                                        <a href="GetAllFreelancerApplyController?id_noti=${LN.id_noti}" class="p-3 d-flex align-items-center border osahan-post-header unread_hover">
                                                            <div class="dropdown-list-image mr-3">
                                                                <img class="rounded-circle" src="${LN.avatar != null ? LN.avatar : 'https://png.pngtree.com/png-vector/20190803/ourlarge/pngtree-avatar-user-basic-abstract-circle-background-flat-color-icon-png-image_1647265.jpg'}" alt="" />
                                                            </div>
                                                            <div class="font-weight-bold mr-3">
                                                                <div class="text-truncate" style="color: #FB246A">${LN.employerName}</div>
                                                                <div class="big" style="color: black">${LN.content}</div>
                                                            </div>

                                                            <span class="ml-auto mb-auto" style="text-align: right;">
                                                                <div class="btn-group__hover">
                                                                    <button type="button" class="rounded notification__button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="mdi mdi-dots-vertical"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right ">
                                                                        <form action="GetAllNotifycationsController" method="POST">
                                                                            <button class="dropdown-item " name="delete" type="submit" style="cursor: pointer"><i class="fa-solid fa-trash-can"></i> Delete</button>
                                                                            <input type="hidden" name="id_noti" value="${LN.id_noti}">
                                                                        </form>
                                                                    </div>
                                                                    <br />
                                                                    <div class="text-right text-muted pt-1">${LN.timeAgo}</div>
                                                                </div>
                                                            </span>
                                                        </a>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </main>
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

                        <!-- Jquery Slick , Owl-Carousel Range -->
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
