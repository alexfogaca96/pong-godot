extends CharacterBody2D
class_name CPU

@export var acceleration: float = 10 # 4.0 easy # medium # 5.8 hard
@export var cpu_velocity: float = 400.0
@export var y_follow_ball_threshold: float = 30.0 

var ball: Ball

func _physics_process(delta: float) -> void:
	if not ball:
		return
	velocity.y = 0
	if ball.position.y > position.y + y_follow_ball_threshold or ball.position.y < position.y - y_follow_ball_threshold:
		velocity.y = clampf((ball.position.y - position.y) * acceleration, -cpu_velocity, cpu_velocity) * delta * 100
	move_and_slide()

func _on_game_start(current_ball: Ball) -> void:
	self.ball = current_ball
