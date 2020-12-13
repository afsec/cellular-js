const stateBaseTemplate = (sender, message) => {
    // DESC: ...
    debug(`stateBaseTemplate()`)
    const currentState = "BaseTemplate"

    // ACL: Insert HERE all allowed senders.
    const AccessControlList = [
        "main"
    ]

    const errorMessage = `CELLULAR_JS - ACL Error: ${sender} cannot send message to ${currentState}. Try insert "${sender}" into ${currentState} AccessControlList at "${currentState.toLowerCase()}/state.js"`
    const isAllowedSender = (sender) => (AccessControlList.indexOf(sender) > -1) ? true : false
    if (isAllowedSender(sender)) {
        stateBaseTemplatePresenter(message)
    } else {
        debug(errorMessage, "ERROR")
    }
}

