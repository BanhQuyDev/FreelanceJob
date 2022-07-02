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
    var ul = document.getElementById("addMilestoneId" + index);
    var li = document.createElement("li");
    li.className = "countMilestone";
    ul.appendChild(li);

    var count = document.querySelectorAll(`#addMilestoneId${index} .countMilestone`).length;
    var startDate = "startDate" + count;
    var endDate = "endDate" + count;
    var tittle = "tittle" + count;
    if (count === 6) {
        newElem = `<h2 class="text-danger">You can only create 5 times in a row !!</h2>`;
        li.innerHTML = newElem;
    } else if (count > 6) {
        li.remove();
        return;
    } else {
        newElem = `
            <strong>From </strong> <span class="ml-3"><input name="${startDate}" type="date" min="${startDateJob}" max="${endDateJob}" style="background-color: transparent; color: white; border: none; font-size: 18px"/></span>
            <strong class="ml-3">To </strong> <span class="ml-3"><input name="${endDate}" type="date" min="${startDateJob}" max="${endDateJob}" style="background-color: transparent; color: white; border: none; font-size: 18px"/></span>
            <span class="ml-3 bg-danger"><i class="fas fa-minus"></i></span>
            <div class="content">
                <h3>Milestone Tittle <input name="${tittle}" required="" style="border-radius: 5px; margin-left: 15px; padding: 10px; width: 65%"/></h3>
            </div>
        `;
        li.innerHTML = newElem;
    }
}