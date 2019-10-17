#!/bin/bash
try(){
	excepted="$1"
	input="$2"

	./9cc "$input" > tmp.s
	gcc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$excepted" ]; then
		echo "$input => $actual"
	else
		echo "$input => $excepted excepted, but got $actual"
		exit 1
	fi
}

try 0 0
try 42 42
try 21 "5+20-4"
echo OK
