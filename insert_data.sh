#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

while IFS="," read -r year round winner opponent winner_goals opponent_goals
do

  win_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")

  if [[ ! -n $win_id ]] ; then
    echo win_id=$($PSQL "INSERT INTO teams (name) VALUES ('$winner') RETURNING team_id;")
  fi

  op_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")

  if [[ ! -n $op_id ]] ; then
    echo op_id=$($PSQL "INSERT INTO teams (name) VALUES ('$opponent') RETURNING team_id;")
  fi

done < <(tail -n +2 games.csv)

while IFS="," read -r year round winner opponent winner_goals opponent_goals
do

 win_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
  op_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
  echo $($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
		VALUES ($year, '$round', $win_id, $op_id, $winner_goals, $opponent_goals);")
  
done < <(tail -n +2 games.csv)