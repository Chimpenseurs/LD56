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
		if event.keycode == KEY_RIGHT or event.keycode == KEY_LEFT:
			if can_play_footstep:
				$Footsteps.play()
				can_play_footstep = false
				$Footsteps/cooldown.start()
				
		if event.keycode == KEY_RIGHT:
			$Camera2D.position.x += speed_camera
			#$Camera2D.position.x = min($Camera2D.position.x, 632.0)
			$Camera2D.position.x = min($Camera2D.position.x, 5632.0)
		elif event.keycode == KEY_LEFT:
			$Camera2D.position.x -= speed_camera
			$Camera2D.position.x = max($Camera2D.position.x, 0.0)
		elif event.keycode == KEY_DOWN:
			$Camera2D.position.y += speed_camera
			$Camera2D.position.y = min($Camera2D.position.y, 392.0)
		elif event.keycode == KEY_UP:
			$Camera2D.position.y -= speed_camera
			$Camera2D.position.y = max($Camera2D.position.y, -728.0)

func _on_timer_timeout():
	can_play_footstep = true

func _on_gameover_replay():
	print("_on_gameover_replay")
	replay.emit()

func _on_gameover_gotomainmenu():
	gotomainmenu.emit()
