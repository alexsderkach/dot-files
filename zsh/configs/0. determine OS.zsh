function is_osx() {
	if [[ `uname` == 'Darwin' ]];
	then
		return 0;
	else
		return 1;
	fi
}

function is_linux() {
	if [[ `uname` == 'Linux' ]];
	then
		return 0;
	else
		return 1;
	fi
}