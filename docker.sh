

function _internal_dockerMount(){

echo "|Image| Volume name| Source| Destination| Mode"
for name in $(docker ps --format '{{.Names}}')
do	
	docker inspect --format "{{range .Mounts}}{{printf \"|$name | %-10s | %-25s | %-20s | %-4s |\n\" .Name .Source .Destination .Mode}}{{end}}"  $name
done
}
function dockerMount(){
  _internal_dockerMount| column -t  -s '|' -o '|'
}
