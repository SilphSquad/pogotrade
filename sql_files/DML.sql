INSERT INTO offering 
        VALUES (
                (SELECT trainer.id FROM trainer
                        WHERE trainer.trainer_name = [trainer_name_input]),
                    (SELECT pokedex.id FROM pokedex
                                 WHERE pokedex.pokemon_name = [pokemon_name_input] 
                                 and pokedex.regional = [regional]
                                 and pokedex.shiny = [shiny]));

/*******************************************
* * Offer Table
*******************************************/
/* Display table for offering*/
SELECT pokedex.pokemon_name, discord.discord_name, trainer.trainer_name, pokedex.shiny, pokedex.special, pokedex.regional, offering.trainer_id, offering.pokemon_id 
FROM pokedex 
JOIN offering on offering.pokemon_id = pokedex.id 
LEFT JOIN trainer on trainer.id = offering.trainer_id 
LEFT JOIN discord on discord.id = trainer.discord_id 
ORDER BY pokedex.dex_id

/* Search by pokemon */
SELECT pokedex.pokemon_name, discord.discord_name, trainer.trainer_name, pokedex.shiny, pokedex.special, offering.trainer_id, offering.pokemon_id 
FROM pokedex 
JOIN offering on offering.pokemon_id = pokedex.id 
LEFT JOIN trainer on trainer.id = offering.trainer_id 
LEFT JOIN discord on discord.id = trainer.discord_id 
WHERE pokemon.pokemon_name = [input]

/* Search by Discord */
SELECT pokedex.pokemon_name, discord.discord_name, trainer.trainer_name, pokedex.shiny, pokedex.special, offering.trainer_id, offering.pokemon_id 
FROM pokedex 
JOIN offering on offering.pokemon_id = pokedex.id 
LEFT JOIN trainer on trainer.id = offering.trainer_id 
LEFT JOIN discord on discord.id = trainer.discord_id 
WHERE discord.discord_name = [input]

/*Insert into offering*/
INSERT INTO offering VALUES ((SELECT trainer.id FROM trainer WHERE trainer.trainer_name = [trainer_input]), 
(SELECT pokedex.id FROM pokedex WHERE pokedex.pokemon_name = [pokemon_input]
AND pokedex.special = [special_input] 
AND pokedex.shiny = [shiny_input] 
AND pokedex.regional = [regional_input]));

/* Update offer */
UPDATE offering set trainer_id = (SELECT trainer.id from trainer WHERE trainer.trainer_name = [trainer_input]), 
pokemon_id = (SELECT pokedex.id from pokedex where pokedex.pokemon_name = [pokemon_input] 
AND pokedex.special = [special_input] 
AND pokedex.shiny = [shiny_input] 
AND pokedex.regional = [regional_input]) 
WHERE trainer_id = [trainer_selected_id] 
AND pokemon_id = [pokemon_selected_id];
        
/* Delete offer */
DELETE FROM offering WHERE pokemon_id = [selected_pokemon_id] AND trainer_id = [selected_trainer_id];

/*******************************************
* * Accept Table
*******************************************/

/* Display table for accepting*/
SELECT pokedex.pokemon_name, discord.discord_name, trainer.trainer_name, pokedex.shiny, pokedex.special, pokedex.regional, accepting.trainer_id, accepting.pokemon_id 
FROM pokedex 
JOIN accepting on accepting.pokemon_id = pokedex.id 
LEFT JOIN trainer on trainer.id = accepting.trainer_id 
LEFT JOIN discord on discord.id = trainer.discord_id 
ORDER BY pokedex.dex_id

/* Search by pokemon */
SELECT pokedex.pokemon_name, discord.discord_name, trainer.trainer_name, pokedex.shiny, pokedex.special, accepting.trainer_id, accepting.pokemon_id 
FROM pokedex 
JOIN accepting on accepting.pokemon_id = pokedex.id 
LEFT JOIN trainer on trainer.id = accepting.trainer_id 
LEFT JOIN discord on discord.id = trainer.discord_id 
WHERE pokemon.pokemon_name = [input]

/* Search by Discord */
SELECT pokedex.pokemon_name, discord.discord_name, trainer.trainer_name, pokedex.shiny, pokedex.special, accepting.trainer_id, accepting.pokemon_id 
FROM pokedex 
JOIN accepting on accepting.pokemon_id = pokedex.id 
LEFT JOIN trainer on trainer.id = accepting.trainer_id 
LEFT JOIN discord on discord.id = trainer.discord_id 
WHERE discord.discord_name = [input]

/*Insert into accepting*/
INSERT INTO accepting VALUES ((SELECT trainer.id FROM trainer WHERE trainer.trainer_name = [trainer_input]), 
(SELECT pokedex.id FROM pokedex WHERE pokedex.pokemon_name = [pokemon_input]
AND pokedex.special = [special_input] 
AND pokedex.shiny = [shiny_input] 
AND pokedex.regional = [regional_input]));

/* Update accept */
UPDATE accepting set trainer_id = (SELECT trainer.id from trainer WHERE trainer.trainer_name = [trainer_input]), 
pokemon_id = (SELECT pokedex.id from pokedex where pokedex.pokemon_name = [pokemon_input] 
AND pokedex.special = [special_input] 
AND pokedex.shiny = [shiny_input] 
AND pokedex.regional = [regional_input]) 
WHERE trainer_id = [trainer_selected_id] 
AND pokemon_id = [pokemon_selected_id];
        
/* Delete accept */
DELETE FROM accepting WHERE pokemon_id = [selected_pokemon_id] AND trainer_id = [selected_trainer_id];


/*******************************************
* * Team Table
*******************************************/

/* Display table for team*/
SELECT team_name, team_color, id FROM team

/* Delete from team*/
DELETE FROM team WHERE id = [selected_team_id]

/* Insert into team */
INSERT INTO team (team_name, team_color) VALUES ([team_input], [color_input]);

/* Search team */
SELECT team.team_name, id, team.team_color FROM team WHERE team.team_name = [input]

/* Update team */
UPDATE team set team_name = [selected_team_name] WHERE id = [selected_team_id]

/*******************************************
* * Pokedex Table
*******************************************/

/* Display Pokedex table*/
SELECT pokedex.id, pokedex.dex_id, pokedex.pokemon_name, pokedex.regional, pokedex.shiny, pokedex.special FROM pokedex

/* Delete from Pokedex */

DELETE FROM pokedex WHERE id = [selected pokedex_id]

/* Update Pokedex */

UPDATE pokedex set pokemon_name = [selected_pokemon_name], regional = [selected_regional_value], shiny = [selected_shiny_value], special = [selected_special_value] WHERE id = [selected pokedex_id]