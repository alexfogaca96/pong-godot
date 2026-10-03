extends AudioStreamPlayer
class_name AudioManager

const ball_bounce: AudioStream = preload("res://assets/sounds/ball_bounce.wav")
const player_goal: AudioStream = preload("res://assets/sounds/player_goal.wav")
const cpu_goal: AudioStream = preload("res://assets/sounds/cpu_goal.wav")
const game_start: AudioStream = preload("res://assets/sounds/game_start.wav")

func on_ball_collided() -> void:
	stream = ball_bounce
	play()

func _on_game_start(_ball: Ball) -> void:
	stream = game_start
	play()

func _on_game_cpu_score() -> void:
	stream = cpu_goal
	play()

func _on_game_player_score() -> void:
	stream = player_goal
	play()
