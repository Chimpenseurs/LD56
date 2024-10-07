extends Control

signal replay
signal gotomainmenu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_album() -> void:
	for child in $EndMenu/album.get_children():
		if Global.creatures[child.name]:
			child.get_node("notfound").visible = false
			child.get_node("found").visible = true


func _on_button_pressed() -> void:
	$message.visible = false
	$EndMenu.visible = true
	

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_replay_pressed() -> void:
	replay.emit()


func _on_menu_pressed() -> void:
	gotomainmenu.emit()
