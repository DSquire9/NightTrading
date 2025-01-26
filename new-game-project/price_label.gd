class_name PriceLabel extends RichTextLabel

@export var stock: StockInstance = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stock:
		text = stock.stock_name + ": " + str(stock.pastSeven) + "\nBubble: " + str(stock.bubbleMin) + " - " + str(stock.bubbleMax)
