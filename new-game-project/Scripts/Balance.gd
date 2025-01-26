class_name Balance extends Node

@export var buying_power: float = 1000.0  # Initial buying power
var last_transaction = {"Name": "Hospitality","Type": "Buy", "Amount": 0, "Price": 0.0} 
var invested_money: float = 0.0

var owned_stocks = {}

# Function to handle buying stocks
func buy_stock(stock_name: String, stock_price: float, quantity: int) -> void:
	var total_cost = stock_price * quantity
	if total_cost > buying_power:
		print("Not enough BP! Transaction denied.")
		return
	buying_power -= total_cost
	invested_money += total_cost
	last_transaction["Name"] = stock_name
	last_transaction["Type"] = "Bought"
	last_transaction["Amount"] = quantity
	last_transaction["Price"] = total_cost
	print("Bought stock for $", total_cost, ". New BP: $", buying_power)
	if owned_stocks.has(stock_name):
		owned_stocks[stock_name] += quantity
	else:
		owned_stocks[stock_name] = quantity

# Function to handle selling stocks
func sell_stock(stock_name: String, stock_price: float, quantity: int) -> void:
	if owned_stocks.has(stock_name):
		if owned_stocks[stock_name] < quantity:
			quantity = owned_stocks[stock_name]
		var total_revenue = stock_price * quantity
		owned_stocks[stock_name] -= quantity
		buying_power += total_revenue
		invested_money -= total_revenue
		last_transaction["Name"] = stock_name
		last_transaction["Type"] = "Sold"
		last_transaction["Amount"] = quantity
		last_transaction["Price"] = total_revenue
		print("Sold stock for $", total_revenue, ". New BP: $", buying_power)

# Function to get the last transaction as a formatted string
func get_last_transaction() -> String:
	if last_transaction["Name"] != "":
		return "Type: " + last_transaction["Type"] + " " + last_transaction["Name"]    + "\nAmount: " + str(last_transaction["Amount"]) + "\nTotal Price: " + str(last_transaction["Price"])
	else:
		return ""
