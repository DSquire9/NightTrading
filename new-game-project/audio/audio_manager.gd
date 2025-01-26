class_name AudioManager extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer;

const base_file_path = "res://resources/music/";

const profit_maxing = preload(base_file_path + "Profit Maxing_Music FINAL.wav");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#play_profit_maxing();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func play_nothing() -> void:
	audio_stream_player.set_stream(null);


func play_profit_maxing( duration: float = 300.0 ) -> void:
	audio_stream_player.set_stream(profit_maxing);
	audio_stream_player.volume_db = -25;
	audio_stream_player.play(300.0 - duration);
