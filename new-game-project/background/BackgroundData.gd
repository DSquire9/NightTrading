class_name BackgroundData

var informant_location: InformantManager.InformantLocation;
var notebook_location: NotebookManager.NotebookLocation;

func _init(a_notebook_location: NotebookManager.NotebookLocation, a_informant_location: InformantManager.InformantLocation) -> void:
	notebook_location = a_notebook_location;
	informant_location = a_informant_location;
