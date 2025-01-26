class_name BackgroundManager extends Node

@onready var computer_view: TextureRect = $ComputerView/TextureRect;
@onready var television_view: TextureRect = $TelevisionView/TextureRect;

func update_background( background_data: BackgroundData ) -> void:
	update_computer_view(background_data);
	update_television_view(background_data);

func update_computer_view( background_data: BackgroundData ) -> void:
	var file_name = "Screen_Computer";
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
	print(file_name); # this needs to grab resource + feed into texture rect

func update_television_view( background_data: BackgroundData ) -> void:
	var file_name = "Screen_Television";
	match background_data.informant_location: 
		InformantManager.InformantLocation.PLANTS:
			file_name += "__Informant_Plants";
		_:
			file_name += "__Informant_None";
	file_name += ".png";
	print(file_name); # this needs to grab resource + feed into texture rect
