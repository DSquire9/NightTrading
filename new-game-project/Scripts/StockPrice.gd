extends Node

@export var currPrice = 0
@export var rateChangeIn = 0
var rate = 0
var maxRate = 50
var minRate = 0
var deltCountPriceChange = 0.0
var deltCountRateChange = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setRate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	deltCountPriceChange += delta
	deltCountRateChange += delta
	if deltCountPriceChange >= 1:
		deltCountPriceChange -= 1
		update()
	if deltCountRateChange >= rateChangeIn:
		deltCountRateChange -= rateChangeIn
		setRate()
		setRateChange()

func update() -> void:
	currPrice += rate
	print(currPrice)
	
func setRate() -> void:
	rate = randi() % (maxRate + 1) + minRate
	if randi() % 2 == 0:
		rate *= -1


func setRateChange() -> void:
	rateChangeIn = randi() % 31 + 10
