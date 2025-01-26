class_name StockTypeSelector extends Control

@onready var texture_rect: TextureRect = $HBoxContainer/TextureRect;
@onready var prev_button: Button = $HBoxContainer/PREV;
@onready var next_button: Button = $HBoxContainer/NEXT;


var index: int = 0:
	set(value):
		var new_index = (value + 8) % 8;
		index = new_index;
		print(index);
		update_icon();

func _ready() -> void:
	prev_button.button_down.connect(prev_icon);
	next_button.button_down.connect(next_icon);
	update_icon();

func update_icon() -> void:
	texture_rect.texture = Globals.get_icon(index);

func next_icon() -> void:
	index += 1;

func prev_icon() -> void:
	index -= 1;
