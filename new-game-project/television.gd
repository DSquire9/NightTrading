extends AnimatedSprite2D

var modes = 3
var mode = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sprite_2d_object_clicked():
	if(mode >= modes):
		mode = 1
	else:
		mode += 1
	print("channel: " + str(mode))
	var rootNode = get_parent()
	if(rootNode):
		var trend = rootNode.getTVTrend(mode)
		print(trend)
		var past = rootNode.getPastSeven(mode)
		print(past)
