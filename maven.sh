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