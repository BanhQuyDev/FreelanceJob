var userName = null;
var websocket = null;
var picture = null;
var peer = new Peer();
var myStream;
var peerList = [];
function init(userName1, picture1) {
    if ("WebSocket" in window) {
        userName = userName1;
        picture = picture1;
        websocket = new WebSocket('ws://localhost:8080/FreelanceJob/' + userName);
        websocket.onopen = function (data) {
        };
        peer = new Peer(userName1);
        peer.on('open', (id) => {
            console.log(id + " connected");
        });
        listenToCall();
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
    var message = buildMessage(userName, messageContent, time, picture);

    document.getElementById("msg").value = '';

    setMessage(message);
    websocket.send(JSON.stringify(message));
}
function cleanUp() {
    userName = null;
    websocket = null;
}
function buildMessage(userName, message, time) {
    return {
        username: userName,
        message: message,
        time: time,
        picture: picture
    };
}

function setMessage(msg) {
    var currentHTML = document.getElementById('scrolling-messages').innerHTML;
    var newElem;
    if (msg.username === userName) {
        newElem = ` <div class="chat-message-right pb-4">
                           <div>
                           <img src="` + msg.picture + `" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                          <div class="text-muted small text-nowrap mt-2">` + msg.time + `</div>
                          </div>
                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                      <div class="font-weight-bold mb-1">You</div>
        ` + msg.message + `
                     </div>
                </div>`;
    } else {
        document.getElementById('status').innerHTML = "Online";
        newElem = `<div class="chat-message-left pb-4">
                                            <div>
                                                <img src="` + msg.picture + `" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                                <div class="text-muted small text-nowrap mt-2">` + msg.time + `</div>
                                            </div>
                                            <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                                <div class="font-weight-bold mb-1">` + msg.username + `</div>
                                                ` + msg.message + `
                                            </div>
                                        </div>`;
    }

    document.getElementById('scrolling-messages').innerHTML = currentHTML
            + newElem;
}
function listenToCall() {
    peer.on('call', (call) => {
        navigator.mediaDevices.getUserMedia({
            video: true,
            audio: true
        }).then((stream) => {

            myStream = stream;
            addLocalVideo(stream);
            call.answer(stream);
            call.on('stream', (remoteStream) => {
                if (!peerList.includes(call.peer)) {
                    addRemoteVideo(remoteStream);
                    peerList.push(call.peer);
                }
            });
        }).catch((err) => {
            console.log("unable to connect because " + err);
        });
    });
}

function makeCall(receiverId) {
    navigator.mediaDevices.getUserMedia({
        video: true,
        audio: true
    }).then((stream) => {
        myStream = stream;
        addLocalVideo(stream);
        var call = peer.call(receiverId, stream);
        call.on('stream', (remoteStream) => {
            if (!peerList.includes(call.peer)) {
                addRemoteVideo(remoteStream);
                peerList.push(call.peer);
            }
        });
    }).catch((err) => {
        console.log("unable to connect because " + err);
    });

}
function addLocalVideo(stream) {
    var video = document.createElement("video");
    video.srcObject = stream;
    video.classList.add("video");
    video.muted = true;
    video.play();
    document.getElementById("localVideo").append(video);
}

function addRemoteVideo(stream) {
    var video = document.createElement("video");
    video.srcObject = stream;
    video.classList.add("video");
    video.play();
    document.getElementById("remoteVideo").append(video);
}


var isVideo = true;
function toggleVideo() {
    if (isVideo = !isVideo) {
        var video = document.getElementById("video");
        video.className = 'fa-solid fa-video';
        myStream.getVideoTracks()[0].enabled = isVideo;
    } else {
        var video = document.getElementById("video");
        video.className = 'fa-solid fa-video-slash';
        myStream.getVideoTracks()[0].enabled = isVideo;
    }
}
var isAudio = true;
function toggleAudio() {
    if (isAudio = !isAudio) {
        var mic = document.getElementById("mic");
        mic.className = 'fa-solid fa-microphone-lines';
        myStream.getAudioTracks()[0].enabled = isAudio;
    } else {
        var mic = document.getElementById("mic");
        mic.className = 'fa-solid fa-microphone-lines-slash';
        myStream.getAudioTracks()[0].enabled = isAudio;
    }
}