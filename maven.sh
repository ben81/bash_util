#!/bin/bash
#The MIT License (MIT)
#
#Copyright (c) 2024 maven.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


MAVEN_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#echo "maven script ${MAVEN_SCRIPT_DIR}"

if [[ "$0" == "$BASH_SOURCE" ]]; then
    echo "Erreur : ce script doit être sourcé, pas exécuté." >&2
    exit 1
fi

function isMavenProject() {
    test -f pom.xml
}



function mvnCleanPackage() {
    mvn clean package
}

function mvnTree() {
    mvn dependency:tree
}

function mvnCheckVersion() {
    mvn versions:display-dependency-updates
}

function mvnUpdateVersion() {
    mvn versions:use-latest-versions
}


function mvnTransitionalDependencies() {
    isMavenProject
    if [[ $? -eq 0 ]]
    then
        mkdir target -p
        mvn dependency:tree -DoutputFile=target/dep.txt -DoutputType=text 1>/dev/null
        more target/dep.txt | grep  "^|"  | awk -F "- " '{ print $2}' | awk -F ":" '{print  "<dependency><groupId>"$1"</groupId><artifactId>"$2"</artifactId><version>"$4"</version><scope>"$5"</scope></dependency>"}'
    fi
}

function mvnAddNewDep() {
    # Vérifier que le fichier pom.xml existe
    if [ ! -f "pom.xml" ]; then
        echo "Le fichier pom.xml n'existe pas dans le répertoire courant."
    else


        # Vérifier que les arguments nécessaires sont fournis
        if [ "$#" -ne 4 ]; then
            echo "Usage: $0 <groupId> <artifactId> <version> <scope>"
        else

            GROUP_ID=$1
            ARTIFACT_ID=$2
            VERSION=$3
            COMPILE=$4

            xmlstarlet ed -L  \
                -N x="http://maven.apache.org/POM/4.0.0" \
                -s "/x:project/x:dependencies" -t elem -n "dependency" -v "" \
                pom.xml

            xmlstarlet ed -L  \
                -N x="http://maven.apache.org/POM/4.0.0" \
                -s "/x:project/x:dependencies/x:dependency[last()]" -t elem -n "groupId" -v "$GROUP_ID" \
                -s "/x:project/x:dependencies/x:dependency[last()]" -t elem -n "artifactId" -v "$ARTIFACT_ID" \
                -s "/x:project/x:dependencies/x:dependency[last()]" -t elem -n "version" -v "$VERSION" \
                -s "/x:project/x:dependencies/x:dependency[last()]" -t elem -n   "scope" -v "$COMPILE" \
                pom.xml


            echo "La dépendance ${GROUP_ID}:${ARTIFACT_ID}:${VERSION}  scope ${COMPILE} a été ajoutée avec succès au fichier pom.xml."
        fi
    fi
}

function mvnTransitionalDependenciesUpdate() {
    isMavenProject
    if [[ $? -eq 0 ]]
    then
        mkdir target -p
        mvn dependency:tree -DoutputFile=target/dep.txt -DoutputType=text 1>/dev/null
        for l in $( more target/dep.txt | grep  "^|"  | awk -F "\- " '{ print $2}' )
        do
            GROUP_ID=$(echo $l | awk -F ":" '{print $1}')
            ARTIFACT_ID=$(echo $l | awk -F ":" '{print $2}')
            VERSION=$(echo $l | awk -F ":" '{print $4}')
            COMPILE=$(echo $l | awk -F ":" '{print $5}')
            mvnAddNewDep "$GROUP_ID" "$ARTIFACT_ID" "$VERSION" "$COMPILE"
        done
    fi
}


function mvnArtefactVersion() {
    isMavenProject
    if [[ $? -eq 0 ]]
    then
        # Extraire la version du projet courant
        version=$(xmllint --xpath "/*[local-name()='project']/*[local-name()='version']/text()" pom.xml)

        # Extraire l'artifactId du projet courant
        artifactId=$(xmllint --xpath "/*[local-name()='project']/*[local-name()='artifactId']/text()" pom.xml)

        # Afficher les résultats
        echo "${artifactId}@${version}"
    fi
}


function mvnFormat() {
    if [ -f "pom.xml" ]; then
        FOLDER=$PWD
        cd $MAVEN_SCRIPT_DIR/pom
        mvn sortpom:sort  "-Dtarget.pom=${FOLDER}/pom.xml"
        cd "${FOLDER}"
    fi

}