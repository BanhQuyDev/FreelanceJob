<%-- 
    Document   : job_listing
    Created on : May 28, 2022, 10:42:37 AM
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
                <div class="container">
                    <div style="margin-top: 25px">
                        <h1 style="text-align: center">Giải quyết khiếu nại</h1>
                        <div class="wrapper-content">
                            <div>
                                <p>Trong khi sử dụng trang kết nối vLance.vn, nếu bạn cần khiếu nại về dịch vụ, bạn có thể thực hiện theo các bước sau:</p>
                                <p>Bước 1: Gửi khiếu nại/yêu cầu xem xét qua email hỗ trợ của vLance hotro@vlance.vn</p>
                                <p>Bước 2: Bộ phận chăm sóc khách hàng của vLance.vn sẽ tiếp nhận khiếu nại và phản hồi tới bạn trong tối đa 72 giờ sau khi gửi. Tùy theo tính chất và mức độ khiếu nại, sau tối đa 10 ngày làm việc, vLance.vn sẽ liên hệ trao đổi với bạn để xác nhận vấn đề và phương án xử lý. Thời gian giải quyết một khiếu nại tối đa là 10 ngày làm việc</p>
                                <p>Bước 3: Trong trường hợp nằm ngoài khả năng và thẩm quyền của vLance.vn, vLance có quyền từ chối xử lý khiếu nại.</p>
                                <p>vLance.vn tôn trọng và nghiêm túc thực hiện các quy định của pháp luật về bảo vệ quyền lợi của thành viên. Vì vậy, đề nghị các bên gồm Khách hàng và Freelancer cần cung cấp đầy đủ, chính xác, trung thực và chi tiết các thông tin có liên quan đến vấn đề cần khiếu nại. Mọi hành vi lừa đảo, gian lận hoặc phá hoại, gây rối sẽ chịu hoàn toàn trách nhiệm trước pháp luật.</p>
                                <p>Trong trường hợp Khách hàng và Freelancer xảy ra mâu thuẫn. vLance.vn không có trách nhiệm giải quyết các mâu thuẫn này.&nbsp;</p>
                                <p>Địa chỉ nhận thư khiếu nại:&nbsp;<br>
                                    Địa chỉ:Your address goes here, your demo address<br>
                                    Điện thoại: +8880 44338899<br>
                                    Email: daihoc.hcm@fpt.edu.vn</p>
                                <p>&nbsp;</p>
                            </div> </div>
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
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(400, 0).slideUp(400, function () {
                    $(this).remove();
                });
            }, 3000);
        </script>
    </body>
</html>
