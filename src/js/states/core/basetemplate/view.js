const stateBaseTemplateView = async (modelResult) => {
    debug(`stateBaseTemplateView()`)
    return `
    <h1>${currentState}</h1>
    <div id="page-content"></div>
    `
}

