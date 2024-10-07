extends Node2D

signal replay
signal gotomainmenu

var can_play_footstep = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D/GameOver.replay.connect(_on_gameover_replay)
	$Camera2D/GameOver.gotomainmenu.connect(_on_gameover_gotomainmenu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
var speed_camera = 20.0
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		var offset  = Vector2.ZERO
		var is_moving_x = false
		if event.keycode == KEY_RIGHT:
			offset.x += speed_camera
			is_moving_x = true
		elif event.keycode == KEY_LEFT:
			offset.x -= speed_camera
			is_moving_x = true
		elif event.keycode == KEY_DOWN:
			offset.y += speed_camera
		elif event.keycode == KEY_UP:
			offset.y -= speed_camera
			
		update_camera(offset, is_moving_x)
			
func update_camera(offset : Vector2, is_moving_x : bool):
	if is_moving_x and can_play_footstep:
		$Footsteps.play()
		can_play_footstep = false
		$Footsteps/cooldown.start()
	
	$Camera2D.position += offset
	
	$Camera2D.position.x = min($Camera2D.position.x, 5452.0)
	$Camera2D.position.x = max($Camera2D.position.x, 0.0)
	$Camera2D.position.y = min($Camera2D.position.y, 400.0)
	$Camera2D.position.y = max($Camera2D.position.y, -648.0)

func _on_timer_timeout():
	can_play_footstep = true

func _on_gameover_replay():
	replay.emit()

func _on_gameover_gotomainmenu():
	gotomainmenu.emit()

func _on_sound_value_changed(value: float) -> void:
	var v = 20.0 * (100.0 - value) / 100.0
	AudioServer.set_bus_volume_db(0, -v)



func _on_down_mouse_exited() -> void:
	pass # Replace with function body.
