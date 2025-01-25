extends Label

var sec1 = 0
var sec10 = 0
var minutes = 5

signal countdownEnd

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(minutes) + ":" + str(sec10) + str(sec1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(minutes) + ":" + str(sec10) + str(sec1)
	pass


func clock_counting() -> void:
	sec1 -= 1
	
	if sec1 < 0:
		sec1 = 9
		sec10 -= 1
	
	if sec10 < 0:
		sec10 = 5
		minutes -= 1
		
	if minutes == 0:
		countdownEnd.emit()
	pass # Replace with function body.
