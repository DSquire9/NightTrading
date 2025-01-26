extends Control

var price_label = preload("res://price_label.tscn");
var currHeight = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var stocks: Stocks = get_node("../Stocks");
	if !stocks.is_node_ready():
		await stocks.ready;
	print("nstocks: " + str(stocks.n_stocks))
	for i in range(stocks.n_stocks):
		print(i)
		var newLabel = price_label.instantiate()
		newLabel.stock = stocks.get_stock(i)
		newLabel.size.y = 120
		newLabel.size.x = 200
		newLabel.position.y = currHeight
		currHeight += (newLabel.size.y + 20)
		add_child(newLabel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
