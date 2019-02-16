extends Node2D

onready var weapon_label = get_node("weapon_name")
onready var attack_label = get_node("attack")
onready var damage_label = get_node("damage")
onready var weapon_lineEdit = get_node("weapon_lineEdit")
onready var attack_lineEdit = get_node("attack_lineEdit")
onready var damage_lineEdit = get_node("damage_lineEdit")

func _on_weapon_button_pressed():
	weapon_lineEdit.visible = true
	weapon_lineEdit.grab_focus()
	pass # Replace with function body.


func _on_attack_button_pressed():
	attack_lineEdit.visible = true
	attack_lineEdit.grab_focus()
	pass # Replace with function body.


func _on_damage_button_pressed():
	damage_lineEdit.visible = true
	damage_lineEdit.grab_focus()
	pass # Replace with function body.


func _on_weapon_lineEdit_text_entered(new_text):
	weapon_label.set_text(new_text)
	weapon_lineEdit.visible = false
	pass # Replace with function body.


func _on_attack_lineEdit_text_entered(new_text):
	attack_label.set_text(new_text)
	attack_lineEdit.visible = false
	pass # Replace with function body.


func _on_damage_lineEdit_text_entered(new_text):
	damage_label.set_text(new_text)
	damage_lineEdit.visible = false;
	pass # Replace with function body.
