extends Label

var player_score: int = 0
var cpu_score: int = 0

func _ready() -> void:
	_update_text()

func _on_game_cpu_score() -> void:
	cpu_score += 1
	_update_text()

func _on_game_player_score() -> void:
	player_score += 1
	_update_text()

func _on_game_reset_score() -> void:
	player_score = 0
	cpu_score = 0
	_update_text()

func _update_text() -> void:
	text = "%d / %d" % [player_score, cpu_score]
