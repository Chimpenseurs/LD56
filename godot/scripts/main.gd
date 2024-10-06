extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# todo: connect replay
	# todo: connect main menu
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	get_tree().paused = true
	$Scene/Camera2D/GameOver.visible = true
	$Scene/Camera2D/GameOver/AudioStreamPlayer.play()
