extends Node2D
var animated_health = 0
signal input_popup(currentNode, childNode)

onready var max_label = get_node("TextureProgress/max")
onready var current_label = get_node("TextureProgress/current")

onready var texture_progress = get_node("TextureProgress")
onready var tween = get_node("Tween")

func _ready():
	var inputPopup = get_parent().get_node("InputPopup")
	self.connect("input_popup", inputPopup, "_enter_value")

func _process(delta):
	current_label.set_text(String(int(animated_health)))
	texture_progress.value = animated_health

func changed_value(value, child):
	if (value == ""):
		return
	
	if (child == "max"):
		max_label.set_text(value);
		texture_progress.max_value = int(value)
	elif (child == "add"):
		_add_hp(value)
	elif (child == "sub"):
		_on_subtract_hp(value)

func _on_max_hp_button_pressed():
	emit_signal("input_popup", self.get_path(), "max")

func _on_scar_button_pressed():
	emit_signal("input_popup", self.get_path(), "sub")

func _on_bandaid_button_pressed():
	emit_signal("input_popup", self.get_path(), "add")

func _setHP(value):
	tween.interpolate_property(self, "animated_health", animated_health, value, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()

func _on_subtract_hp(value):
	var current = texture_progress.value
	var new_value = current - int(value)
	if (new_value < 0):
		new_value = 0
	_setHP(new_value)

func _add_hp(value):
	var current = texture_progress.value
	var new_value = current + int(value)
	if (new_value > texture_progress.max_value):
		new_value = texture_progress.max_value
	_setHP(new_value)

func save():
	var save_dict = {
		"node_hp" : {
		"current_hp" : texture_progress.value,
		"max_hp" : texture_progress.max_value
		}}
	return save_dict

func load_from_json(json):
	var node_hp = json["node_hp"]
	if (node_hp == null):
		return
	var current = node_hp["current_hp"]
	texture_progress.value = int(current)
	current_label.set_text(String(current))
	animated_health = current
	var max_hp = node_hp["max_hp"]
	texture_progress.max_value = int(max_hp)
	max_label.set_text(String(max_hp))