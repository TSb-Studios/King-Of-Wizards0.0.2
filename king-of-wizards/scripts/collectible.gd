extends Area2D

@onready var anim = $AnimatedSprite2D

var picked := false

func _ready():
	anim.play("Base")


func _on_area_entered(area):
	if picked:
		return

	if area.is_in_group("HitBox"):
		picked = true
		anim.play("Picked")
		await anim.animation_finished
		queue_free()
