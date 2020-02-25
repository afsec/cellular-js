const stateInitialStateView = (obj) => {
    debug(`stateInitialStateView()`)
    return `
    <div id="content">
        <div id="span-obj">
            <span>${JSON.stringify(obj)}</span>
        </div>
        <div id="worker-panel">
            <button id="create-one">Create One</button>
            <button id="unknown-cmd">Send unknown command</button>
            <button id="read-all">Read All</button>
            <hr/>
            <output id="result"></output>
        </div>
    </div>
    `

}

