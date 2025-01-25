extends Node2D

var paused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_node("MainTitle").visible = false
	get_node("Game").visible = true
	paused = false


func _on_end_button_pressed():
	get_node("EndScreen").visible = false
	get_node("MainTitle").visible = true


func _on_game_button_pressed():
	get_node("Game").visible = false
	get_node("Pause").visible = true 
	paused = true


func _on_pause_button_pressed():
	get_node("Pause").visible = false
	get_node("EndScreen").visible = true
	paused = false


func _on_pause_button_2_pressed():
	get_node("Pause").visible = false
	get_node("Game").visible = true
