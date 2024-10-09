#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


query="SELECT elements.atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id=types.type_id"
if [[ $1 =~ ^[0-9]{1,2}$ ]]; then
  query+=" WHERE elements.atomic_number=$1;"
elif [[ $1 =~ ^[A-Za-z]{1,2}$ ]]; then
  query+=" WHERE symbol='$1';"
else
  query+=" WHERE name='$1';"
fi

resultString=$($PSQL "$query")

if [[ -z  $1 ]]; then
  echo "Please provide an element as an argument."
elif [[ -z $resultString ]]; then
  echo "I could not find that element in the database."
else 
  IFS='|' read -r number name symbol type mass m_point b_point <<< "$resultString"
  echo "The element with atomic number $number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $m_point celsius and a boiling point of $b_point celsius."
fi