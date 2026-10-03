extends Node

signal player_score
signal cpu_score
signal reset_score
signal game_start

const ballScene = preload("res://scenes/Ball.tscn")

var game_is_running: bool = false
var curr_ball: Ball
var audio_manager: AudioManager

func _ready() -> void:
	_create_ball()
	audio_manager = $AudioStreamPlayer
	
func _create_ball() -> void:
	var ball = ballScene.instantiate()
	ball.set_process_mode(ProcessMode.PROCESS_MODE_DISABLED)
	ball.global_position = get_viewport().size / 2
	add_child(ball)
	curr_ball = ball
	curr_ball.collided.connect(_on_ball_collided)
	
func _input(_event: InputEvent) -> void:
	if not game_is_running and Input.is_action_just_pressed("start_game") and curr_ball:
		_start_game()

func _start_game() -> void:
	game_start.emit(curr_ball)
	curr_ball.set_process_mode(ProcessMode.PROCESS_MODE_INHERIT)

func _on_ball_collided() -> void:
	audio_manager.on_ball_collided()

func _on_left_wall_ball_destroyed() -> void:
	curr_ball.collided.disconnect(_on_ball_collided)
	cpu_score.emit()
	_create_ball()

func _on_right_wall_ball_destroyed() -> void:
	curr_ball.collided.disconnect(_on_ball_collided)
	player_score.emit()
	_create_ball()

func _on_game_restart() -> void:
	reset_score.emit()
	curr_ball.collided.disconnect(_on_ball_collided)
	curr_ball.queue_free()
	_create_ball()
