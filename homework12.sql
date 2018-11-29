-- Hans Vos
-- 1003181
-- Nov 14
-- Homework12

DROP DATABASE IF EXISTS test_hw12;
CREATE DATABASE test_hw12;
USE test_hw12;
SET SQL_SAFE_UPDATES = 0;

-- Use the attached file. Add all necessary SQL statements below the existing code
-- 1. Run the attached create script to create a database and two tables.
-- 2. Alter the team table by adding a column named mascot with datatype CHAR(20). It should be placed after the coach column.
-- 3. Insert 5 rows into the team table.
-- 4. Insert 10 rows into the player table. There should be 2 players on each team. You may have to query the team table after inserting rows to make sure you are using a valid team_id for each player.
-- 5. Use an update statement to change exactly one player name to 'Raymond F. Boyce'. 
-- 6. Delete exactly one player, but not 'Raymond F. Boyce'.

CREATE TABLE team (
team_id INT NOT NULL AUTO_INCREMENT,
team_name CHAR(20) NOT NULL,
coach CHAR(50) NULL,
-- mascot CHAR(20),
num_wins INT NOT NULL DEFAULT 0,
	num_losses INT NOT NULL DEFAULT 0,
CONSTRAINT team_pk PRIMARY KEY (team_id),
CONSTRAINT unique_team UNIQUE (team_name)
);

CREATE TABLE player (
player_id INT NOT NULL AUTO_INCREMENT,
player_name CHAR(50) NOT NULL,
games_played INT NOT NULL DEFAULT 0,
team_id INT NOT NULL,
CONSTRAINT player_pk PRIMARY KEY (player_id),
CONSTRAINT player_team_fk FOREIGN KEY (team_id)
REFERENCES team (team_id)
	ON DELETE RESTRICT 	
    ON UPDATE CASCADE);

SELECT * FROM team;
ALTER TABLE team
ADD COLUMN mascot CHAR(20) AFTER coach;

INSERT INTO team VALUES(1, 'Lakers', 'Luke Walton', null, 7, 6);
INSERT INTO team VALUES(2, 'Warriors', 'Steve Kerr', null, 11, 2);
INSERT INTO team VALUES(3, 'Kings', 'Steve Adams', null, 8, 6);
INSERT INTO team VALUES(4, 'Clippers', 'Doc Rivers', null, 8, 8);
INSERT INTO team VALUES(5, 'Suns', 'Igor Kokoskov', null, 7,9);

INSERT INTO player VALUES(24, 'Kobe Bryant', 45, 1);
INSERT INTO player VALUES(23, 'Lebron James', 50, 1);
INSERT INTO player VALUES(35, 'Kevin Durant', 82, 2);
INSERT INTO player VALUES(30, 'Stephen Curry', 82, 2);
INSERT INTO player VALUES(2, 'Devin Fox', 80, 3);
INSERT INTO player VALUES(10, 'Demarcus Cousin', 72, 3);
INSERT INTO player VALUES(3, 'Chris Paul', 56, 4);
INSERT INTO player VALUES(15, 'Blake Griffin', 50, 4);
INSERT INTO player VALUES(8, 'Devin Brooker', 32, 5);
INSERT INTO player VALUES(5, 'DeAndre Ayton', 55, 5);

UPDATE player
SET player_name = 'Raymond F. Boyce'
WHERE player_id = 2;

DELETE FROM player 
WHERE player_name ='Demarcus Cousin';


