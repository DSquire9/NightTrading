class_name SpeechBubbleManager extends Node

@onready var radio: SpeechBubbleSpawner = $Radio;
@onready var television: SpeechBubbleSpawner = $Television;
@onready var informant_computer: SpeechBubbleSpawner = $Informant_Computer;
@onready var informant_window: SpeechBubbleSpawner = $Informant_Window;
@onready var informant_plants: SpeechBubbleSpawner = $Informant_Plants;

enum SpeechBubbler {
	RADIO,
	TELEVISION,
	INFORMANT_COMPUTER,
	INFORMANT_WINDOW,
	INFORMANT_PLANTS,
}

var _speech_bubble_spawners = { }

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_speech_bubble_spawners[SpeechBubbler.RADIO] = radio;
	_speech_bubble_spawners[SpeechBubbler.TELEVISION] = television;
	_speech_bubble_spawners[SpeechBubbler.INFORMANT_COMPUTER] = informant_computer;
	_speech_bubble_spawners[SpeechBubbler.INFORMANT_WINDOW] = informant_window;
	_speech_bubble_spawners[SpeechBubbler.INFORMANT_PLANTS] = informant_plants;

func send_bubble( target: SpeechBubbler, data: SpeechBubbleData ) -> void:
	if _speech_bubble_spawners.has(target):
		var relevant_spawner: SpeechBubbleSpawner = _speech_bubble_spawners[target];
		relevant_spawner.update_bubble(data);

func reset() -> void:
	radio.reset();
	television.reset();
	informant_computer.reset();
	informant_window.reset();
	informant_plants.reset();
