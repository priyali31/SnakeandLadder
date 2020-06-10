#!/bin/bash -x

echo "Welcome to Snake and Ladder simulator"

INITIAL_POSITION=0
NO_PLAY=0
SNAKE=1
LADDER=2

player=1
playerPosition=$INITIAL_POSITION

function game()
{

	dieNum=$(( RANDOM % 6 + 1))
	option=$(( RANDOM % 3 ))

	case $option in
	$NO_PLAY)
		playerPosition=$(( playerPosition + 0 ))
		;;
	$SNAKE)
                playerPosition=$(( playerPosition - dieNum ))
		;;
	$LADDER)
                playerPosition=$(( playerPosition + dieNum ))
		;;
	esac
}

game
echo "Player Position - $playerPosition"
