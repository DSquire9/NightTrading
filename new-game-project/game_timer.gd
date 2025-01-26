class_name GameTimer extends Node

signal timer_started();
signal timer_paused(is_paused);
signal timer_last_minute();
signal timer_ended();

@export var start_time: float = 5.0 * 60.0;

@onready var _label: Label = $Label;

var _is_running: bool = false;
var _is_last_minute: bool = false;
var _time_on_timer: float = 0.0: # in seconds
	set(value):
		if (value < 0.0):
			_time_on_timer = 0.0;
		else:
			_time_on_timer = value;
		_label.text = _get_time_as_string();
		if (!_is_last_minute && _time_on_timer <= 60.0):
			timer_last_minute.emit();
			_is_last_minute = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset();
	start();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!_is_running):
		return
	if (_time_on_timer <= 0.0):
		end();
	else:
		_time_on_timer -= delta;


func start(duration: float = start_time) -> void: #aim for multiples of 60 b.c. music track = 1 min
	start_time = duration;
	_time_on_timer = start_time;
	_is_running = true;
	timer_started.emit();

func end() -> void:
	_is_running = false;
	timer_ended.emit();

func reset() -> void:
	_is_running = false;
	_is_last_minute = false;
	_time_on_timer = start_time;

func pause() -> void:
	timer_paused.emit(true);
	_is_running = false;

func unpause() -> void:
	timer_paused.emit(false);
	_is_running = true;

func _get_time_as_string() -> String:
	var current_time: float = _time_on_timer;
	# minutes
	var n_min: int = int(_s_to_min(current_time));
	current_time -= _min_to_s(float(n_min));
	# seconds
	var n_sec: int = int(current_time);
	current_time -= float(n_sec);
	# milliseconds
	var n_ms: int = int(current_time * 1000.0);
	current_time -= float(n_ms) / 1000.0;
	
	# minutes
	var out: String = "";
	if (n_min < 10):
		out += "0" + str(n_min).left(1);
	else:
		out += str(n_min).left(2);
	out += ":";
	# seconds
	if (n_sec < 10):
		out += "0" + str(n_sec).left(1);
	else:
		out += str(n_sec).left(2);
	out += ":";
	# milliseconds
	if (n_ms < 10):
		out += "00" + str(n_ms).left(1);
	elif (n_ms < 100):
		out += "0" + str(n_ms).left(2);
	else:
		out += str(n_ms).left(3);
	
	return out;

func _min_to_s(min: float) -> float:
	return min * 60.0;

func _s_to_min(s: float) -> float:
	return s / 60.0;
