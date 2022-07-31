<%-- 
    Document   : file_management
    Created on : Jul 6, 2022, 12:58:48 AM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Freelance Job</title>
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="assets/img/logo/logo_freelancer.png"
            />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

        <style>
            body {
                background: -webkit-linear-gradient(left, #25c481, #25b7c4);
                background: linear-gradient(to right, #25c481, #25b7c4);
                font-family: 'Muli', sans-serif;
            }

            section {
                margin: 70px 0;
            }

            .table_header {
                font-size: 30px;
                color: #fff;
                text-transform: uppercase;
                font-weight: 600;
                text-align: center;
                margin-bottom: 15px;
            }

            table {
                width: 100%;
                table-layout: fixed;
                border-top-left-radius: 6px;
                border-top-right-radius: 6px;
            }


            .tbl-content {
                height: 450px;
                overflow-x: auto;
                margin-top: 0px;
                border: 1px solid rgba(255, 255, 255, 0.3);
                border-bottom-left-radius: 6px;
                border-bottom-right-radius: 6px;
            }

            th {
                text-align: center;
                padding: 20px 15px;
                font-weight: 500;
                font-size: 20px;
                color: #fff;
                text-transform: uppercase;
            }

            td {
                text-align: center;
                padding: 18px;
                vertical-align: middle;
                font-weight: 300;
                font-size: 18px;
                color: #fff;
                border-bottom: solid 1px rgba(255, 255, 255, 0.1);
            }

            ::-webkit-scrollbar {
                width: 10px;
            }

            ::-webkit-scrollbar-track {
                box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            }

            ::-webkit-scrollbar-thumb {
                box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            }


            .made-with-love {
                margin-top: 40px;
                padding: 10px;
                clear: left;
                text-align: center;
                font-size: 10px;
                font-family: arial;
                color: #fff;
            }

            .made-with-love i {
                font-style: normal;
                color: #F50057;
                font-size: 14px;
                position: relative;
                top: 2px;
            }

            .made-with-love a {
                color: #fff;
                text-decoration: none;
            }

            .made-with-love a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <!--        <div class="container mt-5" style="background-color: #ffffff8a; border-radius: 15px; padding: 30px">
        <c:if test="${sessionScope.MODE == 'FREELANCER'}">
            <div>  
                <h1 class="text-center my-3" style="font-weight: 700; background-color: white; margin: 0 25%; border-radius: 15px; padding: 8px 0">
                    File Submission Management
                </h1>
                <form class="my-4" action="UploadFileS3" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="idJob" value="${requestScope.ID_JOB}">
                    <input type="hidden" name="position" value="fileManagement">
                    <input type="file" name="file" id="file" multiple required style="display: none"/>
                    <div class="row">
                        <div class="col-3">
                            <button class="border-0 bg-success rounded text-light py-2 px-3" style="font-weight: 700" onclick="thisFileUpload()">Add files <i class="fa-solid fa-file-circle-plus" style="margin-left: 10px"></i></button>
                            <span id="file-chosen" style="margin-left: 10px; font-size: 16px; font-weight: 600">No file chosen</span>
                        </div>
                        <div class="col-3">
                            <button class="btn btn-primary py-2 px-3" style="font-weight: 700" id="myBtn" type="submit">Upload</button>
                        </div>
                    </div>
                </form> 
            </div>
        </c:if>
        <table class="table border borde-black">
            <thead>
                <tr>
                    <th class=" text-center" scope="col">SERIAL</th>
                    <th class=" text-center" scope="col">FILE URL</th>
                    <th class=" text-center" scope="col">DOWNLOAD</th>
        <c:if test="${sessionScope.MODE == 'FREELANCER'}">
        <th class=" text-center" scope="col">DELETE</th>
        </c:if>
</tr>
</thead>
<tbody>
        <c:forEach var="file" items="${requestScope.LIST_FILE}" varStatus="count">
            <tr>
                <th class=" text-center"scope="row">${count.count}</th>
                <td class=" text-center">${file.urlS3}</td>
                <td class=" text-center" ><a class="btn btn-primary" href="${file.urlS3}" target="_blank">Download</a></td>
            <c:if test="${sessionScope.MODE == 'FREELANCER'}">
                <td class=" text-center"><a class="btn btn-danger" href="DeleteFile?idFile=${file.id}&urlS3=${file.urlS3}&idJob=${file.idJob}">Delete</a></td>
            </c:if>
        </tr>
        </c:forEach>
    </tbody>
</table>
</div>-->


        <section class="container">
            <h1 class="table_header">File Submission Management</h1>

            <c:if test="${sessionScope.MODE == 'FREELANCER'}">
                <div style="background-color: rgba(255, 255, 255, 0.3); padding: 10px 25px; margin-bottom: 20px; border-radius: 6px">  
                    <form class="my-4" action="UploadFileS3" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="idJob" value="${requestScope.ID_JOB}">
                        <input type="hidden" name="position" value="fileManagement">
                        <input type="file" name="file" id="file" multiple required style="display: none"/>
                        <div class="row">
                            <div class="col-3">
                                <button class="border-0 bg-success rounded text-light py-2 px-3" style="font-weight: 700" onclick="thisFileUpload()">Add files <i class="fa-solid fa-file-circle-plus" style="margin-left: 10px"></i></button>
                                <span id="file-chosen" style="margin-left: 10px; font-size: 16px; font-weight: 600">No file chosen</span>
                            </div>
                            <div class="col-3">
                                <button class="btn btn-primary py-2 px-3" style="font-weight: 700" id="myBtn" type="submit">Upload</button>
                            </div>
                        </div>
                    </form> 
                </div>
            </c:if>

            <div class="tbl-header">
                <table style="background-color: rgba(255, 255, 255, 0.3);">
                    <thead>
                        <tr>
                            <th style="width: 5%">SERIAL</th>
                            <th style="width: 65%">FILE URL</th>
                            <th style="width: 15%">DOWNLOAD</th>
                                <c:if test="${sessionScope.MODE == 'FREELANCER'}">
                                <th style="width: 15%">DELETE</th>
                                </c:if>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table>
                    <tbody>
                        <c:forEach var="file" items="${requestScope.LIST_FILE}" varStatus="count">
                            <tr>
                                <td style="width: 5%">${count.count}</td>
                                <td style="width: 65%;">${file.urlS3}</td>
                                <td style="width: 15%;"><a class="btn btn-primary" href="${file.urlS3}" target="_blank">Download</a></td>
                                <c:if test="${sessionScope.MODE == 'FREELANCER'}">
                                    <td style="width: 15%;"><a class="btn btn-danger" href="DeleteFile?idFile=${file.id}&urlS3=${file.urlS3}&idJob=${file.idJob}">Delete</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </div>
        </section>
    </body>
    <script src="./upload-file/file_management.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    <script
        src="https://kit.fontawesome.com/b36bcbb61e.js"
        crossorigin="anonymous"
    ></script>
</html>
