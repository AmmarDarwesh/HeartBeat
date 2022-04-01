class Logger {
    constructor(filename) {
        this.filename = filename
        this.buffer = ''
        this.writing = false
        this.storageLocation = ''
        this.fileEntry = ''
    }

    /**
     * Opens a file.
     * @param {string} directory - directory where the file is located
     * @param {string} filename - filename to be opened
     * @param {boolean} forcecreate - create the file if it doesn't exist
    */
    static async openFile (directory, filename, forcecreate) {
        return new Promise((resolve, reject) => {
            window.resolveLocalFileSystemURL(directory, function (dirEntry) {
                dirEntry.getFile(filename, { create: forcecreate, exclusive: false }, resolve, reject)
            }, reject)
        })
    }

    /**
     * Creates a logger, instatiates the file and prepares it for logging.
     */
    async create () {
        this.buffer = ''
        this.writing = false

        if (device.platform === 'Android') {
            this.storageLocation = cordova.file.externalDataDirectory
        } else if (device.platform === 'iOS') {
            this.storageLocation = cordova.file.documentsDirectory
        } else throw new Error('Platform must be android or ios')

        this.fileEntry = await Logger.openFile(this.storageLocation, this.filename, true)
    }

    writeBuffer (completed, error) {
        this.writing = true
        let toWrite = this.buffer
        this.buffer = ''

        this.fileEntry.createWriter((fileWriter) => {
            fileWriter.onerror = error
            fileWriter.onwriteend = () => {
                if (this.buffer.length > 0) {
                    // buffer not empty, keep writing
                    this.writeBuffer(completed, error)
                } else {
                    // buffer empty, completed!
                    this.writing = false
                    if (completed) completed()
                }
            }
            fileWriter.seek(fileWriter.length)
            // dataObj = new Blob([line], { type: 'text/plain' })
            fileWriter.write(toWrite)
        }, error)
    }

    /**
    * Appends lines to the logger. 
    * If the logger is busy writing, the promise resolves immediately
    * @param {string} line - the text to be appended
    */
    async log (line) {
        // add the line to the buffer
        this.buffer += line

        return new Promise((resolve, reject) => {
            // if writing, return immediately
            if (this.writing) resolve()
            else this.writeBuffer(resolve, reject)
        })
    }

    /**
     * Deletes a temporary logfile.
    */
    async delete () {
        this.fileEntry = await Logger.openFile(this.storageLocation, this.filename, false)
        return new Promise((resolve, reject) => {
            this.fileEntry.remove(resolve, reject)
        })
    }
}