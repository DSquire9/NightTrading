extends Camera2D

var screens = [0, 2000]
var currentScreen = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_released("move camera left")):
		currentScreen = currentScreen - 1
		if(currentScreen < 0):
			currentScreen = screens.size() - 1
	if(Input.is_action_just_released("move camera right")):
		currentScreen = currentScreen + 1
		if(currentScreen >= screens.size()):
			currentScreen = 0
	offset.x = screens[currentScreen]
