extends KinematicBody2D


const UP: Vector2 = Vector2(0, -1)
const GRAVITY: int = 15
const JUMP: int = 350

export var speed: int = 200
var motion: Vector2 = Vector2()

onready var sprite : Sprite = $Sprite
#onready var animator : AnimationPlayer = $AnimationPlayer

# Signal utilizado pelo script Camera2D para ajuste da câmera
signal player_flipped(direction)


func _physics_process(delta):
	motion.y += GRAVITY
	motion = move_and_slide(fromInputsToMotion(), UP)
#	animate()

func fromInputsToMotion() -> Vector2:
	if Input.is_action_pressed("move_right"):
		motion.x = speed
	elif Input.is_action_pressed("move_left"):
		motion.x = -speed
	else:
		motion.x = 0
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		motion.y = -JUMP
	return motion
#
#func animate() -> void:
#	if motion.x != 0:
#		animator.play("Walking")
#	else:
#		animator.play("Idle")		
#	if !is_on_floor():
#		animator.play("Jumping")
#	if motion.x > 0 and sprite.flip_h:
#		sprite.flip_h = false
#		# Emitir o signal para o script da câmera2D
#		emit_signal("player_flipped", "right")
#	if motion.x < 0 and !sprite.flip_h:
#		sprite.flip_h = true
#		# Emitir o signal para o script da câmera2D
#		emit_signal("player_flipped", "left")
