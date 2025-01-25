extends Node

@export var currPrice = 0
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
	currPrice += rate
	if currPrice < 0:
		currPrice = 0
	print(currPrice)
	
func setRate() -> void:
	rate = randi() % (maxRate + 1) + minRate
	if randi() % 2 == 0:
		rate *= -1


func setRateChange() -> void:
	rateChangeIn = randi() % 31 + 10
	
func setBubble():
	pass

func pop():
	popped = true
	popGoal = currPrice / 10
	rate = abs(rate) * -3
