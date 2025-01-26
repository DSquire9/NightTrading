class_name StockInstance extends Node
signal stockPop

@export var currPrice = 1
@export var pastPrice = 1
@export var rateChangeIn = 0
@export var pastSeven = [0,0,0,0,0,0,0]
const UPDATE_TIME = 2
var bubbleMin = 0
var bubbleMax = 0
var rate = 0
var maxRate = 30
var minRate = 0
var deltCountPriceChange = 0.0
var deltCountRateChange = 0.0
var popped = false
var popGoal = 0

var stock_name = "";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setRate()
	_setRateChange()
	_setBubble()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	deltCountPriceChange += delta
	if deltCountPriceChange >= UPDATE_TIME:
		deltCountPriceChange -= UPDATE_TIME
		_update()
		
	if !popped:
		deltCountRateChange += delta
		if deltCountRateChange >= rateChangeIn:
			deltCountRateChange -= rateChangeIn
			_setRate()
			_setRateChange()

func _update() -> void:
	pastSeven.pop_front()
	pastSeven.push_back(currPrice)
	pastPrice = currPrice
	currPrice += rate
	# Floor the price at zero
	if currPrice < 1:
		currPrice = 1
		
	# Check to see if we've reached the pop goal to stabilize the stock
	if popped:
		if currPrice <= popGoal:
			popped = false
			_setRate()
			_setRateChange()
			
	# pop if we hit the chance
	if currPrice >= bubbleMax or randf() <= float(currPrice - bubbleMin) / float(bubbleMax - bubbleMin):
		_pop() 
	#print(pastSeven)
	
func _setRate() -> void:
	var wasNeg = true if rate < 0 else true
	rate = randi() % (maxRate + 1) + minRate
	if !wasNeg and randi() % 2 == 0:
		rate *= -1


func _setRateChange() -> void:
	rateChangeIn = randi() % 31 + 10
	
func _setBubble():
	bubbleMax = (randi() % 300) + 700
	bubbleMin = bubbleMax - (bubbleMax / 5)

func _pop() -> void:
	popped = true
	popGoal = currPrice / 10
	rate = abs(rate) * -3
	stockPop.emit()
	_setBubble()
	print(stock_name + " pop!")

func eventTrigger(positive) -> void:
	if positive:
		rate = abs(rate) * 2
	else:
		rate = abs(rate) * -2
	
func getPrediction() -> bool:
	if bubbleMin <= currPrice:
		return false
	if deltCountRateChange >= rateChangeIn/2 and rate < 0:
		return true
	if  deltCountRateChange <= rateChangeIn/2:
		return true if rate > 0 else false
	return true
		
