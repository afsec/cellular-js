#!/bin/bash
PROGNAME=$0
ARG1=$1
ARG2=$2

DEBUG=0


debug() {
	MSG=$1
	[ X"${DEBUG}" == X"1" ] && echo "DEBUG: ${MSG}"
}

usage() {
	echo "USAGE: ${PROGNAME} nome_do_estado"
	exit 1
}

create_folders() {
	local FOLDER_NAME=$(echo "${1}" | tr '[:upper:]' '[:lower:]')
	[ X"${DEBUG}" == X"1" ] && CMD=echo || CMD=
	$CMD mkdir ${FOLDER_NAME}
	#$CMD touch ${FOLDER_NAME}/state.js
	#printf "### ./${FOLDER_NAME}/state.js ###\n" | tee ${FOLDER_NAME}/state.js
	printf "const state${1} = () => {\n" | tee ${FOLDER_NAME}/state.js
	printf "    // DESC: ...\n" | tee -a ${FOLDER_NAME}/state.js
	printf "    debug(\`state${1}()\`)\n" | tee -a ${FOLDER_NAME}/state.js
	printf "    state${1}Presenter()\n" | tee -a ${FOLDER_NAME}/state.js
	printf "}\n\n" | tee -a ${FOLDER_NAME}/state.js

	#$CMD touch ${FOLDER_NAME}/presenter.js
	#printf "### ./${FOLDER_NAME}/presenter.js ###\n" | tee ${FOLDER_NAME}/state.js
	printf "const state${1}Presenter = () => {\n" | tee ${FOLDER_NAME}/presenter.js
	printf "    debug(\`state${1}Presenter()\`)\n" | tee -a ${FOLDER_NAME}/presenter.js
	printf "    const model = state${1}Model()\n" | tee -a ${FOLDER_NAME}/presenter.js
	printf "    const view = state${1}View(model)\n" | tee -a ${FOLDER_NAME}/presenter.js
	printf "    // AddEvenListener, innerHTML or Call Another State.\n" | tee -a ${FOLDER_NAME}/presenter.js
	printf "}\n\n" | tee -a ${FOLDER_NAME}/presenter.js

	#$CMD touch ${FOLDER_NAME}/model.js
	#printf "### ./${FOLDER_NAME}/model.js ###\n" | tee ${FOLDER_NAME}/state.js
	printf "const state${1}Model = () => {\n" | tee ${FOLDER_NAME}/model.js
	printf "    debug(\`state${1}Model()\`)\n" | tee -a ${FOLDER_NAME}/model.js
	printf "    return {}\n" | tee -a ${FOLDER_NAME}/model.js
	printf "}\n\n" | tee -a ${FOLDER_NAME}/model.js

	#$CMD touch ${FOLDER_NAME}/view.js
	#printf "### ./${FOLDER_NAME}/view.js ###\n" | tee ${FOLDER_NAME}/state.js
	printf "const state${1}View = (obj) => {\n" | tee ${FOLDER_NAME}/view.js
	printf "    debug(\`state${1}View()\`)\n" | tee -a ${FOLDER_NAME}/view.js
	printf "    return \`<span>\${obj}</span>\`\n" | tee -a ${FOLDER_NAME}/view.js
	printf "}\n\n" | tee -a ${FOLDER_NAME}/view.js
	sleep 1
}

main() {
	local NEW_STATE=$1
	debug "main($1)"
	debug "Criando estado [${NEW_STATE}]..."
	create_folders ${NEW_STATE}
	exit 0
}

[ X"${ARG1}" != X"" ] && main ${ARG1} || usage
