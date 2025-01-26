class_name UIManager extends Control

@onready var game_start: Control = $GameStart;
@onready var game_over: Control = $GameOver;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_ui(GameManager.State.GAME_START);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


## Public
func update_ui( state: GameManager.State ) -> void:
	_hide_all();
	match state:
		GameManager.State.GAME_START:
			_game_start();
		GameManager.State.GAME_RUNNING:
			_game_running();
		GameManager.State.GAME_OVER:
			_game_over();


## States
func _game_start() -> void:
	print("ui start!!")
	game_start.visible = true;
	pass

func _game_running() -> void:
	print("ui running!!")
	pass

func _game_over() -> void:
	print("ui over!!")
	game_over.visible = true;
	pass


## Utility
func _hide_all() -> void:
	game_start.visible = false;
	game_over.visible = false;
