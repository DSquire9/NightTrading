extends Node

@export var timeBetweenInformantEventsInSeconds = 1.0;
@export var initial_n_stocks = 8.0;

@onready var stocks = $Stocks;
@onready var informant_manager = $InformantManager;

var isInformantEventsOn = false:
	set(value):
		if (value):
			start_informant_event_timer();
		isInformantEventsOn = value;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stocks.n_stocks = initial_n_stocks;
	isInformantEventsOn = true;
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
func on_informant_updated( location: InformantManager.InformantLocation, message: String ):
	redraw_backgrounds();

func redraw_backgrounds():
	var informant_location: InformantManager.InformantLocation = informant_manager.informant_location;
