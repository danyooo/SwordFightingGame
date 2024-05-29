# SwordFightingGame(Temporary Title)

## <ins>**Collaborators:**</ins>
Download [godot engine](https://godotengine.org/download/windows/)  
For design use [penpot](https://penpot.app/design/layout)  (ask for invite to team)




## <ins>Proposal</ins>
This is a physics-based sword fighting game in which two players are prompted to fight against one another with swords. The sword size is determined by the players typing a valid word beforehand that contains certain letters. The larger word that is typed out, the larger, heavier, and stronger the sword. The games will be played in a fast paced manner, up to x amount of wins, and each win the previously used words are no longer valid. (could add some “rules” as the game goes on to make it harder, such as “use words longer than x length with the letter y”)



## <ins>Features</ins>
* Sword size comes with a couple traits, mainly being the physics aspect of it. Larger swords are heavier, with more damage, and more knockback/durability. Smaller swords are the opposite
* Durability will increase with the size of the sword
* Dash distance / cooldown will depend on the size of the sword(Heavier is shorter distance / longer cooldown)
* Heavier swords will require more ‘effort’ to swing. Rather than being an instantaneous response to the mouse/joystick it will lag a bit behind.
* two players get a prompt to type a word (with x letter[s] in it?), 
* For example “type a word with the letter ‘t’ “
* the longer the word that is typed the larger the sword the player gets. 
* When the game is over, players are immediately prompted to write another word within a short time limit to keep the challenge up. The words that have been already used will be stored and will no longer count as valid.
* Players get a short-range dash
* Dash distance / cooldown will depend on the size of the sword(Heavier is shorter distance / longer cooldown)
* Round timer
* Player names  --- Store as a win counter
* Keyboard/mouse controls for one player (Gamepad for other? Not sure how this would implement)
* Dynamic camera that stays in the middle between the two players ( and zooms out the farther they get from each other)
* Arena with collisions
* Upon sitting in a corner of the arena for 3 seconds, arena starts flashing red,indicating a warning that would harm the player for standing there too long
* Corners are advantageous as swords can hit the sides of the wall and thus a player can hide in the corner to avoid being hit and cancel the swinging momentum their opponent builds up (unless their opponent thrusts the tip of the sword toward the opponent)
* Players have a health stat, the damage applied by swords depends on the size, power behind the swing that is applied


## <ins>Motivation</ins>
To create a uniquely fun and challenging game that drives the user(s) to learn more words. ( and that teaches them larger words aren’t always better, fancier isn’t always as practical) 
Properly make a typing game(Last one wasn’t finished/done)
Incorporation of learned subjects in class
Use knowledge from typing game assignment
APIS - Request information of valid dictionary words
Use knowledge from lesson on Object Oriented Programming by creating classes to organize and create objects easier, such as multiple players / swords
Persistent storage -- Store valid dictionary words so the API doesn’t need to be called every time the game starts (Call API every once in a while OR call on first bootup only)

## <ins>Milestones</ins>
* Read player inputs ( 1 day) -- Learn how to read player inputs in godot’s language(GDSCRIPT)
* Use player inputs to move the character(1 day)
* Swords have hitboxes and can hit each other(~2 days)
* Typing correctly sets sword length(1 day)
* Swords have physics(mass, weight, a ‘force’ behind it.) [~3 days]
* Swords upon hitting each other react accordingly (Lose durability, apply knockback to opponent depending on mass) (~1-2 days)
* Words previously typed cannot be typed again(1 day)
* Timer that counts down, and upon reaching zero, ends the round( 1 day)
* Point system ( 1 day)
* Request valid words from dictionary API(~1 day)
* Read and write valid words from API to storage (~1-2 days)




