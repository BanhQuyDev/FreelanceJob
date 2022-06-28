function showJobDetail(totalDetail, idCard) {
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