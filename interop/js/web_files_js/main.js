document.getElementById('import').onclick = function () {
    var files = document.getElementById('selectFiles').files;
    console.log(files);
    if (files.length <= 0) {
        return false;
    }

    var fr = new FileReader();
    fr.onload = function (e) {
        jsonString = e.target.result;
        json = measure(function () { return JSON.parse(jsonString) }, "parse json");
        log(`read json array with length ${json.length}`);
        jsonString2 = measure(function () { return JSON.stringify(json) }, "stringify json");
        log(`created json string with length ${jsonString2.length}`);
    }
    fr.readAsText(files.item(0));
};

function measure(fn, what) {
    var startTime = performance.now()
    var result = fn();
    var endTime = performance.now();
    var duration = Math.round(endTime - startTime);
    log(what + " in " + duration + " ms.");
    return result;
}

function log(s) {
    var output = document.getElementById('result');
    output.textContent = output.textContent + "\n" + s;
}