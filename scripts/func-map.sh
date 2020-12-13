#!/bin/bash
DOC_DIR="./tmp"
FUNC_MAP="${DOC_DIR}/func_map.md"

# * CLEAN OLD FILE
clean_file() {
    printf "\tRunning $FUNCNAME...\n"
    rm ${FUNC_MAP}
}

# * MAP ALL THE FUNCTIONS
map_func() {
    printf "\tRunning $FUNCNAME...\n"
    printf "| NAME |  DESCRIPTION |" >>$FUNC_MAP
    printf "\n" >>$FUNC_MAP
    printf "|---|---|" >>$FUNC_MAP
    printf "\n" >>$FUNC_MAP
    for arquivo in $(find ./ -name "state.js"); do
        nome_funcao=$(head -n1 $arquivo | awk '{print $2}')
        # comentario_funcao=$(grep '// DESC:' $arquivo | cut -d ':' -f 2)
        comentario_funcao=$(awk 'BEGIN{FS=":"} /\/\/ DESC:/{print $2}' $arquivo)
        printf "|*%1s" $nome_funcao >>$FUNC_MAP
        printf "*|" >>$FUNC_MAP
        printf "%1s " $comentario_funcao >>$FUNC_MAP
        printf "|" >>$FUNC_MAP
        printf "\n" >>$FUNC_MAP
    done
}

main() {
    clean_file
    map_func
}

main
