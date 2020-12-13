const stateHomePresenter = async (message) => {
    debug(`stateHomePresenter()`)
    const model = await stateHomeModel(message)
    const view = await stateHomeView(model)
    // AddEvenListener, innerHTML or Call Another State.

}

