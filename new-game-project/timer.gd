extends Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func pause_or_start() -> void:
	if paused:
		paused = false
	else:
		paused = true
	pass # Replace with function body.


func reset() -> void:
	wait_time = 1
	pass # Replace with function body.
	

func _on_label_countdown_end() -> void:
	stop()
	pass # Replace with function body.
