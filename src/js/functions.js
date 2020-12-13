// functions.js

const debug = (message, level = "INFO") => {
    if ((typeof (DEBUG) !== 'undefined') && (DEBUG === true)) {
        if (typeof (message) !== 'undefined') {
            switch (level) {
                case "INFO":
                    console.log("CELLULAR_JS - INFO: ", message)
                    break
                case "WARN":
                    console.warn("CELLULAR_JS - WARNING: ", message)
                    break
                case "ERROR":
                    console.error("CELLULAR_JS - ERROR: ", message)
                    break
                default:
                    console.error(`CELLULAR_JS - debug() function Error: debug(message,"${level}") "${level}" is invalid level. Try "INFO", "WARN" or "ERROR".`)
            }
        }
    }
}

const info = message => debug(message, "INFO")
const warning = message => debug(message, "WARN")
const error = message => debug(message, "ERROR")

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
                    debug(`getArrIdx(): ERROR -> ID (${id}) not Found`)
                    return false
                }
            } else {
                debug('getArrIdx(): ERROR -> Array empty')
                return false
            }
        } else {
            debug('getArrIdx(): ERROR -> Type mismatch: id')
            return false
        }
    } else {
        debug('getArrIdx(): ERROR -> Type mismatch: arr')
        return false
    }
}



const routeFromUrl = () => {
    if (window.location.href.indexOf('#') > -1) {
        const routeDescriptor = window.location.href.split("#")[1]
        if (routeDescriptor.indexOf("/") > -1) {
            const routeFromUrl = "/" + routeDescriptor.split("/")[1]
            return routeFromUrl
        } else {
            return "/"
        }
    } else {
        return "/"
    }
}


const pushUrl = (href) => {
    history.pushState({}, '', href)
    window.dispatchEvent(new Event('popstate'))
}