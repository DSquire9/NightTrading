class_name Informant extends Button
var type = ""
var pos = false
var deltHide = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		deltHide += delta
		if deltHide >= 10.0:
			hide()
			deltHide = 0.0
		
func trigger(stockName, positive):
	show()
	type = stockName
	pos = positive
	

func _on_button_up() -> void:
	print("Informant: " + type + " " + str(pos))
