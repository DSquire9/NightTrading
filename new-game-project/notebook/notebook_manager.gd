class_name NotebookManager extends Node

signal notebook_updated(location, tab);

enum NotebookLocation {
	DESK,
	FOCUS_CLOSED,
	FOCUS_OPEN,
}

var current_location: NotebookLocation = NotebookLocation.DESK;
var current_tab: int = -1;
