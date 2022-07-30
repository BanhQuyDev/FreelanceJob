function showJobDetail(totalDetail, idCard) {
    for (var i = 1; i <= totalDetail; i++) {
        var generateDetailCard = "contractCard";
        generateDetailCard += i;
        var milestoneCard = "milestoneCard";
        milestoneCard += i;
        console.log(milestoneCard);
        if (idCard === i) {
            document.getElementById(generateDetailCard).style.display = "block";
            document.getElementById(milestoneCard).style.display = "block";
        } else {
            document.getElementById(generateDetailCard).style.display = "none";
            document.getElementById(milestoneCard).style.display = "none";
        }
    }
}

function renderRating(idStar, index) {
    var totalStar = 5;
    for (var i = 1; i <= totalStar; i++) {
        var ratingText = "ratingText_";
        ratingText += index;
        if (i === idStar && idStar === 1) {
            document.getElementById(ratingText).innerHTML = "Bad";
            document.getElementById(ratingText).style.color = "black";
        } else if (i === idStar && idStar === 2) {
            document.getElementById(ratingText).innerHTML = "Not Bad";
            document.getElementById(ratingText).style.color = "orangered";
        } else if (i === idStar && idStar === 3) {
            document.getElementById(ratingText).innerHTML = "Great";
            document.getElementById(ratingText).style.color = "#2727ff";
        } else if (i === idStar && idStar === 4) {
            document.getElementById(ratingText).innerHTML = "Good";
            document.getElementById(ratingText).style.color = "yellow";
        } else if (i === idStar && idStar === 5) {
            document.getElementById(ratingText).innerHTML = "Exellent";
            document.getElementById(ratingText).style.color = "lime";
        }
    }
}

function addMilestone(index, startDateJob, endDateJob) {
    var endDateUserInput = document.getElementById("end" + index + 1).value;
    var startDateUserInput = document.getElementById("start" + index + 1).value;
    var count = document.querySelectorAll(`#addMilestoneId${index} li`).length;
    console.log(count);
    if (count === 1) {
        if (endDateUserInput !== "" && startDateUserInput !== "") {
            var ul = document.getElementById("addMilestoneId" + index);
            var li = document.createElement("li");
            li.id = "countMilestone" + count;
            ul.appendChild(li);
            var startDate = "startDate" + (count + 1);
            var endDate = "endDate" + (count + 1);
            var tittle = "tittle" + (count + 1);
            if (count === 5) {
                newElem = `<h3 class="text-danger">You can only create 5 times in a row !!</h2>`;
                li.innerHTML = newElem;
            } else if (count > 5) {
                li.remove();
                return;
            } else {
                var newNumber = count + 1;
                newElem = `
            <strong>From </strong> <span class="ml-3"><input id="start${index}${newNumber}"  name="${startDate}" type="date" min="${endDateUserInput}" max="${endDateJob}" style="background-color: transparent; color: white; border: none; font-size: 18px" required/></span>
            <strong class="ml-3">To </strong> <span class="ml-3"><input id="end${index}${newNumber}" name="${endDate}" type="date" min="${endDateUserInput}" max="${endDateJob}" style="background-color: transparent; color: white; border: none; font-size: 18px" required/></span>
            <span onclick="removeMilestones('${li.id}','addMilestoneId${index}')" class="ml-3 bg-danger"><i class="fas fa-minus"></i></span>
            <div class="content">
                <h3>Milestone Tittle <input name="${tittle}" required="" style="border-radius: 5px; margin-left: 15px; padding: 10px; width: 65%"/></h3>
            </div>
        `;
                li.innerHTML = newElem;
            }
        } else {
            alert("Must Input Date First");
        }

    } else {
        var endDateUserInput1 = document.getElementById("end" + index + count).value;
        var startDateUserInput1 = document.getElementById("start" + index + count).value;
        if (endDateUserInput1 !== "" && startDateUserInput1 !== "") {
            var ul = document.getElementById("addMilestoneId" + index);
            var li = document.createElement("li");
            li.id = "countMilestone" + count;
            ul.appendChild(li);
            var startDate = "startDate" + count;
            var endDate = "endDate" + count;
            var tittle = "tittle" + count;
            if (count === 5) {
                newElem = `<h3 class="text-danger">You can only create 5 times in a row !!</h2>`;
                li.innerHTML = newElem;
            } else if (count > 5) {
                li.remove();
                return;
            } else {
                var newNumber = count + 1;
                newElem = `
            <strong>From </strong> <span class="ml-3"><input id="start${index}${newNumber}"  name="${startDate}" type="date" min="${endDateUserInput1}" max="${endDateJob}" style="background-color: transparent; color: white; border: none; font-size: 18px" required/></span>
            <strong class="ml-3">To </strong> <span class="ml-3"><input id="end${index}${newNumber}" name="${endDate}" type="date" min="${endDateUserInput1}" max="${endDateJob}" style="background-color: transparent; color: white; border: none; font-size: 18px" required/></span>
            <span onclick="removeMilestones('${li.id}','addMilestoneId${index}')" class="ml-3 bg-danger"><i class="fas fa-minus"></i></span>
            <div class="content">
                <h3>Milestone Tittle <input name="${tittle}" required="" style="border-radius: 5px; margin-left: 15px; padding: 10px; width: 65%"/></h3>
            </div>
        `;
                li.innerHTML = newElem;
            }
        } else {
            alert("Must Input Date First");
        }
    }
}

function removeMilestones(child, parent) {
    var ul = document.getElementById(parent);
    var li = document.getElementById(child);
    ul.removeChild(li);
    $('#countMilestone5').remove();
}

