extends CharacterBody2D
class_name Player
	
@export var character_velocity: float = 400.0

var y_movement: float = 0.0

func _process(_delta: float) -> void:
	y_movement = Input.get_axis("move_up", "move_down")
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(0.0, character_velocity * y_movement) * delta * 100
	move_and_slide()
