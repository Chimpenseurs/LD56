extends Node2D

signal is_clicked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func find() -> void:
	$AudioStreamPlayer.play()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(Helpers.is_clicked(event)):
		emit_signal("is_clicked")
