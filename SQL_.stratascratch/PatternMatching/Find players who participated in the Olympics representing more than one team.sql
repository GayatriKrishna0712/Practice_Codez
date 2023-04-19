#Find players who participated in the Olympics representing more than one team. Output the player name, team, games, sport, and the medal.

select name,team,games,sport,medal from olympics_athletes_events
where team like '%/%';
