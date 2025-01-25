extends AnimatedSprite2D

func _on_sprite_2d_object_clicked():
	get_node("notepad").visible = true


func _on_button_pressed():
	get_node("notepad").visible = false


func _on_sell_button_pressed():
	pass # Replace with function body.


func _on_buy_button_pressed():
	pass # Replace with function body.
