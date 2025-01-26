class_name NotebookManager extends Node

const base_file_path = "res://resources/images/notebook/";

signal notebook_updated(location, tab);

enum NotebookLocation {
	DESK,
	FOCUS_CLOSED,
	FOCUS_OPEN,
}

var location: NotebookLocation = NotebookLocation.DESK;
var tab: int = -1;

const notebook_up_closed: Texture = preload(base_file_path + "Notebook_UpClosed.png");
const notebook_up_open: Texture = preload(base_file_path + "Notebook_UpOpen.png");

@onready var notebook: TextureRect = $TextureRect;

func update_notebook( a_location: NotebookLocation = location, a_tab: int = tab ) -> void:
	location = a_location;
	tab = a_tab;
	notebook_updated.emit(location, tab);
	match location:
		NotebookLocation.FOCUS_CLOSED:
			notebook.texture = notebook_up_closed;
		NotebookLocation.FOCUS_OPEN:
			notebook.texture = notebook_up_open;
		_:
			notebook.texture = null;
