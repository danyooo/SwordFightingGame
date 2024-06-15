extends Camera2D
#grab player scripts
@export var Player1: CharacterBody2D
@export var GamePadPlayer: CharacterBody2D
# when scene is created
func _ready():
	# Grab the player nodes
	var Player1 = get_node("Player1")
	var GamePadPlayer = get_node("GamePadPlayer")
var maxzoom = 1
var minzoom = 0.2
func _physics_process(delta):
	# align camera in between two players
	position = (Player1.position + GamePadPlayer.position) * 0.5
	# zooming
	zoom.x = clamp( 1 / Player1.position.distance_to(GamePadPlayer.position) * 1000,minzoom, maxzoom) 
	zoom.y = zoom.x
	#print("zoom ", zoom.x)

	var zoomval = Vector2(zoom.x,zoom.y)
	#print("zoomval ", zoomval)
	zoom = (zoomval)







