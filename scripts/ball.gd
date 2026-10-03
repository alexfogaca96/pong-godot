class_name Ball
extends CharacterBody2D

signal collided

@export var speed: float = 750.0
@export var max_speed: float = 1500.0

var bounces: int = 0

func _ready() -> void:
	velocity = Vector2(-speed, randf_range(-100.0, 100.0))

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if not collision:
		return
	
	collided.emit()
	bounces += 1
		
	var new_velocity: Vector2 = velocity.bounce(collision.get_normal())
	var collider: Object = collision.get_collider()
	if (collider is CPU or collider is Player) and collider.velocity.y != 0:
		new_velocity.y = collider.velocity.y
	new_velocity *= _increase_speed_factor()
	new_velocity.clamp(Vector2(speed, max_speed), Vector2(-max_speed, max_speed))
	velocity = new_velocity

func _increase_speed_factor() -> float:
	return 1 + log(bounces) / 100.0
