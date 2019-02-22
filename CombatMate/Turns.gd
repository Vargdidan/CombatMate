extends Node2D

signal new_turn;

onready var turns_label = get_node("turns")
onready var pressed_time = 0
onready var isPressed = false

func _process(delta):
	if (isPressed):
		pressed_time += delta

func _on_TextureButton_button_down():
	isPressed = true

func _on_TextureButton_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		turns_label.set_text("1")
	else:
		var turns = int(turns_label.get_text())
		turns_label.set_text(String(turns+1));
		emit_signal("new_turn")
	pressed_time = 0