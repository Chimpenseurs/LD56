extends Node2D

@export var hat_color : Color = Color.WHITE

signal is_clicked

func _ready() -> void:
	Global.creatures[self.name] = 0
	
func find() -> void:
	$AudioStreamPlayer.play()
	Global.creatures[self.name] = 1
	disable_click()
	
func disable_click():
	remove_child($Area2D)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(Helpers.is_clicked(event)):
		emit_signal("is_clicked")
		get_viewport().set_input_as_handled()
