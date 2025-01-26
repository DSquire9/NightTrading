class_name NotebookManager extends Node

signal notebook_updated(location, tab);

enum NotebookLocation {
	DESK,
	FOCUS_CLOSED,
	FOCUS_OPEN,
}

var location: NotebookLocation = NotebookLocation.DESK;
var tab: int = -1;

func update_notebook( a_location: NotebookLocation = location, a_tab: int = tab ) -> void:
	location = a_location;
	tab = a_tab;
	notebook_updated.emit(location, tab);
