extends KinematicBody2D

export var speed = 800
var velocity = Vector2()
export var damage = 1

func _ready():
	pass

func _create(pos,dir):
	rotation_degrees = rad2deg(dir)+90
	position = pos
	velocity = Vector2(speed, 0).rotated(dir)

func _physics_process(_delta):
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if !("player" in collision.collider.name):
			collision.collider.queue_free()
			queue_free()
		elif "player" in collision.collider.name:
			Global.vie -= damage
			queue_free()
		
		
