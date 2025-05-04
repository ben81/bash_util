
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo ${SCRIPT_DIR}


source ${SCRIPT_DIR}/pathUtil.sh
source ${SCRIPT_DIR}/gitUtil.sh
source ${SCRIPT_DIR}/completion.sh
source ${SCRIPT_DIR}/cdrom.sh
source ${SCRIPT_DIR}/docker.sh
source ${SCRIPT_DIR}/maven.sh
source ${SCRIPT_DIR}/prompt.sh

