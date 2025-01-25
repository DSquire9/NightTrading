extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()


func _on_info_emitter_event() -> void:
	var stocksArr = $Stocks.get_children()
	var eventType = randi() % 9
	if eventType == 8:
		print("No Event")
	else:
		var stockName = stocksArr[eventType].name
		print(stockName + " event")
