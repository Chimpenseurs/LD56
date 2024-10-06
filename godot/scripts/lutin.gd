extends Node2D

@export var hat_color : Color = Color.WHITE

signal is_clicked
	
func find() -> void:
	$AudioStreamPlayer.play()
	disable_click()
	
func disable_click():
	remove_child($Area2D)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(Helpers.is_clicked(event)):
		emit_signal("is_clicked")
