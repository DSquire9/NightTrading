class_name InformantManager extends Node

signal informant_updated(location, message);

enum InformantLocation {
	COMPUTER,
	WINDOW,
	PLANTS,
	NONE, # must be last for randomizer to work
}

var current_location: InformantLocation = InformantLocation.NONE:
	set(value):
		current_location = value;

var current_message: String = "":
	set(value):
		current_message = value;
		

func randomize_location( must_appear: bool ) -> InformantLocation: 
	var max_location_index: int = InformantLocation.size();
	if (must_appear):
		max_location_index -= 1;
	current_location = InformantLocation.get(randi() % max_location_index);
	return current_location;

func update_informant( a_current_location: InformantLocation = current_location, a_current_message: String = current_message ) -> void:
	current_location = a_current_location;
	current_message = a_current_message;
	informant_updated.emit(current_location, current_message);
