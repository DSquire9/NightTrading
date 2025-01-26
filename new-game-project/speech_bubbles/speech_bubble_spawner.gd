class_name SpeechBubbleSpawner extends Node2D

var text: String = "":
	set(value):
		# show_bubble(text == "")
		value = text;

var key: int = 0;

func update_bubble(bubble_data: SpeechBubbleData) -> void:
	key += 1;
	#print("BUBBLE MADE: " + bubble_data.text);
	var key_when_created = key;
	await get_tree().create_timer(bubble_data.duration_in_seconds).timeout
	pop_bubble(key_when_created);

func pop_bubble(a_key: int) -> void:
	if (key == a_key):
		# hide bubble
		#print("bubble popped! key = " + str(a_key));
		pass

func show_bubble(is_visible: bool) -> void:
	# visibility = is_visible
	pass
