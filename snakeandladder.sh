#!/bin/bash -x

echo "Welcome to Snake and Ladder simulator"

player=1
position=0

function roll()
{
	num=$(( RANDOM % 6 + 1))
}

roll
echo "Die number - $num"
