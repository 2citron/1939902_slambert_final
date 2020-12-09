extends KinematicBody2D

var speed = 500
var velocity = Vector2()
var acc = Vector2()
var friction = 0.65
export (PackedScene) var bullet
onready var canon = $canon
onready var pew = $pew

func _ready():
	pass

func _physics_process(delta):
	_get_input(delta)
	
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		velocity = move_and_slide(velocity)
		velocity = velocity.linear_interpolate(Vector2(0,0), friction * delta)




func _get_input(delta):
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var shoot = Input.is_action_just_pressed("shoot")
	
	if up:
		acc = Vector2(speed, 0).rotated(rotation)
	elif down:
		acc = Vector2(-speed, 0).rotated(rotation)
	elif left:
		acc = Vector2(0, -speed).rotated(rotation)
	elif right:
		acc = Vector2(0, speed).rotated(rotation)
	else:
		acc = Vector2(0, 0)
	velocity += acc * delta

	if shoot:
		var b = bullet.instance()
		pew.play()
		b._create(canon.global_position,rotation)
		get_parent().add_child(b)


func _on_pew_finished():
	pass
