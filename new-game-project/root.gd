extends Node
var stocks = []
@export var timeToNextEvent = 0;
var deltaTimer = 0.0
var delayTimer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stocks = $Stocks.get_children()
	setTimer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
	deltaTimer += delta
	if deltaTimer >= timeToNextEvent:
		delayTimer += delta
		if delayTimer >= 10.0:
			informant_event()
			deltaTimer = 0
			delayTimer = 0
			setTimer()


func informant_event() -> void:
	var eventType = randi() % 9
	if eventType == 8:
		print("No Event")
	else:
		var positive = true if randi() % 2 == 0 else false
		var stockName = stocks[eventType].name
		if positive:
			print("Positive " + stockName + " event")
		else:
			print("Negative " + stockName + " event")
		#$UI.InformantTrigger(stockName, positive)
		stocks[eventType].eventTrigger(positive)
		
func setTimer() -> void:
	timeToNextEvent = randi() % 11 + 0
		
func getTVTrend(channel) -> bool:
	var stock = stocks[channel]
	return true if stock.pastPrice < stock.currPrice else false
	
func getRadioPrediction(channel) -> bool:
	return stocks[channel].getPrediction()
