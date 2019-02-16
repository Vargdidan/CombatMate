extends Node2D

onready var ammo_label = get_node("ammo")
onready var lineEdit = get_node("LineEdit")

func _on_TextureButton_pressed():
	lineEdit.visible = true
	lineEdit.grab_focus()
	pass # Replace with function body.


func _on_LineEdit_text_entered(new_text):
	ammo_label.set_text(new_text)
	lineEdit.visible = false
	lineEdit.clear()
	pass # Replace with function body.
