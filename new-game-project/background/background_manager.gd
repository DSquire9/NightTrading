class_name BackgroundManager extends Node

@onready var computer_view: TextureRect = $ComputerView/TextureRect;
@onready var television_view: TextureRect = $TelevisionView/TextureRect;

const base_file_path = "res://resources/images/backgrounds/";

const screen_computer__informant_computer__notebook_desk = preload(base_file_path + "Screen_Computer__Informant_Computer__Notebook_Desk.png");
const screen_computer__informant_computer__notebook_none = preload(base_file_path + "Screen_Computer__Informant_Computer__Notebook_None.png");
const screen_computer__informant_window__notebook_desk = preload(base_file_path + "Screen_Computer__Informant_Window__Notebook_Desk.png");
const screen_computer__informant_window__notebook_none = preload(base_file_path + "Screen_Computer__Informant_Window__Notebook_None.png");
const screen_computer__informant_none__notebook_desk = preload(base_file_path + "Screen_Computer__Informant_None__Notebook_Desk.png");
const screen_computer__informant_none__notebook_none = preload(base_file_path + "Screen_Computer__Informant_None__Notebook_None.png");

func update_background( background_data: BackgroundData ) -> void:
	update_computer_view(background_data);
	update_television_view(background_data);

func update_computer_view( background_data: BackgroundData ) -> void:
	var file_name = base_file_path + "Screen_Computer";
	match background_data.informant_location: 
		InformantManager.InformantLocation.COMPUTER:
			file_name += "__Informant_Computer";
		InformantManager.InformantLocation.WINDOW:
			file_name += "__Informant_Window";
		_:
			file_name += "__Informant_None";
	match background_data.notebook_location:
		NotebookManager.NotebookLocation.DESK:
			file_name += "__Notebook_Desk";
		_:
			file_name += "__Notebook_None";
	file_name += ".png";
	computer_view.texture = load(file_name);
	print(file_name); # this needs to grab resource + feed into texture rect

func update_television_view( background_data: BackgroundData ) -> void:
	var file_name = base_file_path + "Screen_Television";
	match background_data.informant_location: 
		InformantManager.InformantLocation.PLANTS:
			file_name += "__Informant_Plants";
		_:
			file_name += "__Informant_None";
	file_name += ".png";
	television_view.texture = load(file_name);
	print(file_name); # this needs to grab resource + feed into texture rect
