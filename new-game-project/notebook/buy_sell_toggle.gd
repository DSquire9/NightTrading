class_name BuySellToggle extends HBoxContainer

enum Mode {
	BUY,
	SELL,
}
var mode = Mode.BUY:
	set(value):
		buy_button.disabled = (value == Mode.BUY);
		sell_button.disabled = (value == Mode.SELL);
		mode = value;

@onready var buy_button: Button = $BUY;
@onready var sell_button: Button = $SELL;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buy_button.button_down.connect(select_buy);
	sell_button.button_down.connect(select_sell);
	mode = Mode.BUY;

func select_buy() -> void:
	mode = Mode.BUY;

func select_sell() -> void:
	mode = Mode.SELL;
