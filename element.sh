#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Test if empty argument
if [[ -z "$1" ]]
then
  # Empty argument
  echo "Please provide an element as an argument."
else
  # Check if argument is int
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # Check atomic_number
    ELEMENT_CHECK=$($PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number = '$1'")
  else
    # Check if argument is symbol or name, making first character upper case
    ELEMENT_CHECK=$($PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id=types.type_id WHERE elements.symbol = '${1^}' OR elements.name = '${1^}'")
  fi

  # Database search turns up empty
  if [[ -z "$ELEMENT_CHECK" ]]
  then
    # Invalid argument message
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_CHECK" | while read NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELT BAR BOIL
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
fi
