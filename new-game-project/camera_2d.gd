extends Camera2D

var screens = [0, 1500]
var currentScreen = 0
var t = 0.0
var start = Vector2(0,0)
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(t < 1.0 && moving):
		t += delta * 0.4
	
	if(Input.is_action_just_released("move camera left") && !(currentScreen < 1)):
		currentScreen = currentScreen - 1
		t = 0.0
		start = position
		moving = true
	if(Input.is_action_just_released("move camera right") && !(currentScreen >= screens.size() - 1)):
		currentScreen = currentScreen + 1
		t = 0.0
		start = position
		moving = true
	
	position = start.lerp(Vector2(screens[currentScreen],0), t)
	if(t >= 1.0):
		t = 0.0
		start = position
		moving = false
