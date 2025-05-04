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