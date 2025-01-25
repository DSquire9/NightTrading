extends AnimatedSprite2D
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

func _on_sprite_2d_object_clicked():
	print("Informant: " + type + " " + str(pos))
		
func trigger(stockName, positive):
	show()
	type = stockName
	pos = positive
	
