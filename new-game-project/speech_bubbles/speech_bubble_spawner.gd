class_name SpeechBubbleSpawner extends Control

@onready var panel_container: PanelContainer = $PanelContainer
@onready var label: Label = $PanelContainer/NinePatchRect/Label

var key: int = 0; # to ensure we don't pop the bubble if it updated before it could pop
var text: String = "":
	set(value):
		label.text = value;
		panel_container.visible = (value != "");
		key += 1;
		text = value;

func _ready() -> void:
	text = "";

func update_bubble(bubble_data: SpeechBubbleData) -> void:
	text = bubble_data.text;
	panel_container.set_z_index(Globals.z_index);
	var key_when_created = key;
	await get_tree().create_timer(bubble_data.duration_in_seconds).timeout;
	pop_bubble(key_when_created);

func pop_bubble(a_key: int) -> void:
	if (key == a_key):
		text = "";
