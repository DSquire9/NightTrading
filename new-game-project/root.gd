class_name GameManager extends Node

@export var timeBetweenInformantEventsInSeconds: float = 2.0;
@export var initial_n_stocks: int = 8;

@onready var game_timer: GameTimer = $GameTimer;

@onready var stocks: Stocks = $Stocks;
@onready var notebook_manager: NotebookManager = $NotebookManager;
@onready var informant_manager: InformantManager = $InformantManager;
@onready var speech_bubble_manager: SpeechBubbleManager = $SpeechBubbleManager;
@onready var background_manager: BackgroundManager = $BackgroundManager;

var isInformantEventsOn = false:
	set(value):
		if (value):
			start_informant_event_timer();
		isInformantEventsOn = value;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stocks.n_stocks = initial_n_stocks;
	isInformantEventsOn = true;
	notebook_manager.notebook_updated.connect(on_notebook_updated);
	informant_manager.informant_updated.connect(on_informant_updated);
	
	game_timer.timer_started.connect(on_timer_started);
	game_timer.timer_paused.connect(on_timer_paused);
	game_timer.timer_last_minute.connect(on_timer_last_minute);
	game_timer.timer_ended.connect(on_timer_ended);
	
	# this will eventually be done by "start game" button
	game_timer.start();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

## Informant Events
func start_informant_event_timer() -> void:
	await get_tree().create_timer(timeBetweenInformantEventsInSeconds).timeout
	if (isInformantEventsOn):
		trigger_informant_event()
		start_informant_event_timer()

func trigger_informant_event() -> void:
	## for testing the background / notebook updater
	#notebook_manager.update_notebook(NotebookManager.NotebookLocation.FOCUS_OPEN);
	#informant_manager.update_informant(InformantManager.InformantLocation.WINDOW);
	#redraw_backgrounds();

	var n_stocks = stocks.n_stocks;
	var n_blanks = 1; # n_blanks / (n_stocks + n_blanks) = probability that nothing happens
	var eventType = randi() % (n_stocks+n_blanks)
	if eventType >= n_stocks:
		print("No Event")
	else:
		var positive: bool = (randi() % 2 == 0)
		var stock: StockInstance = stocks.get_stock(eventType);
		if positive:
			print("Positive " + stock.stock_name + " informant event")
		else:
			print("Negative " + stock.stock_name + " informant event")
		$Informant.trigger(stock.stock_name, positive)
		stocks.get_stock(eventType).eventTrigger(positive)
	
	## for testing the speech bubbles
	#speech_bubble_manager.send_bubble(SpeechBubbleManager.SpeechBubbler.INFORMANT_COMPUTER, SpeechBubbleData.new("TESTTTT TESTTTT TESTTTT TESTTTT TESTTTT TESTTTT TESTTTT TESTTTT", 15.0));
	#speech_bubble_manager.send_bubble(SpeechBubbleManager.SpeechBubbler.INFORMANT_WINDOW, SpeechBubbleData.new("TESTTTT22222", 15.0));
	#speech_bubble_manager.send_bubble(SpeechBubbleManager.SpeechBubbler.TELEVISION, SpeechBubbleData.new("TESTTTT2", 10000.0));
	#await get_tree().create_timer(1.5).timeout
	#speech_bubble_manager.send_bubble(SpeechBubbleManager.SpeechBubbler.RADIO, SpeechBubbleData.new("TESTTTT3", 10000.0));

func getTVTrend(channel) -> bool:
	var stock = stocks.get_stock(channel)
	return true if stock.pastPrice < stock.currPrice else false

func getPastSeven(channel) -> Array:
	return stocks.get_stock(channel).pastSeven

func getRadioPrediction(channel) -> bool:
	return stocks.get_stock(channel).getPrediction()


## For Redrawing Scene
func on_notebook_updated( _location: NotebookManager.NotebookLocation, _tab: int ):
	redraw_backgrounds();

func on_informant_updated( _location: InformantManager.InformantLocation, _message: String ):
	redraw_backgrounds();

func redraw_backgrounds():
	var notebook_location: NotebookManager.NotebookLocation = notebook_manager.location;
	var informant_location: InformantManager.InformantLocation = informant_manager.location;
	var background_data: BackgroundData = BackgroundData.new(notebook_location, informant_location);
	background_manager.update_background(background_data);


## Timer Effects
func on_timer_started():
	#print("START");
	# let's go!!!
	# audio general minutes
	pass

func on_timer_paused():
	#print("PAUSE");
	# music stops
	pass

func on_timer_last_minute():
	#print("LAST MIN");
	# audio last minute
	pass

func on_timer_ended():
	end_game();


## Game Loop Evenets
func start_game() -> void:
	notebook_manager.reset();
	informant_manager.reset();
	speech_bubble_manager.reset();
	game_timer.start();

func pause_game() -> void:
	game_timer.pause();

func unpaused_game() -> void:
	game_timer.unpause();

func end_game():
	# show end screen
	print("game over!")
	pass
