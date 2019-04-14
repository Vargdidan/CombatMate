extends PopupMenu

onready var lineEdit = get_node("CenterContainer/LineEdit")
var currentNode = ""
var childNode = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _enter_value(nodePath, child):
	self.popup()
	lineEdit.grab_focus()
	currentNode = nodePath
	childNode = child
	pass

func _on_LineEdit_text_entered(new_text):
	get_node(currentNode).changed_value(new_text, childNode)
	lineEdit.clear()
	self.hide()
	pass # Replace with function body.


func _on_LineEdit_focus_exited():
	lineEdit.clear()
	self.hide()
	pass # Replace with function body.
