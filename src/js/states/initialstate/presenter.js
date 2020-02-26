const stateInitialStatePresenter = () => {
    debug(`stateInitialStatePresenter()`)
    const model = stateInitialStateModel()
    const view = stateInitialStateView(model)
    // AddEvenListener, innerHTML or Call Another State.

    // Rendering view at DOM Entrypoint element
    waitForElement({ "selector": "div#app" }, () => {
        document.querySelector("div#app").innerHTML = view
    })

    waitForElement({ "selector": "button#create-one" }, () => {
        document.querySelector("button#create-one").addEventListener('click', () => {
           debug('create-one')
        })
    })

    waitForElement({ "selector": "button#read-all" }, () => {
        document.querySelector("button#read-all").addEventListener('click', () => {
            debug('read-all')
        })
    })

    waitForElement({ "selector": "button#unknown-cmd" }, () => {
        document.querySelector("button#unknown-cmd").addEventListener('click', () => {
            debug('unknown-cmd')
        })
    })

}
