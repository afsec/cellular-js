// const actorDadosTeste = () => {
// DESC: ...
// debug(`actorDadosTeste()`)
// actorDadosTestePresenter()
const debug = message => ((typeof (DEBUG) !== 'undefined') && (DEBUG === true)) ? (typeof (message) !== 'undefined') ? console.log(message) : false : false

// delay 10ms between operations

var database = []

// ? maybe eventListener `onchange` at messageQueue to interact with `database` variable
// ? Implement Queue using `enqueue` => `push` and `dequeue` => `shift`
// ? Using a array of Promises?
var messageQueue = []

self.addEventListener('message', (e) => {
    var beforeLength = messageQueue.length
    // Insight: Comparing between messageQueue current length and `beforeLength`

    debug(`actorDadosTeste()`)
    var data = e["data"]
    var returnMessage = null
    switch (data["cmd"]) {
        case 'createOne':
            messageQueue.push(data)
            returnMessage = `data.cmd: ${data["cmd"]}`
            debug(`${returnMessage}`)

            self.postMessage(returnMessage)
            break
        case 'readAll':
            returnMessage = `ReadAll: ${JSON.stringify(messageQueue)}`
            // messageQueue.forEach(obj => console.log(obj))
            console.table(messageQueue)
            self.postMessage(returnMessage)
            debug(`${returnMessage}`)
            break;
        case 'stop':
            returnMessage = `WORKER STOPPED: ${data.msg} (buttons will no longer work)')`
            debug(`${returnMessage}`)
            self.postMessage(returnMessage)
            self.close(); // Terminates the worker.
            break;
        default:
            returnMessage = `Unknown command: ${data.msg}`
            debug(`${returnMessage}`)
            self.postMessage(returnMessage)
            actorDadosTestePresenter(data.msg)
    };
}, false)
// }

