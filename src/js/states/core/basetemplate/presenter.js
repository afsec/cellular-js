const stateBaseTemplatePresenter = async (message) => {
    debug(`stateBaseTemplatePresenter()`)
    const model = await stateBaseTemplateModel(message)
    const view = await stateBaseTemplateView(model)
    // AddEvenListener, innerHTML or Call Another State.
    waitForElement({ "selector": "div#app" }, () => {
        document.querySelector('div#app').innerHTML = view
        // Some another state
        // stateShowProfileMenu(currentState, null)
    })
}

