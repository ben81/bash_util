
if [[ "$0" == "$BASH_SOURCE" ]]; then
    echo "Erreur : ce script doit être sourcé, pas exécuté." >&2
    exit 1
fi


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo ${SCRIPT_DIR}

source ${SCRIPT_DIR}/pathUtil.sh
source ${SCRIPT_DIR}/gitUtil.sh
source ${SCRIPT_DIR}/completion.sh
source ${SCRIPT_DIR}/cdrom.sh
source ${SCRIPT_DIR}/docker.sh
source ${SCRIPT_DIR}/maven.sh
source ${SCRIPT_DIR}/npmUtil.sh
source ${SCRIPT_DIR}/prompt.sh
source ${SCRIPT_DIR}/java.sh

function resourceScript() {
    source  ${SCRIPT_DIR}/source.sh
}