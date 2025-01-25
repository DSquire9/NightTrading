class_name Television extends Button

var modes = 7
var mode = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_sprite_2d_object_clicked():
	if(mode >= modes):
		mode = 0
	else:
		mode += 1
	print("TV channel: " + str(mode))
	var rootNode = get_parent()
	if(rootNode):
		var type = rootNode.get_node("Stocks").get_children()[mode].name
		var trend = rootNode.getTVTrend(mode)
		print(type + ": " + str(trend))
		var past = rootNode.getPastSeven(mode)
		print(past)
