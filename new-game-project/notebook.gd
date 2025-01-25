extends AnimatedSprite2D

var currentStock = 1

func _process(delta):
	get_node("notepad/stock").text = str(currentStock)

func _on_sprite_2d_object_clicked():
	get_node("notepad").visible = true


func _on_button_pressed():
	get_node("notepad").visible = false


func _on_sell_button_pressed():
	pass # Replace with function body.


func _on_buy_button_pressed():
	pass # Replace with function body.


func _on_tab_1_pressed():
	currentStock = 1


func _on_tab_2_pressed():
	currentStock = 2


func _on_tab_3_pressed():
	currentStock = 3


func _on_tab_4_pressed():
	currentStock = 4


func _on_tab_5_pressed():
	currentStock = 5


func _on_tab_6_pressed():
	currentStock = 6


func _on_tab_7_pressed():
	currentStock = 7
