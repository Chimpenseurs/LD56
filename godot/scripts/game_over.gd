extends Control

signal replay
signal gotomainmenu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$message.visible = false
	$EndMenu.visible = true
	


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_replay_pressed() -> void:
	emit_signal("replay")


func _on_menu_pressed() -> void:
	emit_signal("gotomainmenu")
