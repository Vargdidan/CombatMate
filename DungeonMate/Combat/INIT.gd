extends Node2D

signal input_popup(currentNode, childNode)

# Called when the node enters the scene tree for the first time.
func _ready():
	var inputPopup = get_parent().get_node("InputPopup")
	self.connect("input_popup", inputPopup, "_enter_value")

func _on_TextureButton_pressed():
	emit_signal("input_popup", self.get_path(), "")

func changed_value(value, child):
	var label = get_node("Label")
	if (value != ""):
		label.set_text(value)

func save():
	var save_dict = {
		"node_init" : {
		"init" : get_node("Label").text
		}}
	return save_dict

func load_from_json(json):
	for key in json.keys():
		if (key == "node_init"):
			var node_init = json["node_init"]
			var init = node_init["init"]
			get_node("Label").set_text(init)