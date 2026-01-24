#The MIT License (MIT)
#
#Copyright (c) 2024-2026 docker.sh
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

function _internal_dockerMount() {

    echo "|Image| Volume name| Source| Destination| Mode"
    for name in $(docker ps --format '{{.Names}}')
    do
        docker inspect --format "{{range .Mounts}}{{printf \"|$name | %-10s | %-25s | %-20s | %-4s |\n\" .Name .Source .Destination .Mode}}{{end}}"  $name
    done
}

function dockerMount() {
    _internal_dockerMount| column -t  -s '|' -o '|'
}


function dockerPs() {
    docker ps -a  --no-trunc --format  'table  {{.ID}}|{{.Image}}|{{.Names}}|{{.Networks}}|{{.Ports}}|{{.Label "com.docker.compose.project.config_files"}}'| column -t  -s '|' -o '|'
}

function dockerImage() {
    docker images --format "table {{.ID}}|{{.Repository}}|{{.Tag}}|{{.Digest}}|{{.CreatedSince}}|{{.CreatedAt}}|{{.Size}}|{{.Containers}}|{{.SharedSize}}|{{.UniqueSize}}|{{.VirtualSize}}" | column -t -s '|' -o '|'
}

function dockerImageJs() {
    docker images --format json | jq .
}

function dockerPort() {
    for name  in $(docker ps --format '{{.Names}}') ; do docker port $name | sed "s/^/${name}|/"; done | column -s "|" -t -o " | "
}

