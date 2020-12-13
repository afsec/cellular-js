const stateDispatcherPresenter = async () => {
    debug(`stateDispatcherPresenter()`)
    const route = routeFromUrl()

    const model = await stateDispatcherModel(route)
    const view = await stateDispatcherView(model)
    // AddEvenListener, innerHTML or Call Another State.
    // TODO: Implement Error handling
    if (model === false) {
        state404(currentState, { "route": `${route}` })
    } else {
        stateBaseTemplate(currentState, null)
        const handler = ROUTES[model]
        // history.pushState(model, currentState, `/#${model}`)
        handler(currentState, null)
    }
}

