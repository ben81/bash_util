

function isNpm() {
	test -f package.json
}



function npmNameVersion() {
	isNpm
	if [[ $? -eq 0 ]]
	then
    	jq -r '"\(.name)@\(.version)"' package.json
    fi
}

