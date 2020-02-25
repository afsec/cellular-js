// const actorDadosTeste = () => {
// DESC: ...
// debug(`actorDadosTeste()`)
// actorDadosTestePresenter()
const debug = message => ((typeof (DEBUG) !== 'undefined') && (DEBUG === true)) ? (typeof (message) !== 'undefined') ? console.log(message) : false : false

self.addEventListener('message', (e) => {
    debug(`actorDadosTeste()`)
    var data = e.data;
    var returnMessage = null;
    switch (data.cmd) {
        case 'hi':
            returnMessage = `Hi: ${data.msg}`
            debug(`${returnMessage}`)
            self.postMessage(returnMessage)
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

