extends Node2D

onready var ammo_label = get_node("ammo")
onready var pressed_time = 0
onready var isPressed = false

signal input_popup(currentNode, childNode)

# Called when the node enters the scene tree for the first time.
func _ready():
	var inputPopup = get_parent().get_node("InputPopup")
	self.connect("input_popup", inputPopup, "_enter_value")

func _process(delta):
	if (isPressed):
		pressed_time += delta

func _on_TextureButton_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		emit_signal("input_popup", self.get_path(), "ammo")
	else:
		if (int(ammo_label.text) <= 1):
			ammo_label.set_text("0")
		else:
			ammo_label.set_text(String(int(ammo_label.text)-1))
	pressed_time = 0

func _on_TextureButton_button_down():
	isPressed = true

func changed_value(value, child):
	if (value != ""):
		ammo_label.set_text(value)

func save():
	var save_dict = {
		"node_ammo" : {
		"ammo" : ammo_label.text
		}}
	return save_dict

func load_from_json(json):
	for key in json.keys():
		if (key == "node_ammo"):
			var node = json["node_ammo"]
			ammo_label.set_text(node["ammo"])
