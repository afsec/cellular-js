const stateInitialStateView = (obj) => {
    debug(`stateInitialStateView()`)
    return `
    <div id="content">
        <div id="span-obj">
            <span>${JSON.stringify(obj)}</span>
        </div>
        <div id="worker-panel">
            <button id="say-hi">Say HI</button>
            <button id="unknown-cmd">Send unknown command</button>
            <button id="stop">Stop worker</button>
            <hr/>
            <output id="result"></output>
        </div>
    </div>
    `

}

