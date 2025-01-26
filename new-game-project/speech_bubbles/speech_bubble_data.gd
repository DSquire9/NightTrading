class_name SpeechBubbleData

var text: String = "";
var duration_in_seconds: float = -1;

func _init(a_text: String, a_duration_in_seconds: float) -> void:
	text = a_text;
	duration_in_seconds = a_duration_in_seconds;
