#!/bin/bash -x

echo "Welcome to Snake and Ladder simulator"

#Constants
INITIAL_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
SNAKE=1
LADDER=2

#Variables
player=1
playerPosition=$INITIAL_POSITION

function game()
{

	dieNum=$(( RANDOM % 6 + 1))
	option=$(( RANDOM % 3 ))

	case $option in
	$NO_PLAY)
		playerPosition=$(( playerPosition + $NO_PLAY ))
		;;
	$SNAKE)
                playerPosition=$(( playerPosition - dieNum ))
		;;
	$LADDER)
		if [ $(( playerPosition+dieNum )) -gt $WINNING_POSITION ]
		then
			playerPosition=$(( playerPosition-dieNum ))
		else
                	playerPosition=$(( playerPosition + dieNum ))
		fi
		;;
	esac
}

function checkoutWin()
{
	while ( true )
	do
	game
		if [ $playerPosition -eq $WINNING_POSITION ]
		then
			break
		elif [ $playerPosition -lt $INITIAL_POSITION ]
		then
			playerPosition=$INITIAL_POSITION
		fi
	done
}

#Main
checkoutWin
echo "position - $playerPosition"
