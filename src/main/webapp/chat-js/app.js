var userName = null;
var websocket = null;
var picture = null;
function init(userName1,picture1) {
    if ("WebSocket" in window) {
        userName = userName1;
        picture = picture1;
        websocket = new WebSocket('ws://localhost:8080/FreelanceJob/' + userName);
        websocket.onopen = function (data) {
        };

        websocket.onmessage = function (data) {
            setMessage(JSON.parse(data.data));
        };

        websocket.onerror = function (e) {
            alert('An error occured, closing application');
            cleanUp();
        };

        websocket.onclose = function (data) {
            cleanUp();
            var reason = (data.reason && data.reason !== null) ? data.reason : 'Goodbye';
            alert(reason);
        };
    } else {
        alert("Websockets not supported");
    }
}
function sendMessage() {
    var messageContent = document.getElementById("msg").value;
    var today = new Date();
    var time = today.getHours() + ":" + today.getMinutes()
    var message = buildMessage(userName, messageContent,time,picture);

    document.getElementById("msg").value = '';

    setMessage(message);
    websocket.send(JSON.stringify(message));
}
function cleanUp() {
    document.getElementById("main").style.display = "none";

    userName = null;
    websocket = null;
}
function buildMessage(userName,message,time,picture) {
    return {
        username: userName,
        message: message,
        time:time,
        picture:picture
    };
}

function setMessage(msg) {
    var currentHTML = document.getElementById('scrolling-messages').innerHTML;
    var newElem;
    if (msg.username === userName) {
        newElem = ` <div class="chat-message-right pb-4">
                           <div>
                           <img src="`+msg.picture+`" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                          <div class="text-muted small text-nowrap mt-2">` + msg.time + `</div>
                          </div>
                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                      <div class="font-weight-bold mb-1">You</div>
        ` + msg.message + `
                     </div>
                </div>`
    } else {
        newElem = `<div class="chat-message-left pb-4">
                                            <div>
                                                <img src="`+msg.picture+`" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                                <div class="text-muted small text-nowrap mt-2">` + msg.time  + `</div>
                                            </div>
                                            <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                                <div class="font-weight-bold mb-1">` + msg.username + `</div>
                                                ` + msg.message + `
                                            </div>
                                        </div>`
    }

    document.getElementById('scrolling-messages').innerHTML = currentHTML
            + newElem;
}