const state404View = async (modelResult) => {
    debug(`state404View()`)
    return `
    <div style="text-align: center;" class="uk-overflow-auto uk-margin-medium-top uk-text-center@m" tabindex="0">
    <div class="uk-card uk-card-default uk-card-body uk-animation-fade">
        <h1>Page not found</h1>
        <span class="uk-text-danger" uk-icon="icon: warning; ratio: 2"></span>
        <h2>Redirecting to previous Page.</h2>
        <p class="uk-text-large"><strong>${modelResult}</strong> is an invalid url.</p>

    </div>
</div>
    `
}

