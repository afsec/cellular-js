const stateInitialStatePresenter = () => {
    debug(`stateInitialStatePresenter()`)
    const model = stateInitialStateModel()
    const view = stateInitialStateView(model)
    // AddEvenListener, innerHTML or Call Another State.

    // Rendering view at DOM Entrypoint element
    waitForElement({ "selector": "div#app" }, () => {
        document.querySelector("div#app").innerHTML = view
    })

    // Creating Worker and add events listeners
    var worker = new Worker('/js/workers/dadosteste.js')

    worker.addEventListener('message', function (e) {
        document.getElementById('result').textContent = e.data;
    }, false)

    waitForElement({ "selector": "button#create-one" }, () => {
        document.querySelector("button#create-one").addEventListener('click', () => {
            worker.postMessage({ "cmd": "createOne", "msg": "Hi!" })
        })
    })

    waitForElement({ "selector": "button#read-all" }, () => {
        document.querySelector("button#read-all").addEventListener('click', () => {
            // worker.terminate() from this script would also stop the worker.
            worker.postMessage({ "cmd": "readAll", "msg": "Bye" })
        })
    })

    waitForElement({ "selector": "button#unknown-cmd" }, () => {
        document.querySelector("button#unknown-cmd").addEventListener('click', () => {
            // worker.terminate() from this script would also stop the worker.
            worker.postMessage({ "cmd": "foobard", "msg": "???" })
        })
    })

}
