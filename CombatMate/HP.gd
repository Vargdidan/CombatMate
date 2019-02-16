extends Node2D
var animated_health = 0

onready var max_lineEdit = get_node("Max_LineEdit")
onready var sub_lineEdit = get_node("Sub_LineEdit")
onready var add_lineEdit = get_node("Add_LineEdit")

onready var max_label = get_node("TextureProgress/max")
onready var current_label = get_node("TextureProgress/current")

onready var texture_progress = get_node("TextureProgress")
onready var tween = get_parent().get_node("Tween")

func _ready():
	texture_progress.max_value = int(max_label.get_text())
	texture_progress.value = int(current_label.get_text())
	animated_health = texture_progress.value
	pass

func _process(delta):
	current_label.set_text(String(int(animated_health)))
	texture_progress.value = animated_health
	pass

func _on_max_hp_button_pressed():
	max_lineEdit.visible = true
	max_lineEdit.grab_focus()
	pass # Replace with function body.


func _on_Max_LineEdit_text_entered(new_text):
	max_label.set_text(new_text)
	max_lineEdit.visible = false
	texture_progress.max_value = int(new_text)
	pass # Replace with function body.


func _on_scar_button_pressed():
	sub_lineEdit.visible = true
	sub_lineEdit.grab_focus()
	pass # Replace with function body.

func _on_bandaid_button_pressed():
	add_lineEdit.visible = true
	add_lineEdit.grab_focus()
	pass # Replace with function body.

func _setHP(value):
	tween.interpolate_property(self, "animated_health", animated_health, value, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()
	pass

func _on_Sub_LineEdit_text_entered(new_text):
	sub_lineEdit.visible = false
	var current = texture_progress.value
	var new_value = current - int(new_text)
	if (new_value < 0):
		new_value = 0
	_setHP(new_value)
	sub_lineEdit.set_text("")
	pass # Replace with function body.

func _on_Add_LineEdit_text_entered(new_text):
	add_lineEdit.visible = false
	var current = texture_progress.value
	var new_value = current + int(new_text)
	if (new_value > texture_progress.max_value):
		new_value = texture_progress.max_value
	_setHP(new_value)
	add_lineEdit.set_text("")
	pass # Replace with function body.
