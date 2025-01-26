extends Control

@onready var balance: Balance = get_node("../PlayerPortfolio");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !balance.is_node_ready():
		await balance.ready;
	$CurrentWealth.text = "Buying Power: $" + str(balance.buying_power)
	$LastTransaction.text = "Last Transaction:\n" + balance.get_last_transaction()
