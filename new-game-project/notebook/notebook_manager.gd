class_name NotebookManager extends Node

@export var notebook_cooldown: float = 3.0;

const base_file_path = "res://resources/images/notebook/";

signal notebook_updated(location, tab);

enum NotebookLocation {
	DESK,
	FOCUS_CLOSED,
	FOCUS_OPEN,
}

var location: NotebookLocation = NotebookLocation.DESK;
var tab: int = -1;
var _is_locked: bool = false;

const notebook_up_closed: Texture = preload(base_file_path + "Notebook_UpClosed.png");
const notebook_up_open: Texture = preload(base_file_path + "Notebook_UpOpen.png");

@onready var notebook: TextureRect = $TextureRect;
@onready var notebook_ui: Control = $NotebookUI;
@onready var buy_sell_toggle: BuySellToggle = $NotebookUI/BuySellToggle;
@onready var stock_type_selector: StockTypeSelector = $NotebookUI/StockTypeSelector
@onready var confirm_transaction_button: ConfirmTransactionButton = $NotebookUI/ConfirmTransactionButton;

func _ready() -> void:
	confirm_transaction_button.button.button_down.connect(confirm_transaction);

func update_notebook( a_location: NotebookLocation = location, a_tab: int = tab ) -> void:
	if (_is_locked):
		return
	
	location = a_location;
	tab = a_tab;
	notebook_updated.emit(location, tab);
	notebook_ui.visible = false;
	match location:
		NotebookLocation.FOCUS_CLOSED:
			notebook.texture = notebook_up_closed;
		NotebookLocation.FOCUS_OPEN:
			notebook.texture = notebook_up_open;
			notebook_ui.visible = true;
		_:
			notebook.texture = null;

func reset() -> void:
	update_notebook(NotebookLocation.DESK, -1);
	_is_locked = false;


func confirm_transaction() -> void:
	# do start of transaction things (e.g., sfx)
	_is_locked = true;
	#await get_tree().create_timer(notebook_cooldown).timeout;
	var is_buy: bool = (buy_sell_toggle.mode == BuySellToggle.Mode.BUY);
	if is_buy:
		print("BUYING SO MUCH STOCK");
	else:
		print("SELLING SO MUCH STOCK");
	# actually do the transaction
	# any sfx too
	_is_locked = false;
