#The MIT License (MIT)
#
#Copyright (c) 2024 completion.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


if [[ "$0" == "$BASH_SOURCE" ]]; then
    echo "Erreur : ce script doit être sourcé, pas exécuté." >&2
    exit 1
fi


function _lazyPandoc() {
    # Load the real pandoc completion function
    source <(pandoc --bash-completion)
    # Call the real completion immediately
    $(complete -p pandoc | awk -F "-F" '{ print $2}' | awk -F " " '{print $1}') "$@"
}

function _lazyNpm() {
    # Load the real npm completion function
    source <(npm completion)
    # Call the real completion immediately
    $(complete -p npm | awk -F "-F" '{ print $2}' | awk -F " " '{print $1}') "$@"
}

which npm > /dev/null
if [[ $? -eq 0 ]]
then
    echo init npm completion
    complete -F _lazyNpm npm
fi

which pandoc > /dev/null
if [[ $? -eq 0 ]]
then
    echo init pandoc completion
    complete -F _lazyPandoc pandoc
fi
