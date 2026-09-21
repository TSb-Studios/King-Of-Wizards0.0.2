
extends CharacterBody2D

@export var speed := 200.0
@export var gravity := 1200.0

@onready var anim = $AnimatedSprite2D


func _physics_process(delta):

	# YERÇEKİMİ
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	# ZIPLAMA
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = -400
		anim.play("Jump")

	# SAĞ / SOL HAREKET
	var direction := 0

	if Input.is_action_pressed("LEFT"):
		direction -= 1

	if Input.is_action_pressed("RİGHT"):
		direction += 1

	velocity.x = direction * speed

	# ANİMASYON
	if not is_on_floor():
		anim.play("Jump")
	elif direction != 0:
		anim.play("Run")
	else:
		anim.play("idle")

	# YÖN
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
		anim.flip_h = true

	move_and_slide()
