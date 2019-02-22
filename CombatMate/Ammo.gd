extends Node2D

onready var ammo_label = get_node("ammo")

signal input_popup(currentNode, childNode)

# Called when the node enters the scene tree for the first time.
func _ready():
	var inputPopup = get_parent().get_node("InputPopup")
	self.connect("input_popup", inputPopup, "_enter_value")

func _on_TextureButton_pressed():
	emit_signal("input_popup", self.get_path(), "")

func changed_value(value, child):
	if (value != ""):
		ammo_label.set_text(value)
