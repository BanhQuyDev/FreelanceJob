<%-- 
    Document   : chat
    Created on : Jun 22, 2022, 4:00:32 PM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chat</title>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <style>
        html,body{
            padding: 0;
            margin: 0;
        }

        .primary-video{
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            background-color: black;
        }

        .secondary-video{
            position: absolute;
            width: 20%;
            height: 20%;
            margin: 16px;
            border-radius: 16px;
            object-fit: cover;
            background-color: grey;
        }
        .function-video{
            position: absolute;
            top: 92%;
            left: 33%;
        }
        .video{
            position: absolute;
            height: 100%;
            width: 100%;
            border-radius: 16px;
            object-fit: cover;
        }
        .chat {
            width: 100%;
            height: 200px;
            border: 1px solid silver;
            overflow-y: scroll;
        }

        #msg {width: 90%;}

        h1 {text-align: center;}

        .chat-online {
            color: #34ce57
        }

        .chat-offline {
            color: #e4606d
        }

        .chat-messages {
            display: flex;
            flex-direction: column;
            height: 788px;
            overflow-y: scroll
        }

        .chat-message-left,
        .chat-message-right {
            display: flex;
            flex-shrink: 0
        }

        .chat-message-left {
            margin-right: auto
        }

        .chat-message-right {
            flex-direction: row-reverse;
            margin-left: auto
        }
        .py-3 {
            padding-top: 1rem!important;
            padding-bottom: 1rem!important;
        }
        .px-4 {
            padding-right: 1.5rem!important;
            padding-left: 1.5rem!important;
        }
        .flex-grow-0 {
            flex-grow: 0!important;
        }
        .border-top {
            border-top: 1px solid #dee2e6!important;
        }
    </style>
    <body onload="init('${sessionScope.LOGIN_USER.name}', '${sessionScope.LOGIN_USER.picture}'), makeCall('${requestScope.CHAT_PATNER.name}')">
        <main class="content">
            <div style="height: 929px; width: 100%" class="row">
                <div class="col-9">
                    <div class="primary-video" id="remoteVideo">
                    </div>
                    <div class="secondary-video" id="localVideo">
                    </div>
                    <div class="function-video ">
                        <i id="mic" style="background-color: white; padding: 9px;border-radius: 20px;" onclick="toggleAudio()" class="fa-solid fa-microphone-lines"></i>
                        <i id="video" style="background-color: white; padding: 9px;border-radius: 20px;" onclick="toggleVideo()" class="fa-solid fa-video"></i>
<!--                        <button id="start"> Start Screen Sharing</button>
                        <button id="stop"> Stop</button>-->
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="height:929px;width: 106%">
                        <div class="col-12 col-lg-7 col-xl-12">
                            <div class="py-2 px-4 border-bottom d-lg-block">
                                <div class="d-flex align-items-center py-1">
                                    <div class="position-relative">
                                        <img src="${requestScope.CHAT_PATNER.picture}" class="rounded-circle mr-1" width="40" height="40">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <strong id="patner">${requestScope.CHAT_PATNER.name}</strong>
                                        <div class="text-muted small"><em id="status">Offline</em></div>
                                    </div>
                                </div>
                            </div>

                            <div class="position-relative">
                                <div id="chat" class="chat-messages p-4">
                                    <div id="scrolling-messages" class="scrolling-messages"> 
                                        <c:forEach var="mess" items="${requestScope.LIST_MESSAGE}">
                                            <c:choose>
                                                <c:when test="${sessionScope.LOGIN_USER.id == mess.getIdSend()}">
                                                    <div class="chat-message-right pb-4">
                                                        <div>
                                                            <img src="${sessionScope.LOGIN_USER.picture}" class="rounded-circle mr-1" width="40" height="40">
                                                            <div class="text-muted small text-nowrap mt-2">${mess.showTime(mess.time)}</div>
                                                        </div>
                                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                                            <div class="font-weight-bold mb-1">You</div>
                                                            ${mess.message}
                                                        </div>
                                                    </div> 
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="chat-message-left pb-4">
                                                        <div>
                                                            <img src="${requestScope.CHAT_PATNER.picture}" class="rounded-circle mr-1" width="40" height="40">
                                                            <div class="text-muted small text-nowrap mt-2">${mess.showTime(mess.time)}</div>
                                                        </div>
                                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                                            <div class="font-weight-bold mb-1">${mess.nameSend}</div>
                                                            ${mess.message}
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <div class="flex-grow-0 py-3 px-4 border-top">
                                <div class="input-group row">
                                    <div class="col-10">
                                        <input type="text" class="form-control" placeholder="Type your message" name="msg" id="msg">
                                    </div>
                                    <div class="col-2">
                                        <button type="submit" onclick="sendMessage();" class="btn btn-primary" id="send">Send</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script src="https://unpkg.com/peerjs@1.3.1/dist/peerjs.min.js"></script>
    <script src="chat-js/app.js"></script>
    <script>
                                            var input = document.getElementById("msg");
                                            input.addEventListener("keypress", function (event) {
                                                if (event.key === "Enter") {
                                                    event.preventDefault();
                                                    document.getElementById("send").click();
                                                }
                                            });
    </script>
    <script src="https://kit.fontawesome.com/b36bcbb61e.js" crossorigin="anonymous"></script>
</html>
