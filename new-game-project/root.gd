extends Node

@export var timeBetweenInformantEventsInSeconds = 1.0;

var stocks = []

var isInformantEventsOn = false:
	set(value):
		if (value):
			start_informant_event_timer();
		isInformantEventsOn = value;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stocks = $Stocks.get_children()
	isInformantEventsOn = true;

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
	var n_stocks = stocks.size();
	var n_blanks = 1; # n_blanks / (n_stocks + n_blanks) = probability that nothing happens
	var eventType = randi() % (n_stocks+n_blanks)
	if eventType >= n_stocks:
		print("No Event")
	else:
		var positive: bool = (randi() % 2 == 0)
		var stockName = stocks[eventType].name
		if positive:
			print("Positive " + stockName + " informant event")
		else:
			print("Negative " + stockName + " informant event")
		$Informant.trigger(stockName, positive)
		stocks[eventType].eventTrigger(positive)

func getTVTrend(channel) -> bool:
	var stock = stocks[channel]
	return true if stock.pastPrice < stock.currPrice else false

func getPastSeven(channel) -> Array:
	return stocks[channel].pastSeven

func getRadioPrediction(channel) -> bool:
	return stocks[channel].getPrediction()
