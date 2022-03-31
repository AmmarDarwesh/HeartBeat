/* 
    Plugins needed:
    CordovaCameraPlugin
    CordovaDevice
    CordovaFile
*/
document.addEventListener('deviceready', onDeviceReady, false);
document.getElementById("buttonStart").onclick = startFileCreation;
document.getElementById("buttonStop").onclick = stopCamera;
var globalFileEntry = "";
var timeStamp = 0;


/*  Variable 'options' sets the options for the CanvasCameraPlugin.
Creates timestamp before image is drawn in "onBeforeDraw".
Calculates the RGB values after image is drawn in "onAfterDraw".
 */
var options = {
    CameraFacing: "back",
    canvas: {
        width: 350, height: 350
    },
    capture: {
        width: 350, height: 350
    },
    fps: 30,
    flashMode: true,
    use: 'data',     //Needs to be 'data', 'file' didn't work for IOS devices.
    onBeforeDraw: function (frame) {
        timeStamp = Date.now();
    },
    onAfterDraw: function (frame) {
        getAverageRGB(frame.element.getContext("2d"));
    }
};

/* 
    Initializes CordovaCameraPlugin when device is ready
*/
function onDeviceReady () {
    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    document.getElementById('deviceready').classList.add('ready');
    var objcanvas = document.getElementById("canvas");
    window.plugin.CanvasCamera.initialize(objcanvas);
}

/* 
    Start when the "startButton" is pressed on the GUI. Finds the type of device and locate the right storage location for the device.
*/
function startFileCreation () {
    var storageLocation = "";
    if (window.cordova && cordova.platformId !== "browser") {
        switch (device.platform) {
            case "Android":
                console.log("Android");
                storageLocation = cordova.file.externalDataDirectory;
                break;
            case "iOS":
                console.log("IOS");
                storageLocation = cordova.file.documentsDirectory;
                break;
        }

        var folderPath = storageLocation;
        window.resolveLocalFileSystemURL(folderPath, function (dirEntry) {
            console.log('file system open: ' + dirEntry.name);
            var tempName = Date.now(); //Name of the file
            console.log(tempName);
            createFile(dirEntry, tempName + ".txt");
            startCamera();
        }, function (err) {
            console.error(err);
        });

    }
}
/* 
    Creates a permanent file on the device.
*/

function createFile (dirEntry, fileName) {
    console.log(fileName);
    dirEntry.getFile(fileName, { create: true, exclusive: false }, function (fileEntry) {
        globalFileEntry = fileEntry;
        console.log(fileEntry);
        console.log("I create file");
    }, function (err) {
        console.error(err);
    });

}


/* 
    Start the CanvasCameraPlugin capturing.
*/
function startCamera () {
    console.log("I start camera")

    CanvasCamera.start(options, function (err) {
        console.error(err);

    }, function (data) {
        window.plugin.CanvasCamera.flashMode(true); //Flashlight would not stay on when IOS device was used. Quickfix.

    });
}

/* 
    Stops the CanvasCameraPlugin capturing.
*/
function stopCamera () {
    window.plugin.CanvasCamera.stop(function (error) {
        console.log('[CanvasCamera stop]', 'error', error);
    }, function (data) {
        console.log('[CanvasCamera stop]', 'data', data);
    });
}


/* 
    Writes to the created file.
*/
function writeFile (dataObj) {
    var isAppend = true;
    globalFileEntry.createWriter(function (fileWriter) {

        fileWriter.onerror = function (e) {
            console.log("Failed file read: " + e.toString());
        };

        if (isAppend) {
            try {
                fileWriter.seek(fileWriter.length);
            }
            catch (e) {
                console.log("file doesn't exist!");
            }
        }
        fileWriter.write(dataObj);
    });
}

/* 
    Reads from the created file.
*/
function readFile () { //Currently not used.

    globalFileEntry.file(function (file) {
        var reader = new FileReader();

        reader.onloadend = function () {
            /*         console.log("Successful file read: " + this.result); */
            //displayFileData(globalFileEntry.fullPath + ": " + this.result);
        };

        reader.readAsText(file);
    }, console.log("Fel vid läsningen av fil"));
}

/* 
    Gets the imageData from the drawn frame and calculates all the RGB values into a single values.
*/
function getAverageRGB (frameElement) {
    let R = 0;
    let G = 0;
    let B = 0;
    let count = 0;
    imgData = frameElement.getImageData(0, 0, 350, 350);
    let arr = imgData.data;
    let length = imgData.data.length;
    let avg = 0;
    for (let i = 0; i < length; i += 4) {
        count++;
        R = arr[i] * 0.299;
        G = arr[i + 1] * 0.587;
        B = arr[i + 2] * 0.114;
        avg += R + G + B;
    }
    avg = avg / count;
    dataObj = new Blob([avg + " " + timeStamp + "\n"], { type: 'text/plain' });
    writeFile(dataObj);
}