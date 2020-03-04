const debug = message => ((typeof (DEBUG) !== 'undefined') && (DEBUG === true)) ? (typeof (message) !== 'undefined') ? console.log(message) : false : false


const waitForElement = (props, callBack) => {
    debug('waitForElement()')
    debug(props)
    const maxTries = 50
    const selector = props["selector"]
    var timeOut = null
    var tries = null

    if (typeof (props["timeOut"]) === 'undefined') {
        // Default timeOut: 100 miliseconds
        timeOut = 100
    } else {
        timeOut = props["timeOut"]
    }

    if (typeof (callBack) === 'undefined') {
        console.error(`WFE: ERROR -> Undefined Callback function`)
        return false
    } else {
        if (typeof (props["tries"]) !== 'undefined') {
            tries = props["tries"]
        } else {
            tries = 0
            debug('WFE: ERROR -> undefined tries')
        }

        tries += 1

        if (document.querySelector(selector) != null) {
            debug(`WFE: Found: ${selector}`)
            callBack()
        } else {
            if (tries < maxTries) {
                debug(`WFE:                  try(#${tries}) waiting for: ${selector}`)
                setTimeout(() => {
                    waitForElement({ "selector": `${selector}`, "timeOut": timeOut, "tries": tries }, callBack)
                }, timeOut);
            } else {
                console.error(`WFE: ERROR -> Exausted tries(${tries})!: ${selector}`)
                return false
            }
        }
    }

}


const getArrIdx = (arr, id) => {
    debug('getArrIdx()')
    if (Array.isArray(arr)) {
        if (typeof (id) === 'number') {
            if (arr.length > 0) {
                const idx = arr.findIndex(item => item.id === (id / 1))
                if (idx > -1) {
                    return idx
                } else {
                    debug('getArrIdx(): ERROR -> Not Found')
                }
            } else {
                debug('getArrIdx(): ERROR -> Array empty')
            }
        } else {
            debug('getArrIdx(): ERROR -> Type mismatch: id')
        }
    } else {
        debug('getArrIdx(): ERROR -> Type mismatch: arr')
    }
}



