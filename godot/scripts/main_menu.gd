extends Control

signal play

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_play_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	play.emit()
