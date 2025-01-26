class_name Notebook extends Button

var currentStock = 1
var sellbuy = true
var Root: GameManager
var quantity = 1
var price = 156789.89

func _ready():
	Root = get_parent()

func _process(delta):
	get_node("notepad/stock").text = "Stock " + str(currentStock)
	get_node("notepad/quantity").text = str(quantity)
	get_node("notepad/price").text = "$" + str(price)

func _on_sprite_2d_object_clicked():
	Root.notebook_manager.update_notebook(NotebookManager.NotebookLocation.FOCUS_OPEN);
	#get_node("notepad").visible = true


func _on_button_pressed():
	Root.notebook_manager.update_notebook(NotebookManager.NotebookLocation.DESK);
	#get_node("notepad").visible = false


func _on_sell_button_pressed():
	sellbuy = true


func _on_buy_button_pressed():
	sellbuy = false


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


func _on_confirm_pressed():
	#var stockManager = get_node("Stock manager")
	var stockManager = true
	if(stockManager):
		if(sellbuy):
			#stockManager.sell_stock()
			print("sold  " + str(quantity) + " of stock " + str(currentStock) + " at $" + str(price))
		else:
			#stockManager.buy_stock()
			print("bought " + str(quantity) + " of stock " + str(currentStock) + " at $" + str(price))
		get_node("notepad").visible = false


func _on_add_pressed():
	quantity += 1


func _on_subtract_pressed():
	if(quantity > 1):
		quantity -= 1
