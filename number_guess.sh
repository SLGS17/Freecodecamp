#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"
SECRET_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
GUESS_COUNT=0

## get username function
GET_USERNAME() {
  if [[ ! $1 ]]
  then
    echo "Enter your username:"
  else
    echo "Username must be a string of 1 to 22 characters, try again:"
  fi
  read USERNAME
}

## get guess function
GET_GUESS() {
  read GUESS
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS -le 1000 && $GUESS -ge 1 ]]
    then
      if [[ $GUESS == $SECRET_NUMBER ]]
      then
        (( GUESS_COUNT ++ ))
        echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
      elif [[ $GUESS -gt $SECRET_NUMBER ]]
      then
        (( GUESS_COUNT ++ ))
        echo "It's lower than that, guess again:"
      else
        (( GUESS_COUNT ++ ))
        echo "It's higher than that, guess again:"
      fi
    else
      (( GUESS_COUNT ++ ))
      echo "That is not between 1 and 1000, guess again:"
    fi
  else
    (( GUESS_COUNT ++ ))
    echo "That is not an integer, guess again:"
  fi
}

GET_USERNAME
until [[ ${#USERNAME} -lt 23 && -n $USERNAME ]]
## ${#VARIABLE} outputs string length of variable, -lt compares it to 23, && -n ensures non-null
do
  GET_USERNAME again
done

GAMES_PLAYED=$($PSQL "SELECT games_played FROM games_data WHERE user_name = '$USERNAME'")
BEST_GUESS=$($PSQL "SELECT best_guess FROM games_data WHERE user_name = '$USERNAME'")

# if username doesn't exist
if [[ -z $GAMES_PLAYED || -z $BEST_GUESS ]]
then
  # insert new username
  INSERT_USERNAME=$($PSQL "INSERT INTO games_data(user_name, games_played) VALUES('$USERNAME', 0)") 
  echo “Welcome, $USERNAME! It looks like this is your first time here.”
else
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses.
fi

echo "Guess the secret number between 1 and 1000:"

GET_GUESS
until [[ $GUESS == $SECRET_NUMBER ]]
	do
		GET_GUESS $GUESS
	done

(( GAMES_PLAYED ++ ))
UPDATE_GAMES=$($PSQL "UPDATE games_data SET games_played = '$GAMES_PLAYED' WHERE user_name = '$USERNAME'")

if [[ -z $BEST_GUESS || $GUESS_COUNT -lt $BEST_GUESS ]]
then
  UPDATE_GUESS=$($PSQL "UPDATE games_data SET best_guess = '$GUESS_COUNT' WHERE user_name = '$USERNAME'")
fi
