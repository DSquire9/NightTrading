extends Node2D

var paused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	get_node("Camera2D/MainTitle").visible = false
	get_node("Camera2D/Game").visible = true
	paused = false


func _on_end_button_pressed():
	get_node("Camera2D/EndScreen").visible = false
	get_node("Camera2D/MainTitle").visible = true


func _on_game_button_pressed():
	get_node("Camera2D/Game").visible = false
	get_node("Camera2D/Pause").visible = true 
	paused = true


func _on_pause_button_pressed():
	get_node("Camera2D/Pause").visible = false
	get_node("Camera2D/EndScreen").visible = true
	paused = false


func _on_pause_button_2_pressed():
	get_node("Camera2D/Pause").visible = false
	get_node("Camera2D/Game").visible = true
