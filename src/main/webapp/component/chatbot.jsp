<%-- 
    Document   : footer
    Created on : May 28, 2022, 10:38:03 AM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- CHAT BAR BLOCK -->
<div class="chat-bar-collapsible">
    <button id="chat-button" type="button" class="collapsible">Chat with us!
        <i id="chat-icon" style="color: #fff;" class="fa fa-fw fa-comments-o"></i>
    </button>

    <div class="content">
        <div class="full-chat-block">
            <!-- Message Container -->
            <div class="outer-container">
                <div class="chat-container">
                    <!-- Messages -->
                    <div id="chatbox">
                        <h5 id="chat-timestamp"></h5>
                        <p id="botStarterMessage" class="botText"><span>Loading...</span></p>
                    </div>

                    <!-- User input box -->
                    <div class="chat-bar-input-block">
                        <div id="userInput">
                            <input id="textInput0" class="input-box" type="text" name="msg"
                                   placeholder="Tap 'Enter' to send a message">
                            <p></p>
                        </div>

                        <div class="chat-bar-icons">
                            <i id="chat-icon" style="color: crimson;" class="fa fa-fw fa-heart"
                               onclick="heartButton()"></i>
                            <i id="chat-icon1" style="color: #333;" class="fa fa-fw fa-send"
                               onclick="sendButton(0)"></i>
                        </div>
                    </div>

                    <div id="chat-bar-bottom">
                        <button style="border-radius: 10px 10px 10px 10px;
                                margin-top:5px; 
                                color: black;
                                cursor: pointer;" id="textInput1" value="complain" onclick="sendButton(1)">Complain</button>
                        <button style="border-radius: 10px 10px 10px 10px;
                                margin-top:5px; 
                                color: black;
                                cursor: pointer;" id="textInput2" value="account locked issue" onclick="sendButton(2)">Account locked issue</button>
                        <button style="border-radius: 10px 10px 10px 10px;
                                margin-top:5px; 
                                color: black;
                                cursor: pointer;" id="textInput3" value="payment" onclick="sendButton(3)">Payment</button>
                        <button style="border-radius: 10px 10px 10px 10px;
                                margin-top:5px; 
                                color: black;
                                cursor: pointer;" id="textInput4" value="refund money" onclick="sendButton(4)">Refund money</button>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>
<script>
    var input = document.getElementById("textInput0");
    input.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            document.getElementById("chat-icon1").click();
        }
    });
</script>
