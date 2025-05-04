#!/bin/bash


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

function mvnArtefactVersion(){
	# Extraire la version du projet courant
	version=$(xmllint --xpath "/*[local-name()='project']/*[local-name()='version']/text()" pom.xml)

	# Extraire l'artifactId du projet courant
	artifactId=$(xmllint --xpath "/*[local-name()='project']/*[local-name()='artifactId']/text()" pom.xml)

	# Afficher les résultats
	echo "${artifactId}@${version}"
}