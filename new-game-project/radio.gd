extends Button

var modes = 7
var mode = 0
var prediction = true
var type = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_sprite_2d_object_clicked():
	if(mode >= modes):
		mode = 0
	else:
		mode += 1
	print("Radio channel: " + str(mode))
	var rootNode = get_parent()
	if(rootNode):
		prediction = rootNode.getRadioPrediction(mode)
		type = rootNode.get_node("Stocks").get_children()[mode].name
		if prediction:
			print(type + " positive")
		else:
			print(type + " negative")
