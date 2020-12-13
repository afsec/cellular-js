const state404Presenter = async (message) => {
    debug(`state404Presenter()`)
    const model = await state404Model(message)
    const view = await state404View(model)
    // AddEvenListener, innerHTML or Call Another State.
    waitForElement({ "selector": "div#app" }, () => document.querySelector('div#app').innerHTML = view)

}