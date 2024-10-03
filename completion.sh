#!/bin/bash

echo init npm completion
source <(npm completion)

echo init pandoc completion
source <(pandoc --bash-completion)

