extends Node2D

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if(Helpers.is_clicked(event)):
		$AnimatedSprite2D.play("clicked")
		remove_child($Area2D)

var can_move = false

func _process(delta):
	if can_move:
		position += Vector2(-20, -25)
		scale += Vector2(0.05, 0.05)
		if(scale.x > 3):
			get_parent().hide()

func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("move")
	can_move = true
