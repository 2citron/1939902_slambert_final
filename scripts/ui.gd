extends Node2D
onready var bar = $life

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_max_health = Global.viemax
	bar.max_value = player_max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	bar.value = Global.vie
