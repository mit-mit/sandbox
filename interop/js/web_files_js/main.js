document.getElementById('import').onclick = function () {
    var files = document.getElementById('selectFiles').files;
    console.log(files);
    if (files.length <= 0) {
        return false;
    }

    var fr = new FileReader();
    fr.onload = function (e) {
        console.log(e);
        var startTime = performance.now()
        var result = JSON.parse(e.target.result);
        var endTime = performance.now();
        var duration = endTime - startTime;
        var size = result.length;
        document.getElementById('result').value = "read json length " + size + " in " + duration + " ms";
    }
    fr.readAsText(files.item(0));
};
