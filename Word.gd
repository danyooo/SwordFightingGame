extends Node
#Variables for handling API calls. Look up how to call APIS on godot for this as it may need a variable for 
	# APImanager / client, etc
#Variable for "player1word, player2word"
# Function that takes the last player-typed word  and stores it into a variable.
# Take that word-variable and call a Dictionary API to to lookup that word and determine if it's a real valid word or not.
# After the word is determined as valid, pass it back to the player / sword node to change the size
# Once this is done, mark the word as invalid.
