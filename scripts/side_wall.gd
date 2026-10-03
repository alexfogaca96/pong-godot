extends Area2D

signal ball_destroyed

func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		body.queue_free()
		ball_destroyed.emit()
