extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
var speed_camera = 8.0
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_RIGHT:
			$Camera2D.position.x += speed_camera
		elif event.keycode == KEY_LEFT:
			$Camera2D.position.x -= speed_camera
			$Camera2D.position.x = max($Camera2D.position.x, 0.0)
		elif event.keycode == KEY_DOWN:
			$Camera2D.position.y += speed_camera
		elif event.keycode == KEY_UP:
			$Camera2D.position.y -= speed_camera
			$Camera2D.position.y = max($Camera2D.position.y, 0.0)
