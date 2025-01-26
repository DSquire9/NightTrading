class_name GameManager extends Node

@export var timeBetweenInformantEventsInSeconds = 1.0;
@export var initial_n_stocks = 8.0;

@onready var stocks = $Stocks;
@onready var notebook_manager = $NotebookManager;
@onready var informant_manager = $InformantManager;
@onready var background_manager = $BackgroundManager;

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
	notebook_manager.update_notebook(NotebookManager.NotebookLocation.FOCUS_CLOSED);
	informant_manager.update_informant(InformantManager.InformantLocation.COMPUTER);
	redraw_backgrounds();
	
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
