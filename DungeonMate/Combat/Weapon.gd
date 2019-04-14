extends Node2D

onready var weapon_label = get_node("weapon_name")
onready var attack_label = get_node("attack")
onready var damage_label = get_node("damage")

signal input_popup(currentNode, childNode)

# Called when the node enters the scene tree for the first time.
func _ready():
	var inputPopup = get_parent().get_node("InputPopup")
	self.connect("input_popup", inputPopup, "_enter_value")

func _on_weapon_button_pressed():
	emit_signal("input_popup", self.get_path(), "name")

func _on_attack_button_pressed():
	emit_signal("input_popup", self.get_path(), "attack")

func _on_damage_button_pressed():
	emit_signal("input_popup", self.get_path(), "damage")

func changed_value(value, child):
	if (value == ""):
		return
	
	if (child == "name"):
		weapon_label.set_text(value)
	elif (child == "attack"):
		attack_label.set_text(value)
	elif (child == "damage"):
		damage_label.set_text(value)

func save():
	var save_dict = {
		"node_weapon" : {
		"weapon" : weapon_label.text,
		"attack" : attack_label.text,
		"damage" : damage_label.text
		}}
	return save_dict

func load_from_json(json):
	for key in json.keys():
		if (key == "node_weapon"):
			var node = json["node_weapon"]
			weapon_label.set_text(node["weapon"])
			attack_label.set_text(node["attack"])
			damage_label.set_text(node["damage"])