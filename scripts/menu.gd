extends CanvasLayer

signal game_restart

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("menu"):
		_pause(not get_tree().paused)

func _pause(pause: bool) -> void:
	get_tree().paused = pause
	show() if pause else hide()

func _on_continue_pressed() -> void:
	_pause(false)

func _on_restart_button_down() -> void:
	game_restart.emit()
	_pause(false)

func _on_exit_button_down() -> void:
	get_tree().quit()
