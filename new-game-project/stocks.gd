class_name Stocks extends Node
var stock_instance = preload("res://stock_instance.tscn");

## Public Variables
var n_stocks: int :
	get:
		return get_children().size();
	set(value):
		_populate_stocks(n_stocks);

## Private Variables
const _stocks = [
	"Tech",
	"Business",
	"Consumer_Goods",
	"Energy_Water",
	"Finance",
	"Healthcare",
	"Hospitality",
	"Manufacturing"
];

var _stocks_registry = {};

## Public Methods
func get_stock(i: int) -> StockInstance:
	if (n_stocks == 0 || i < 0 || i >= n_stocks):
		print("TRYING TO ACCESS INVALID STOCK");
		return _stocks_registry[0];
	return _stocks_registry[i];

## Private
func _populate_stocks( a_n_stocks: int ) -> void:
	if (a_n_stocks > _stocks.size()):
		a_n_stocks = _stocks.size();
	elif (a_n_stocks < 0):
		a_n_stocks = 0;
	_clear_stocks();
	for i in a_n_stocks:
		var new_stock_instance = stock_instance.instantiate();
		new_stock_instance.stock_name = _stocks[i];
		_stocks_registry[i] = new_stock_instance;
		add_child(new_stock_instance);

func _clear_stocks() -> void:
	_stocks_registry.clear();
	var children = get_children();
	for child in children:
		remove_child(child);
		child.queue_free();
