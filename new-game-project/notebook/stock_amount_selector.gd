class_name StockAmountSelector extends Control

@onready var increase_button: Button = $VBoxContainer/INCREASE;
@onready var decrease_button: Button = $VBoxContainer/DECREASE;

@onready var stock_number_label: Label = $stock_number;

var n_zeroes: int = 0:
	set(value):
		n_zeroes = max(min(value,9), 0);
		stock_number_label.text = get_string();
		# redraw number

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	increase_button.button_down.connect(increase_zeroes);
	decrease_button.button_down.connect(decrease_zeroes);
	n_zeroes = 0;


func increase_zeroes() -> void:
	n_zeroes += 1;


func decrease_zeroes() -> void:
	n_zeroes -= 1;

func get_string() -> String:
	return str(get_amount());

func get_amount() -> int:
	var out = 10 ** n_zeroes;
	return out;
