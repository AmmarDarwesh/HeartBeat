/* 
    Plugins needed:
    CordovaCameraPlugin
    CordovaDevice
    CordovaFile
*/
document.addEventListener('deviceready', onDeviceReady, false)
document.getElementById('buttonStart').onclick = startCapture
document.getElementById('buttonStop').onclick = stopCapture
let globalFileEntry
let startTimeStamp, frameTimeStamp
let accx, accy, accz
let accGx, accGy, accGz

let USE_FLASH = true
let started = false

/* 
* Variable 'options' sets the options for the CanvasCameraPlugin.
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
    flashMode: USE_FLASH,
    use: 'data',     //Needs to be 'data', 'file' didn't work for IOS devices.
    onBeforeDraw: async function (frame) {
        let lum = getLuminosity(frame.element.getContext('2d'))
        let ts = frameTimeStamp - startTimeStamp
        let line = ts + ', ' + lum + ', ' + accx + ', ' + accy + ', ' + accz + ', ' + accGx + ', ' + accGy + ', ' + accGz + '\n'
        await appendToFile(line)
    },
    onAfterDraw: async function (frame) {

    }
};

/* 
* Initializes CordovaCameraPlugin when device is ready
*/
function onDeviceReady () {
    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version)
    var objcanvas = document.getElementById("canvas")
    window.plugin.CanvasCamera.initialize(objcanvas)
}

/* 
* Finds the type of device and locate the right storage location for the device.
*/
async function createFile () {
    var storageLocation = '';
    switch (device.platform) {
        case "Android":
            console.log("Android");
            storageLocation = cordova.file.externalDataDirectory
            break
        case "iOS":
            console.log("IOS");
            storageLocation = cordova.file.documentsDirectory
            break
        default:
            throw new Error('Platform must be android or ios')
    }

    var folderPath = storageLocation

    return new Promise((resolve, reject) => {
        window.resolveLocalFileSystemURL(folderPath, function (dirEntry) {
            var tempName = Date.now() + '.csv' //Name of the file
            dirEntry.getFile(tempName, { create: true, exclusive: false }, function (fileEntry) {
                console.log("file created", tempName)
                globalFileEntry = fileEntry
                resolve()
            }, reject)
        }, reject)
    })
}


/* 
* Start capturing data.
*/
async function startCapture () {
    if (started) return

    console.log("Starting capture")

    await createFile()
    let line = 'timestamp , luminance, accX, accY , accZ, accXwithG, accYwithG, accZwithG\n'
    await appendToFile(line)

    startTimeStamp = Date.now()

    return new Promise(async (resolve, reject) => {
        if (typeof (DeviceMotionEvent.requestPermission) === 'function') {
            await DeviceMotionEvent.requestPermission()
        }
        window.addEventListener('devicemotion', motionHandler, false)

        CanvasCamera.start(options, reject, function (data) {
            if (data && data.output && data.output.images && data.output.images.fullsize) {
                frameTimeStamp = data.output.images.fullsize.timestamp
            }
            // if (USE_FLASH) window.plugin.CanvasCamera.flashMode(true) //Flashlight would not stay on when IOS device was used. Quickfix.
            if (!started) {
                started = true
                resolve()
            }
        })
    })
}

/* 
* Stops the capturing.
*/
async function stopCapture () {
    if (!started) return

    return new Promise((resolve, reject) => {
        window.removeEventListener('devicemotion', motionHandler)
        window.plugin.CanvasCamera.stop(reject, () => {
            console.log('Capture stopped')
            started = false
            resolve()
        })
    })
}

function motionHandler (event) {
    accx = event.acceleration.x.toFixed(4)
    accy = event.acceleration.y.toFixed(4)
    accz = event.acceleration.z.toFixed(4)
    accGx = event.accelerationIncludingGravity.x.toFixed(4)
    accGy = event.accelerationIncludingGravity.y.toFixed(4)
    accGz = event.accelerationIncludingGravity.z.toFixed(4)
}


/* 
* Appends a text line to the created file.
*/
async function appendToFile (line) {
    return new Promise((resolve, reject) => {
        dataObj = new Blob([line], { type: 'text/plain' })

        globalFileEntry.createWriter(function (fileWriter) {

            fileWriter.onerror = reject
            fileWriter.onwriteend = resolve
            try {
                fileWriter.seek(fileWriter.length)
            }
            catch (e) {
                console.error('file doesnt exist!')
                reject()
            }
            fileWriter.write(dataObj)
        })
    })
}

/* 
* Reads from the created file. Currently not used.
*/
function readFile () {

    globalFileEntry.file(function (file) {
        var reader = new FileReader();

        reader.onloadend = function () {
            console.log("Successful file read: " + this.result)
            //displayFileData(globalFileEntry.fullPath + ": " + this.result);
        };

        reader.readAsText(file)
    }, (err) => {
        console.error('Error while writing file', err)
    })
}

/* 
* Gets the imageData from the drawn frame and calculates all the RGB values into a single values.
*/
function getLuminosity (frameElement) {
    let R = 0
    let G = 0
    let B = 0
    let count = 0
    imgData = frameElement.getImageData(0, 0, 350, 350)
    let arr = imgData.data
    let length = imgData.data.length
    let avg = 0
    for (let i = 0; i < length; i += 4) {
        count++
        // transform to luminance
        R = arr[i] * 0.299
        G = arr[i + 1] * 0.587
        B = arr[i + 2] * 0.114
        avg += (R + G + B)
    }
    avg = avg / count
    return avg
}