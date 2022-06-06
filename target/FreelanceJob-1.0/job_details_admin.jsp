<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Job Detail</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="manifest" href="site.webmanifest" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="assets/img/favicon.ico"
            />

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
        <!--<link rel="stylesheet" href="assets/css/editlogin.css" />-->

    </head>
    <body>
        <section class="site-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-12">
                        <form class="p-4 p-md-5 border rounded" method="post" style="width: 70%; margin: auto; margin-top: 4%">
                            <c:set var="job" value="${requestScope.JOB}"/>
                            <h3 class="text-black mb-5 border-bottom pb-2" style="text-align: center;">JOB INFORMATION</h3>
                            <div class="form-group">
                                <label for="job-title">Job Title</label>
                                <input
                                    type="text"
                                    name="title"
                                    class="form-control"
                                    value="${job.title}"
                                    readonly=""
                                    />
                            </div>
                            <div class="form-group">
                                <label for="job-price">Price</label>
                                <c:set var="salary" value="${job.salary}"/>
                                <input
                                    type="text"
                                    name="salary"
                                    class="form-control"
                                    readonly=""
                                    value="${job.showPrice(salary)} VND"
                                    />
                            </div>
                            <div class="form-group">
                                <label for="job-duration">Duration (by day)</label>
                                <input
                                    type="number"
                                    name="duration"
                                    class="form-control"
                                    value="${job.duration}"
                                    readonly=""
                                    />
                            </div>

                            <div class="form-group">
                                <label for="job-major">Major</label>
                                <input
                                    type="text"
                                    name="major"
                                    class="form-control"
                                    value="${job.idMajor}"
                                    readonly=""
                                    />
                            </div>

                            <div class="form-group">
                                <label for="job_description">Job Description</label>
                                <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3" readonly="">${job.description}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="job-created">Created By</label>
                                <input
                                    type="text"
                                    name="employer"
                                    class="form-control"
                                    value="${job.nameEmployer}"
                                    readonly=""
                                    />
                            </div>

                            <div class="form-group">
                                <label>Start Date</label>
                                <input type="date" name="startDate" class="form-control" id="date_picker" value="${job.startDate}" readonly="">
                            </div>
                            <div class="form-group">
                                <label>Create Date</label>
                                <input type="date" name="startDate" class="form-control" id="date_picker" value="${job.createDate}" readonly="">
                            </div>
                            <a href="GetAllJob" class="btn btn-block btn-primary btn-md" style="border-radius: 20px; margin: 10px 0px">Back</a>
                            <c:choose>
                                <c:when test="${job.status == 'Spam'}">
                                    <a href="AcceptJobController?idJob=${job.idJob}" class="btn btn-success" style="width: 100%; color: white; text-align: center; border-radius: 20px; margin: 10px 0px">Recovery</a>
                                    <a href="DenyJobController?idJob=${job.idJob}" class="btn btn-danger" style="width: 100%; color: white; text-align: center; border-radius: 20px; margin: 10px 0px">Delete</a>
                                </c:when>                         
                                <c:otherwise>
                                    <a href="UnappropriatedJobController?idJob=${job.idJob}" class="btn btn-danger" style="width: 100%; color: white; text-align: center; border-radius: 20px; margin: 10px 0px">Spam</a>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>

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
    </body>
</html>
