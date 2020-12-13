const stateDispatcherModel = async (routeFromUrl) => {
    debug(`stateDispatcherModel()`)
    if (Object.keys(ROUTES)) {
        const routesDB = Object.keys(ROUTES)
        const routeFound = routesDB.find(element => element === routeFromUrl)
        if (typeof(routeFound) === 'undefined') {
            return false
        } else {
            return routeFound
        }
    } else {
        return false
    }
}

