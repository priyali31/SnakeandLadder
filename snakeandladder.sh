#!/bin/bash -x

echo "Welcome to Snake and Ladder simulator"

#Constants
INITIAL_POSITION=0
WINNING_POSITION=100
IS_VALID=true

#Variables
playerPosition=$INITIAL_POSITION
dieRolls=0
switchTurn=1

declare -A positionHistory

function dieRoll()
{

local NO_PLAY=0
local SNAKE=1
local LADDER=2

   dieNum=$(( RANDOM % 6 + 1))
   option=$(( RANDOM % 3 ))

   case $option in
   $NO_PLAY)
      playerPosition=$(( playerPosition + $NO_PLAY ))
   ;;
   $SNAKE)
      if [ $(( playerPosition-dieNum )) -lt $INITIAL_POSITION ]
      then
         playerPosition=$INITIAL_POSITION
      else
         playerPosition=$(( playerPosition - dieNum ))
      fi
   ;;
   $LADDER)
      if [ $(( playerPosition+dieNum )) -gt $WINNING_POSITION ]
      then
         playerPosition=$(( playerPosition - dieNum ))
      else
         playerPosition=$(( playerPosition + dieNum ))
      fi
   ;;
   esac
}

function checkOutWin()
{
   while ( $IS_VALID )
   do
      dieRoll
      (( dieRolls++ ))
      positionHistory[ "Roll $dieRolls" ]=$playerPosition

         if [ $playerPosition -eq $WINNING_POSITION ]
         then
            break
         elif [ $playerPosition -lt $INITIAL_POSITION ]
         then
            playerPosition=$INITIAL_POSITION
         fi
   done

echo "position - $playerPosition"
echo "Die total Rolls : $dieRolls"
}

function switchPlayer()
{
   while [ true ]
   dieRoll
   (( switchTurn++ ))
   do
      if [ $(( switchTurn%2 )) -eq 1 ]
      then
        if [ $playerPosition -eq $WINNING_POSITION ]
        then
            echo "Player 1 Won"
	break
	fi
      elif [ $(( switchTurn%2 )) -eq 0 ]
        then
        if [ $playerPosition -eq $WINNING_POSITION ]
        then
             echo "Player 2 Won"
        break
        fi
      fi
   done
}
switchPlayer
