extends LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_LineEdit_text_entered(new_text):
	var label = get_parent().get_node("skjold/Label")
	label.set_text(new_text)
	self.visible = false
	pass # Replace with function body.
