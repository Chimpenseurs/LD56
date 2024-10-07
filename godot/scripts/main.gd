extends Node

var game_scene = preload("res://scenes/front_view_gameplay.tscn")
var main_menu_scene = preload("res://main_menu.tscn")

var main_menu
var game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	main_menu = main_menu_scene.instantiate()
	add_child(main_menu)
	
	main_menu.play.connect(_on_play)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	get_tree().paused = true
	game.get_node("Camera2D/GameOver").visible = true
	game.get_node("Camera2D/GameOver/AudioStreamPlayer").play()

func _on_play() -> void:
	if game != null:
		game.queue_free()
		
	if main_menu != null:
		main_menu.queue_free()
	
	game = game_scene.instantiate()
	game.replay.connect(_on_play)
	game.gotomainmenu.connect(_on_main_menu)
	
	add_child(game)
	get_tree().paused = false
	$Timer.start()

func _on_main_menu() -> void:
	print("on_main_menu")
	if game != null:
		game.queue_free()
	
	if main_menu != null:
		main_menu.queue_free()
	
	main_menu = main_menu_scene.instantiate()
	add_child(main_menu)
	main_menu.play.connect(_on_play)
