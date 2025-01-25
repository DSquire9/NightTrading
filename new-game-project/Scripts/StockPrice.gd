extends Node
signal stockPop

@export var currPrice = 0
@export var pastPrice = 0
@export var rateChangeIn = 0
var bubbleMin = 500
var bubbleMax = 750
var rate = 0
var maxRate = 50
var minRate = 0
var deltCountPriceChange = 0.0
var deltCountRateChange = 0.0
var popped = false
var popGoal = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setRate()
	setRateChange()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	deltCountPriceChange += delta
	if deltCountPriceChange >= 1:
		deltCountPriceChange -= 1
		update()
		
	if !popped:
		deltCountRateChange += delta
		if deltCountRateChange >= rateChangeIn:
			deltCountRateChange -= rateChangeIn
			setRate()
			setRateChange()

func update() -> void:
	pastPrice = currPrice
	currPrice += rate
	# Floor the price at zero
	if currPrice < 1:
		currPrice = 1
		
	# Check to see if we've reached the pop goal to stabilize the stock
	if popped:
		if currPrice <= popGoal:
			popped = false
			setRate()
			setRateChange()
			
	# pop if we hit the chance
	if currPrice >= bubbleMax or randf() <= float(currPrice - bubbleMin) / float(bubbleMax - bubbleMin):
		pop() 
	print(currPrice)
	
func setRate() -> void:
	var wasNeg = true if rate < 0 else true
	rate = randi() % (maxRate + 1) + minRate
	if !wasNeg and randi() % 2 == 0:
		rate *= -1


func setRateChange() -> void:
	rateChangeIn = randi() % 31 + 10
	
func setBubble():
	pass

func pop():
	popped = true
	popGoal = currPrice / 10
	rate = abs(rate) * -3
	stockPop.emit()
	print("pop!")

func eventTrigger(positive):
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
		
