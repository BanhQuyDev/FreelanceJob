function showJobDetail_1() {
    document.getElementById("contractCard1").style.display = "block";
    document.getElementById("contractCard2").style.display = "none";
    document.getElementById("contractCard3").style.display = "none";
}
function showJobDetail_2() {
    document.getElementById("contractCard1").style.display = "none";
    document.getElementById("contractCard2").style.display = "block";
    document.getElementById("contractCard3").style.display = "none";
}
function showJobDetail_3() {
    document.getElementById("contractCard1").style.display = "none";
    document.getElementById("contractCard2").style.display = "none";
    document.getElementById("contractCard3").style.display = "block";
}

function showJobDetail_(totalDetail, idCard) {
    for (var i = 1; i <= totalDetail; i++) {
    var generateIdCard = "contractCard";
        generateIdCard += i;
        if (idCard === i) {
            document.getElementById(generateIdCard).style.display = "block";
        } else {
            document.getElementById(generateIdCard).style.display = "none";
        }
    }
}