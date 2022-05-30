<%-- 
    Document   : post_job
    Created on : May 28, 2022, 10:43:04 AM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Freelance Job</title>

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
        <jsp:include page="component/header.jsp"></jsp:include>
            <section class="site-section">
                <div class="container">
                    <div class="row align-items-center mb-5">
                        <div class="col-lg-8 mb-4 mb-lg-0">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h2>Post A Job</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-6">
                                    <a href="#" class="btn btn-block btn-light btn-md"
                                       ><span class="icon-open_in_new mr-2"></span>Preview</a
                                    >
                                </div>
                                <div class="col-6">
                                    <a href="#" class="btn btn-block btn-primary btn-md"
                                       >Save Job</a
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-lg-12">
                            <form class="p-4 p-md-5 border rounded" method="post">
                                <h3 class="text-black mb-5 border-bottom pb-2">Job Details</h3>

                                <div class="form-group">
                                    <label for="company-website-tw d-block"
                                           >Upload Featured Image</label
                                    >
                                    <br />
                                    <label class="btn btn-primary btn-md btn-file">
                                        Browse File<input type="file" hidden />
                                    </label>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="email"
                                        placeholder="you@yourdomain.com"
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="job-title">Job Title</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="job-title"
                                        placeholder="Product Designer"
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Location</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="job-location"
                                        placeholder="e.g. New York"
                                        />
                                </div>

                                <div class="form-group">
                                    <label for="job-region">Job Region</label>
                                    <select
                                        class="selectpicker border rounded"
                                        id="job-region"
                                        data-style="btn-black"
                                        data-width="100%"
                                        data-live-search="true"
                                        title="Select Region"
                                        >
                                        <option>Anywhere</option>
                                        <option>San Francisco</option>
                                        <option>Palo Alto</option>
                                        <option>New York</option>
                                        <option>Manhattan</option>
                                        <option>Ontario</option>
                                        <option>Toronto</option>
                                        <option>Kansas</option>
                                        <option>Mountain View</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="job-type">Job Type</label>
                                    <select
                                        class="selectpicker border rounded"
                                        id="job-type"
                                        data-style="btn-black"
                                        data-width="100%"
                                        data-live-search="true"
                                        title="Select Job Type"
                                        >
                                        <option>Part Time</option>
                                        <option>Full Time</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="job-description">Job Description</label>
                                    <div class="editor" id="editor-1">
                                        <p>Write Job Description!</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row align-items-center mb-5">
                        <div class="col-lg-4 ml-auto">
                            <div class="row">
                                <div class="col-6">
                                    <a href="#" class="btn btn-block btn-light btn-md"
                                       ><span class="icon-open_in_new mr-2"></span>Preview</a
                                    >
                                </div>
                                <div class="col-6">
                                    <a href="#" class="btn btn-block btn-primary btn-md"
                                       >Save Job</a
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        <jsp:include page="component/footer.jsp"></jsp:include>

               <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(400, 0).slideUp(400, function () {
                    $(this).remove();
                });
            }, 3000);
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
    </body>
</html>
