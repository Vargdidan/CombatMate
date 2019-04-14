extends Node2D

func _ready():
	_load_session()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_save_session()
		get_tree().quit()

func _save_session():
	var save_session = File.new()
	save_session.open("user://savedsession.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		var node_data = node.call("save")
		save_session.store_line(to_json(node_data))
	save_session.close()

func _load_session():
	var saved_session = File.new()
	if not saved_session.file_exists("user://savedsession.save"):
		return
	
	saved_session.open("user://savedsession.save", File.READ)
	while not saved_session.eof_reached():
		var current_line = parse_json(saved_session.get_line())
		if (current_line == null):
			continue
		var save_nodes = get_tree().get_nodes_in_group("Persist")
		for node in save_nodes:
			node.load_from_json(current_line)
		
	saved_session.close()

func _on_Timer_timeout():
	_save_session()
