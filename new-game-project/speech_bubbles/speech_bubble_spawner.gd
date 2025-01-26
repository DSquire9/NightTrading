class_name SpeechBubbleSpawner extends Control

@export var identity: SpeechBubbleManager.SpeechBubbler;

@onready var panel_container: PanelContainer = $PanelContainer;
@onready var nine_patch_rect: NinePatchRect = $PanelContainer/NinePatchRect;
@onready var label: Label = $PanelContainer/NinePatchRect/Label;

var key: int = 0; # to ensure we don't pop the bubble if it updated before it could pop
var text: String = "":
	set(value):
		label.text = value;
		panel_container.visible = (value != "");
		key += 1;
		text = value;

func _ready() -> void:
	_update_style();
	text = "";
	panel_container.mouse_entered.connect(_on_mouse_entered);

func update_bubble(bubble_data: SpeechBubbleData) -> void:
	text = bubble_data.text;
	_update_z_index();
	var key_when_created = key;
	await get_tree().create_timer(bubble_data.duration_in_seconds).timeout;
	pop_bubble(key_when_created);

func pop_bubble(a_key: int) -> void:
	if (key == a_key):
		text = "";


func _on_mouse_entered() -> void:
	_update_z_index();


func _update_z_index() -> void:
	panel_container.set_z_index(Globals.z_index);


func _update_style() -> void:
	match identity:
		SpeechBubbleManager.SpeechBubbler.RADIO, SpeechBubbleManager.SpeechBubbler.TELEVISION:
			nine_patch_rect.texture = load("res://resources/images/speech_bubbles/Bubble_White.png");
			label.set("theme_override_colors/font_color", "000000");
		SpeechBubbleManager.SpeechBubbler.INFORMANT_COMPUTER, SpeechBubbleManager.SpeechBubbler.INFORMANT_WINDOW, SpeechBubbleManager.SpeechBubbler.INFORMANT_PLANTS:
			nine_patch_rect.texture = load("res://resources/images/speech_bubbles/Bubble_DarkGrey.png");
			label.set("theme_override_colors/font_color", "FFFFFF");
		_:
			pass
