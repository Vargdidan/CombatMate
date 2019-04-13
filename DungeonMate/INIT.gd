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
