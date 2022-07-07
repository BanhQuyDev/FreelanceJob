function thisFileUpload() {
    document.getElementById("file").click();
}
var inputElement = document.getElementById("file");
inputElement.addEventListener('change', function () {
    var fileChosen = document.getElementById("file-chosen");
    var fileLimit = 20000; // could be whatever you want 
    var files = inputElement.files; //this is an array
    var fileSize = files[0].size;
    if (files.length === 1) {
       fileChosen.textContent = files.length + " file";
    } else {
       fileChosen.textContent = files.length + " files";
    }
    var fileSizeInKB = (fileSize / 1024); // this would be in kilobytes defaults to bytes
    if (fileSizeInKB < fileLimit) {
        document.getElementById("myBtn").disabled = false;
        // add file to db here
    } else {
        document.getElementById("myBtn").disabled = true;
        alert("File does not exceed 20mb");
        inputElement.value = '';
        // do not pass go, do not add to db. Pass error to user    
    }
});