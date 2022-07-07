window.setTimeout(function () {
    $(".alert").fadeTo(400, 0).slideUp(400, function () {
        $(this).remove();
    });
}, 3000);
function thisFileUpload(idFile) {
    document.getElementById(idFile).click();
}
function changeFile(idFile, idFileChosen, idBtn) {
    var inputElement = document.getElementById(idFile);
    var fileChosen = document.getElementById(idFileChosen);
    var fileLimit = 20000; // could be whatever you want 
    var files = inputElement.files; //this is an array
    var fileSize = files[0].size;
    if (files.length === 1) {
        fileChosen.textContent = files.length + " file";
    } else {
        fileChosen.textContent = files.length + " files";
    }
    console.log(fileSize);
    var fileSizeInKB = (fileSize / 1024); // this would be in kilobytes defaults to bytes
    if (fileSizeInKB < fileLimit) {
        console.log("file go for launch");
        document.getElementById(idBtn).disabled = false;
        // add file to db here
    } else {
        console.log("file too big");
        document.getElementById(idBtn).disabled = true;
        alert("File does not exceed 20mb");
        inputElement.value = '';
        // do not pass go, do not add to db. Pass error to user    
    }
}
