extends Node2D

onready var pressed_time = 0
onready var isPressed = false
onready var turns1 = 0
onready var turns2 = 0
onready var turns3 = 0

func _process(delta):
	if (isPressed):
		pressed_time += delta
		print(pressed_time)
	pass

func _on_Turns_new_turn():
	turns1 = int(get_node("Label1").get_text())
	if (turns1 <= 1):
		get_node("Label1").set_text("0")
		get_node("Desc1").set_text("")
	else:
		get_node("Label1").set_text(String(turns1-1))
	
	turns2 = int(get_node("Label2").get_text())
	if (turns2 <= 1):
		get_node("Label2").set_text("0")
		get_node("Desc2").set_text("")
	else:
		get_node("Label2").set_text(String(turns2-1))
	
	turns3 = int(get_node("Label3").get_text())
	if (turns3 <= 1):
		get_node("Label3").set_text("0")
		get_node("Desc3").set_text("")
	else:
		get_node("Label3").set_text(String(turns3-1))
	
	pass # Replace with function body.

func _on_turns_btn1_button_down():
	isPressed = true
	pass # Replace with function body.

func _on_turns_btn1_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		get_node("Label1").set_text("0")
		get_node("Desc1").set_text("")
	else:
		var lineEdit = get_node("turns1")
		lineEdit.visible = true
		lineEdit.grab_focus()
	pressed_time = 0
	pass # Replace with function body.

func _on_desc_btn1_pressed():
	var lineEdit = get_node("desc1")
	lineEdit.visible = true
	lineEdit.grab_focus()
	pass # Replace with function body.


func _on_turns1_text_entered(new_text):
	if (new_text == ""):
		new_text = "0"
	get_node("Label1").set_text(new_text)
	get_node("turns1").visible = false
	get_node("turns1").clear()
	pass # Replace with function body.


func _on_desc1_text_entered(new_text):
	get_node("Desc1").set_text(new_text)
	get_node("desc1").visible = false;
	get_node("desc1").clear()
	pass # Replace with function body.


func _on_turns_btn2_button_down():
	isPressed = true
	pass # Replace with function body.


func _on_turns_btn2_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		get_node("Label2").set_text("0")
		get_node("Desc2").set_text("")
	else:
		var lineEdit = get_node("turns2")
		lineEdit.visible = true
		lineEdit.grab_focus()
	pressed_time = 0
	pass # Replace with function body.


func _on_desc_btn2_pressed():
	var lineEdit = get_node("desc2")
	lineEdit.visible = true
	lineEdit.grab_focus()
	pass # Replace with function body.


func _on_turns2_text_entered(new_text):
	if (new_text == ""):
		new_text = "0"
	get_node("Label2").set_text(new_text)
	get_node("turns2").visible = false
	get_node("turns2").clear()
	pass # Replace with function body.


func _on_desc2_text_entered(new_text):
	get_node("Desc2").set_text(new_text)
	get_node("desc2").visible = false;
	get_node("desc2").clear()
	pass # Replace with function body.


func _on_turns_btn3_button_down():
	isPressed = true
	pass # Replace with function body.


func _on_turns_btn3_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		get_node("Label3").set_text("0")
		get_node("Desc3").set_text("")
	else:
		var lineEdit = get_node("turns3")
		lineEdit.visible = true
		lineEdit.grab_focus()
	pressed_time = 0
	pass # Replace with function body.


func _on_desc_btn3_pressed():
	var lineEdit = get_node("desc3")
	lineEdit.visible = true
	lineEdit.grab_focus()
	pass # Replace with function body.


func _on_turns3_text_entered(new_text):
	if (new_text == ""):
		new_text = "0"
	get_node("Label3").set_text(new_text)
	get_node("turns3").visible = false
	get_node("turns3").clear()
	pass # Replace with function body.


func _on_desc3_text_entered(new_text):
	get_node("Desc3").set_text(new_text)
	get_node("desc3").visible = false;
	get_node("desc3").clear()
	pass # Replace with function body.
