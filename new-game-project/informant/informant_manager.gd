class_name InformantManager extends Node

signal informant_updated(location, message);

enum InformantLocation {
	COMPUTER,
	WINDOW,
	PLANTS,
	NONE, # must be last for randomizer to work
}

var location: InformantLocation = InformantLocation.NONE;
var message: String = "";

func randomize_location( must_appear: bool ) -> InformantLocation: 
	var max_location_index: int = InformantLocation.size();
	if (must_appear):
		max_location_index -= 1;
	location = InformantLocation.get(randi() % max_location_index);
	return location;

func update_informant( a_location: InformantLocation = location, a_message: String = message ) -> void:
	location = a_location;
	message = a_message;
	informant_updated.emit(location, message);
