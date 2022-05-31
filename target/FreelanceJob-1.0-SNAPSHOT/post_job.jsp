<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>

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
        <link rel="stylesheet" href="css/custom-bs.css">
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="css/bootstrap-select.min.css">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="fonts/line-icons/style.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/quill.snow.css">
        <link rel="stylesheet" href="assets/css/editlogin.css">

    </head>
    <body>

        <section class="site-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-12">
                        <form action="PostJobController" class="p-4 p-md-5 border rounded" method="post" >
                            <h3 class="text-black mb-5 border-bottom pb-2" style="text-align: center;">POST JOB FORM</h3>
                            <div class="form-group">
                                <label for="job-title">Job Title</label>
                                <input
                                    type="text"
                                    name="title"
                                    class="form-control"
                                    id="tile"
                                    placeholder="Title"
                                    required=""
                                    />
                            </div>
                            <div class="form-group">
                                <label for="job-title">Price</label>
                                <input
                                    type="number"
                                    name="salary"
                                    class="form-control"
                                    id="job-title"
                                    placeholder="1.000.000"
                                    min="100000"
                                    title="The price of project must be greater than 100.000 VN?"
                                    required=""
                                    />
                            </div>
                            <div class="form-group">
                                <label for="job-location">Duration (by day)</label>
                                <input
                                    type="number"
                                    name="duration"
                                    class="form-control"
                                    id="job-location"
                                    placeholder="Duration"
                                    required="Duration must be greater than 1 day"
                                    min="1"
                                    />
                            </div>

                            <div class="form-group">
                                <label for="job-region">Major</label>
                                <c:set var="major" value="${sessionScope.MAJOR}"/>
                                <select
                                    class="form-select border rounded"
                                    name="cmbMajor";
                                    id="job-region"
                                    data-style="btn-black"
                                    data-width="100%"
                                    data-live-search="true"
                                    >
                                    <c:forEach var="item" items="${major}">
                                        <option value="${item.id_major}">${item.major_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div style="margin-top: 6%" class="form-group">
                                <label for="description">Job Description</label>
                                <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                            </div>

                            <!--                            <div style="margin-top: 6%" class="form-group">
                                                            <label for="job-description">Job Description</label>
                                                            <div class="editor" name="description" id="editor-1">
                                                                <p>Write Job Description!</p>
                                                            </div>
                                                        </div>-->

                            <div class="form-group">
                                <label>Start Date</label>
                                <input type="date" name="startDate" class="form-control" id="date_picker" placeholder="Start Date" required="">
                            </div>

                            <!--                            <div class="form-group">
                                                            <label for="company-website-tw d-block">Upload Featured Image</label>
                                                            <br />
                                                            <label class="btn btn-primary btn-md btn-file" style="color: white; background-color: #f27229; border-radius: 0px; border-color: #f27229">
                                                                Browse File<input type="file" hidden />
                                                            </label>
                                                        </div>-->

                            <div class="row align-items-center mb-5">
                                <div class="col-lg-4 ml-auto">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="index.jsp" class="btn btn-block btn-light btn-md"
                                               ><span class="icon-open_in_new mr-2"></span>Back</a
                                            >
                                        </div>
                                        <div class="col-6">
                                            <input 
                                                type="submit" 
                                                class="btn btn-block btn-primary btn-md" 
                                                style="color: white; background-color: #f27229; border-radius: 0px; border-color: #f27229"
                                                value="Save Job"
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- JS here -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>

        <script language="javascript">
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;
            $('#date_picker').attr('min', today);
        </script>

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
        <!-- SCRIPTS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/stickyfill.min.js"></script>
        <script src="js/jquery.fancybox.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>

        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/quill.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/custom.js"></script>


    </body>
</html>
