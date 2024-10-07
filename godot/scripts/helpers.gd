extends Node

func is_clicked(event: InputEvent) -> bool:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			return true
	return false

func get_mouse_position() -> Vector2:
	return get_viewport().get_mouse_position()
	
func get_resolution():
	return get_viewport().size
	
func get_touch_screen_move():
	return 
