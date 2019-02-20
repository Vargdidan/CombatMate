extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	var lineEdit = get_node("LineEdit")
	lineEdit.visible = true
	lineEdit.grab_focus()
	pass # Replace with function body.


func _on_LineEdit_text_entered(new_text):
	var label = get_node("Label")
	label.set_text(new_text)
	get_node("LineEdit").visible = false
	pass # Replace with function body.
