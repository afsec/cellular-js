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
	local NOME_PASTA=$(echo "${1}" | tr '[:upper:]' '[:lower:]')
	[ X"${DEBUG}" == X"1" ] && CMD=echo || CMD=
	$CMD mkdir ${NOME_PASTA}
	#$CMD touch ${NOME_PASTA}/state.js
	#printf "### ./${NOME_PASTA}/state.js ###\n" | tee ${NOME_PASTA}/state.js
	printf "const state${1} = () => {\n" | tee ${NOME_PASTA}/state.js
	printf "    // DESC: ...\n" | tee -a ${NOME_PASTA}/state.js
	printf "    debug(\`state${1}()\`)\n" | tee -a ${NOME_PASTA}/state.js
	printf "    state${1}Presenter()\n" | tee -a ${NOME_PASTA}/state.js
	printf "}\n\n" | tee -a ${NOME_PASTA}/state.js

	#$CMD touch ${NOME_PASTA}/presenter.js
	#printf "### ./${NOME_PASTA}/presenter.js ###\n" | tee ${NOME_PASTA}/state.js
	printf "const state${1}Presenter = () => {\n" | tee ${NOME_PASTA}/presenter.js
	printf "    debug(\`state${1}Presenter()\`)\n" | tee -a ${NOME_PASTA}/presenter.js
	printf "    const model = state${1}Model()\n" | tee -a ${NOME_PASTA}/presenter.js
	printf "    const view = state${1}View(model)\n" | tee -a ${NOME_PASTA}/presenter.js
	printf "    // AddEvenListener, innerHTML or Call Another State.\n" | tee -a ${NOME_PASTA}/presenter.js
	printf "}\n\n" | tee -a ${NOME_PASTA}/presenter.js

	#$CMD touch ${NOME_PASTA}/model.js
	#printf "### ./${NOME_PASTA}/model.js ###\n" | tee ${NOME_PASTA}/state.js
	printf "const state${1}Model = () => {\n" | tee ${NOME_PASTA}/model.js
	printf "    debug(\`state${1}Model()\`)\n" | tee -a ${NOME_PASTA}/model.js
	printf "    return {}\n" | tee -a ${NOME_PASTA}/model.js
	printf "}\n\n" | tee -a ${NOME_PASTA}/model.js

	#$CMD touch ${NOME_PASTA}/view.js
	#printf "### ./${NOME_PASTA}/view.js ###\n" | tee ${NOME_PASTA}/state.js
	printf "const state${1}View = (obj) => {\n" | tee ${NOME_PASTA}/view.js
	printf "    debug(\`state${1}View()\`)\n" | tee -a ${NOME_PASTA}/view.js
	printf "    return \`<span>\${obj}</span>\`\n" | tee -a ${NOME_PASTA}/view.js
	printf "}\n\n" | tee -a ${NOME_PASTA}/view.js
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
