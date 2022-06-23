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
        <script src="chat-js/app.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <style>
        .chat {
            width: 100%;
            height: 200px;
            border: 1px solid silver;
            overflow-y: scroll;
        }

        #msg {width: 90%;}

        h1 {text-align: center;}
        body{margin-top:20px;}

        .chat-online {
            color: #34ce57
        }

        .chat-offline {
            color: #e4606d
        }

        .chat-messages {
            display: flex;
            flex-direction: column;
            max-height: 800px;
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
    <body onload="init('${sessionScope.LOGIN_USER.name}')">
        <main class="content">
            <div class="container p-0">
                <h1 class="h3 mb-3">Messages</h1>
                <div class="card">
                    <div class="col-12 col-lg-7 col-xl-12">
                        <div class="py-2 px-4 border-bottom d-none d-lg-block">
                            <div class="d-flex align-items-center py-1">
                                <div class="position-relative">
                                    <img src="${requestScope.CHAT_PATNER.picture}" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                </div>
                                <div class="flex-grow-1 pl-3">
                                    <strong>${requestScope.CHAT_PATNER.name}</strong>
                                    <div class="text-muted small"><em>Online</em></div>
                                </div>
                            </div>
                        </div>

                        <div class="position-relative">
                            <div id="chat" class="chat-messages p-4">
                                <div id="scrolling-messages" class="scrolling-messages"> 
                                    <c:forEach var="mess" items="${requestScope.LIST_MESSAGE}">
                                        <c:choose>
                                            <c:when test="${mess.idSend == request.CHAT_PATNER.getId}">
                                                <div class="chat-message-left pb-4">
                                                    <div>
                                                        <img src="${requestScope.CHAT_PATNER.picture}" class="rounded-circle mr-1" width="40" height="40">
                                                        <div class="text-muted small text-nowrap mt-2">${mess.time}</div>
                                                    </div>
                                                    <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                                        <div class="font-weight-bold mb-1">${mess.nameSend}</div>
                                                        ${mess.message}
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="chat-message-right pb-4">
                                                    <div>
                                                        <img src="${sessionScope.LOGIN_USER.picture}" class="rounded-circle mr-1" width="40" height="40">
                                                        <div class="text-muted small text-nowrap mt-2">${mess.time}</div>
                                                    </div>
                                                    <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                                        <div class="font-weight-bold mb-1">You</div>
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
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Type your message" name="msg" id="msg">
                                <button type="submit" onclick="sendMessage();" class="btn btn-primary">Send</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
