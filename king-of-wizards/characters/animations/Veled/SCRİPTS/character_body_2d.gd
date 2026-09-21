extends CharacterBody2D

@export var speed := 200.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta):

	# SAĞ - D
	if Input.is_action_pressed("run_sag"):
		velocity.x = speed
		anim.play("run_sag")

	# SOL - A
	elif Input.is_action_pressed("run_sol"):
		velocity.x = -speed
		anim.play("run_sol")

	# DURUYOR
	else:
		velocity.x = 0
		anim.play("idle")

	move_and_slide()
