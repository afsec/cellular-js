#!/bin/bash
PROGNAME=$0

DEBUG=0


debug() {
    MSG=$1
    [ X"${DEBUG}" == X"1" ] && echo "DEBUG: ${MSG}"
}

usage() {
    echo 'USAGE: make state NAME="SomeName"'
    exit 1
}

scafolding_state() {
    [ X"${DEBUG}" == X"1" ] && CMD=echo || CMD=
    $CMD mkdir ${FOLDER_NAME}
    #$CMD touch ${FOLDER_NAME}/state.js
    #printf "### ./${FOLDER_NAME}/state.js ###\n" > ${FOLDER_NAME}/state.js
    printf "const state${1} = (sender, message) => {\n" > ${FOLDER_NAME}/state.js
    printf "    // DESC: ...\n" >> ${FOLDER_NAME}/state.js
    printf "    debug(\`state${1}()\`)\n" >> ${FOLDER_NAME}/state.js
    printf '    const currentState = "%s"\n\n' ${1} >> ${FOLDER_NAME}/state.js
    printf '    // ACL: Insert HERE all allowed senders.\n' >> ${FOLDER_NAME}/state.js
    printf '    const AccessControlList = [\n' >> ${FOLDER_NAME}/state.js
    printf '        ""\n' >> ${FOLDER_NAME}/state.js
    printf '    ]\n\n' >> ${FOLDER_NAME}/state.js
    printf '    const errorMessage = `CELLULAR_JS - ACL Error: ${sender} cannot send message to ${currentState}. Try insert "${sender}" into ${currentState} AccessControlList at "${currentState.toLowerCase()}/state.js"`\n' >> ${FOLDER_NAME}/state.js
	printf '    const isAllowedSender = (sender) => (AccessControlList.indexOf(sender) > -1) ? true : false\n' >> ${FOLDER_NAME}/state.js
    printf '    if (isAllowedSender(sender)) {\n' >> ${FOLDER_NAME}/state.js
    printf "        state${1}Presenter(message)\n" >> ${FOLDER_NAME}/state.js
    printf '    } else {\n' >> ${FOLDER_NAME}/state.js
    printf '        debug(errorMessage, "ERROR")\n' >> ${FOLDER_NAME}/state.js
    printf '    }\n' >> ${FOLDER_NAME}/state.js
    printf "}\n\n" >> ${FOLDER_NAME}/state.js

    #$CMD touch ${FOLDER_NAME}/presenter.js
    #printf "### ./${FOLDER_NAME}/presenter.js ###\n" > ${FOLDER_NAME}/state.js
    printf "const state${1}Presenter = async (message) => {\n" > ${FOLDER_NAME}/presenter.js
    printf "    debug(\`state${1}Presenter()\`)\n" >> ${FOLDER_NAME}/presenter.js
    printf "    const model = await state${1}Model(message)\n" >> ${FOLDER_NAME}/presenter.js
    printf "    const view = await state${1}View(model)\n" >> ${FOLDER_NAME}/presenter.js
    printf "    // AddEvenListener, innerHTML or Call Another State.\n" >> ${FOLDER_NAME}/presenter.js
    printf "}\n\n" >> ${FOLDER_NAME}/presenter.js

    #$CMD touch ${FOLDER_NAME}/model.js
    #printf "### ./${FOLDER_NAME}/model.js ###\n" > ${FOLDER_NAME}/state.js
    printf "const state${1}Model = async (message) => {\n" > ${FOLDER_NAME}/model.js
    printf "    debug(\`state${1}Model()\`)\n" >> ${FOLDER_NAME}/model.js
    printf "    return message\n" >> ${FOLDER_NAME}/model.js
    printf "}\n\n" >> ${FOLDER_NAME}/model.js

    #$CMD touch ${FOLDER_NAME}/view.js
    #printf "### ./${FOLDER_NAME}/view.js ###\n" > ${FOLDER_NAME}/state.js
    printf "const state${1}View = async (modelResult) => {\n" > ${FOLDER_NAME}/view.js
    printf "    debug(\`state${1}View()\`)\n" >> ${FOLDER_NAME}/view.js
    printf "    return modelResult\n" >> ${FOLDER_NAME}/view.js
    printf "    // * or try:\n" >> ${FOLDER_NAME}/view.js
    printf "    // return \`<span>\${modelResult}</span>\`\n" >> ${FOLDER_NAME}/view.js
    printf "}\n\n" >> ${FOLDER_NAME}/view.js
    sleep 1
}

main() {
    NEW_STATE=$1
    FOLDER_NAME=$(echo "${NEW_STATE}" | tr '[:upper:]' '[:lower:]')
        debug "main($1)"
    if [ -d ./src/js/states/${FOLDER_NAME} ];then
        echo "ERROR: [${NEW_STATE}] already exists!"
        exit 1
    else
        debug "Scafolding [${NEW_STATE}]..."
        scafolding_state ${NEW_STATE}
        mv -v ${FOLDER_NAME} ./src/js/states/
        exit 0
    fi

}

[ X"${1}" != X"" ] && main ${1} || usage
