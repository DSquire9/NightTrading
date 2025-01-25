extends AnimatedSprite2D

var modes = 3
var mode = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match mode:
		1:
			print("mode 1")
		2:
			print("mode 2")
		3:
			print("mode 3")


func _on_sprite_2d_object_clicked():
	if(mode >= modes):
		mode = 1
	else:
		mode += 1
	var rootNode = get_node("Root")
	if(rootNode):
		rootNode.getTVTrend(mode)
