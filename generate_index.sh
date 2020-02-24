#!/bin/bash
OUTPUT="./dist/index.html.embedded"
SRC_PATH="./dist/htdocs/pages"
CSS_PATH="${SRC_PATH}/css"
EXTLIBS_PATH="${SRC_PATH}/extlibs"
JS_PATH="${SRC_PATH}/js"

begin_index() {
    echo "${FUNCNAME}..."
    awk 'BEGIN {before=1} /\<title\>/ {before=0} {if ((before) || (match($0,/\<title\>/))){print }}' ${SRC_PATH}/index.html >${OUTPUT}
}

embed_logo() {
    printf '<link rel="icon" href="data:image/png;base64, ' >>${OUTPUT}
    base64 ${SRC_PATH}/assets/img/favicon.ico | tr -d '\n' >>${OUTPUT}
    printf '"/>\n' >>${OUTPUT}

    #   <link rel="icon" href="/pages/assets/img/favicon.ico">

}

embed_bootstrap() {
    echo "${FUNCNAME}..."
    printf '\n<style type="text/css">\n' >>${OUTPUT}
    cat ${CSS_PATH}/bootstrap.min.css >>${OUTPUT}
    printf '\n</style>\n' >>${OUTPUT}
}

embed_style() {
    echo "${FUNCNAME}..."
    printf '\n<style type="text/css">\n' >>${OUTPUT}
    cat ${CSS_PATH}/style.*.css >>${OUTPUT}
    printf '\n</style>\n' >>${OUTPUT}
}

embed_chart() {
    echo "${FUNCNAME}..."
    printf '\n<script>\n' >>${OUTPUT}
    cat ${EXTLIBS_PATH}/Chart.min.js >>${OUTPUT}
    printf '\n</script>\n' >>${OUTPUT}
}

embed_label_plugin() {
    echo "${FUNCNAME}..."
    printf '\n<script>\n' >>${OUTPUT}
    cat ${EXTLIBS_PATH}/plugin-label.min.js >>${OUTPUT}
    printf '\n</script>\n' >>${OUTPUT}
}

embed_d3_min() {
    echo "${FUNCNAME}..."
    printf '\n<script>\n' >>${OUTPUT}
    cat ${EXTLIBS_PATH}/d3.min.js >>${OUTPUT}
    printf '\n</script>\n' >>${OUTPUT}
}

embed_d3_pie() {
    echo "${FUNCNAME}..."
    printf '\n<script>\n' >>${OUTPUT}
    cat ${EXTLIBS_PATH}/d3pie.js >>${OUTPUT}
    printf '\n</script>\n' >>${OUTPUT}
}

embed_mainjs() {
    echo "${FUNCNAME}..."
    printf '\n<script>\n' >>${OUTPUT}
    cat ${JS_PATH}/main.*.js >>${OUTPUT}
    printf '\n</script>\n' >>${OUTPUT}
}

finalize_index() {
    echo "${FUNCNAME}..."

    cat <<EOS >>${OUTPUT}
</head>

<body>
    <div id="app"></div>
</body>

</html>
EOS

}

deploy_index() {
    cp -v ${OUTPUT} ~/src/dist/htdocs/pages/index.html

}

main() {
    begin_index
    embed_logo
    embed_bootstrap
    embed_style
    embed_chart
    embed_label_plugin
    embed_d3_min
    embed_d3_pie
    embed_mainjs
    finalize_index
    deploy_index
}

main