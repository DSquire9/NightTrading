extends Node
signal event

@export var timeToNextEvent = 0;
var deltaTimer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setTimer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	deltaTimer += delta
	if deltaTimer >= timeToNextEvent:
		event.emit()
		deltaTimer -= timeToNextEvent
		setTimer()

func setTimer() -> void:
	timeToNextEvent = randi() % 11 + 0
