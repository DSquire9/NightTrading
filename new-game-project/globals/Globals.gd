extends Node

enum StockType {
	
}

static var z_index : int = 0:
	get:
		z_index += 1;
		return z_index;

const base_icon_path = "res://resources/images/icons/";

const icon_decrease_arrow = preload(base_icon_path + "decrease-arrow.png");
const icon_increase_arrow = preload(base_icon_path + "increase-arrow.png");
const icon_stable = preload(base_icon_path + "stable-icon.png");

const icon_food = preload(base_icon_path + "food-icon.png");
const icon_health = preload(base_icon_path + "health-icon.png");
const icon_manufacturing = preload(base_icon_path + "manufacturing-icon.png");
const icon_metals = preload(base_icon_path + "metals-icon.png");
const icon_oil = preload(base_icon_path + "oil-icon.png");
const icon_technology = preload(base_icon_path + "technology-icon.png");

# this needs to be meshed with the copy in Stocks, i.e., this should be used by that.
const _stocks = [
	"Tech",
	"Business",
	"Consumer_Goods",
	"Energy_Water",
	"Finance",
	"Healthcare",
	"Hospitality",
	"Manufacturing"
];

func get_icon(index: int) -> Texture2D:
	var name: String = _stocks[index];
	match name:
		"Tech":
			return icon_technology;
		"Finance":
			return icon_metals;
		"Healthcare":
			return icon_health;
		"Manufacturing":
			return icon_manufacturing;
		"Energy_Water":
			return icon_oil;
		"Consumer_Goods":
			return icon_food;
		"Hospitality", "Business":
			return null;
	return null;
