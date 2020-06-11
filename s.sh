#!/bin/bash -x

echo "WELCOME TO SNAKE AND LADDER SIMULATION"

START=0
WIN_POSITION=100

diceRolled=0
playerOnePosition=$START
playerTwoPosition=$START

function rollDice()
{
	faceValue=$(( ($RANDOM%6)+1 ))
	diceRolled=$(( $diceRolled+1 ))
}

function playerOptions()
{
	currentPosition=$1
	rollDice
	local noPlay=0
	local ladder=1
	local snake=2
	local option=$(( RANDOM%3 ))

	case $option in
		$noPlay)
			currentPosition=$currentPosition
			#echo "NO MOVEMENT"
			;;
		$ladder)
			currentPosition=$(( $currentPosition+$faceValue ))
			#echo "LADDER"

			if [ $currentPosition -gt $WIN_POSITION ]
			then
				currentPosition=$(( $currentPosition-$faceValue ))
			fi
			;;
		$snake)
			currentPosition=$(( $currentPosition-$faceValue ))

			if [ $currentPosition -lt $START ]
			then
				currentPosition=$START
			fi

			#echo "SNAKE"
			;;
	esac
	echo $currentPosition
}

function winPosition()
{
	while [ $currentPosition -lt $WIN_POSITION ]
	do
		playerOptions

		if [ $currentPosition -eq $WIN_POSITION ]
		then
			currentPosition=$WIN_POSITION
		fi

	echo "Current Position is > "$currentPosition
	done

	echo "WON THE GAME and Reached Final Position > " $WIN_POSITION
	echo "Number of times the dice rolled > " $diceRolled
}

function twoPlayers()
{
	while [ $playerOnePosition -lt $WIN_POSITION ] && [ $playerTwoPosition -lt $WIN_POSITION ]
	do
		playerOnePosition=$(playerOptions $playerOnePosition)
		echo "Player One Position > " $playerOnePosition

		if [ $playerOnePosition -eq $WIN_POSITION ]
		then
			echo "Player One Won The Game"
 			break
		fi

		playerTwoPosition=$(playerOptions $playerTwoPosition)
		echo "Player Two Positon > " $playerTwoPosition

		if [ $playerTwoPosition -eq $WIN_POSITION ]
		then
			echo "Player Two Won The Game"
		fi
		diceRolled=$(( $diceRolled+1 ))
	done
}

twoPlayers
echo "Number of times the dice rolled > " $diceRolled
