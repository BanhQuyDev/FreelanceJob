<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Update Post Job</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="manifest" href="site.webmanifest" />

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
        <link rel="stylesheet" href="choosen/chosen.min.css"/>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="mutile/css/style.css">
        <link rel="stylesheet" href="assets/css/editlogin.css" />
        <script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
        <link rel="stylesheet" href="assets/css/header_notification.css"/>
    </head>
    <body>
        <jsp:include page="component/header.jsp"></jsp:include>
            <section class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-lg-12">
                            <form action="UpdateJobController" class="p-4 p-md-5 border rounded" method="POST" style="margin: 2em 0em">
                            <c:set var="job" value="${requestScope.JOB_UPDATE}"/>
                            <input type="hidden" name="id_job" value="${job.idJob}"/>
                            <input type="hidden" name="status" value="${job.status}"/>
                            <h3 class="text-black mb-5 border-bottom pb-2" style="text-align: center;">UPDATE JOB FORM</h3>
                            <div class="form-group">
                                <label><strong>Job Title</strong></label>
                                <input type="text"
                                       name="title"
                                       class="form-control"
                                       id="tile"
                                       placeholder="Title"
                                       required=""
                                       value="${job.title}"
                                       />
                            </div>

                            <div class="form-row" style="margin-bottom: 15px">
                                <div class="col">
                                    <label for="job-title">Price</label>
                                    <input type="text" 
                                           id="amount"
                                           name="salary" 
                                           class="form-control" 
                                           title="The price of project must be greater than 100.000 VN?"
                                           required=""
                                           maxlength="15"
                                           minlength="7"
                                           value="${job.showPrice(job.salary)}">
                                </div>
                                <div class="col">
                                    <label><strong>Duration (by day)</strong></label>
                                    <input 
                                        type="number"
                                        name="duration"
                                        class="form-control" 
                                        placeholder="Duration"
                                        required="Duration must be greater than 1 day"
                                        min="1"
                                        value="${job.showDuration(job.duration)}">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label><strong>Major</strong></label>
                                    <c:set var="major" value="${requestScope.LIST_MAJOR}"/>
                                    <c:set var="id_major" value="${job.idMajor}"/>
                                    <c:set var="major_name" value="${job.nameMajor}"/>
                                    <select class="form-select border rounded" name="cmbMajor"; data-style="btn-black" data-width="100%" data-live-search="true">
                                        <option value="${id_major}">${major_name}</option>
                                        <c:forEach var="item" items="${major}">
                                            <c:if test="${item.major_name ne major_name}">
                                                <option value="${item.id_major}">${item.major_name}</option> 
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label><strong>Start Date</strong></label>
                                    <input type="date" name="startDate" class="form-control" id="date_picker" placeholder="Start Date" required="" value="${job.startDate}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label><strong>Job Description</strong></label>
                                <textarea id="description" name="description" class="form-control" id="exampleFormControlTextarea1" rows="3">${job.description}</textarea>
                            </div>

                            <c:set var="skill" value="${requestScope.LIST_SKILL_JOB}"/>
                            <c:set var="skillOfJob" value="${requestScope.LIST_SELECTED_SKILL}"/>
                            <div class="form-group">
                                <label><strong>Skill-Job</strong></label>
                                <div>
                                    <select style="width: 100%;" class="js-select2" multiple="multiple" name="skillJob">
                                        <c:forEach begin="0" end="${skill.size() - 1}" var="i">
                                            <option value="${skill.get(i).getSkillId()}" data-badge="" ${skillOfJob[i] ? "selected" : ""}>${skill.get(i).getName()}</option>
                                        </c:forEach>                                      
                                    </select>
                                </div>
                            </div>                                                    
                            <div style="margin-top: 20px" class="row align-items-center mb-5">
                                <div class="col-lg-4 ml-auto">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="RenderJobPostController" class="btn btn-block btn-light btn-md"
                                               ><span class="icon-open_in_new mr-2"></span>Back</a
                                            >
                                        </div>
                                        <div class="col-6">
                                            <input 
                                                type="submit" 
                                                name="action"
                                                class="btn btn-primary" 
                                                value="Update Post"
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>                 
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="component/footer.jsp"></jsp:include>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script>
        CKEDITOR.replace('description');
    </script>
    <script>
        window.setTimeout(function () {
            $(".alert").fadeTo(400, 0).slideUp(400, function () {
                $(this).remove();
            });
        }, 3000);
    </script>
    <script>
        (function ($, undefined) {

            "use strict";

            $(function () {

                var $form = $("#form");
                var $inputPrice = $("#amount");

                $inputPrice.on("keyup", function (event) {


                    // When user select text in the document, also abort.
                    var selection = window.getSelection().toString();
                    if (selection !== '') {
                        return;
                    }

                    // When the arrow keys are pressed, abort.
                    if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) {
                        return;
                    }
                    var $this = $(this);
                    // Get the value.
                    var input = $this.val();
                    var input = input.replace(/[\D\s\._\-]+/g, "");
                    input = input ? parseInt(input, 10) : 0;

                    $this.val(function () {
                        return (input === 0) ? "" : input.toLocaleString("en-US");
                    });
                });
                /**
                 * ==================================
                 * When Form Submitted
                 * ==================================
                 */
                $form.on("submit", function (event) {
                    var $this = $(this);
                    var arr = $this.serializeArray();
                    for (var i = 0; i < arr.length; i++) {
                        arr[i].value = arr[i].value.replace(/[($)\s\._\-]+/g, ''); // Sanitize the values.
                    }
                    ;
                });

            });
        })(jQuery);
    </script>
    <!--<script src="mutile/js/bootstrap.min.js"></script>-->
    <script src="mutile/js/popper.js"></script>
    <!--<script src="mutile/js/bootstrap.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js"></script>
    <script src="mutile/js/main.js"></script>
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
