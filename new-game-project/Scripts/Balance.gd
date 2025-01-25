extends Node

@export var buying_power: float = 1000.0  # Initial buying power
var last_transaction: float = 0.0 
var invested_money: float = 0.0

# Function to handle buying stocks
func buy_stock(stock_name: String, stock_price: float, quantity: int) -> void:
	var total_cost = stock_price * quantity
	if total_cost > buying_power:
		print("Not enough BP! Transaction denied.")
		return
	buying_power -= total_cost
	invested_money += total_cost
	last_transaction = total_cost
	print("Bought stock for $", total_cost, ". New BP: $", buying_power)

# Function to handle selling stocks
func sell_stock(stock_name: String, stock_price: float, quantity: int) -> void:
	var total_revenue = stock_price * quantity
	buying_power += total_revenue
	invested_money -= total_revenue
	last_transaction = total_revenue
	print("Sold stock for $", total_revenue, ". New BP: $", buying_power)

# Function to get the last transaction as a formatted string
func get_last_transaction() -> String:
	return str(last_transaction) if last_transaction >= 0 else str(last_transaction)
