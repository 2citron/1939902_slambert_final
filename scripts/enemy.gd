extends KinematicBody2D

export var speed = 200
var velocity = Vector2()
var acc = Vector2()
var friction = 0.65
export (PackedScene) var bullet
onready var canon = $canon
onready var pew = $pew
onready var timer = $timer
var targeted = false
var target

func _ready():
	pass

func _physics_process(delta):
	
	if targeted:
		var dir = target.get_position() - global_position
		if dir.length() > 5:
			rotation = dir.angle()
			velocity += Vector2(speed, 0).rotated(rotation) * delta
			velocity = move_and_slide(velocity)
			velocity = velocity.linear_interpolate(Vector2(0,0), friction * delta)

func _on_Area2D_body_entered(body):
	if "player" in body.name:
		timer.start()
		target = body
		targeted = true

func _shoot():
	var b = bullet.instance()
	pew.play()
	b._create(canon.global_position,rotation)
	get_parent().add_child(b)

func _on_timer_timeout():
	_shoot()
