extends Node

var enemies
var enemyCount
var playable = false
export var nextlevel = "res://scenes/level_one.tscn"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enemies = get_tree().get_nodes_in_group("enemy")
	enemyCount = enemies.size()
	if enemyCount > 0:
		playable = true
	if Global.vie <= Global.viemin:
		Global.goto_scene("res://scenes/lose.tscn")
	if enemyCount == 0 and playable:
		Global.vie = Global.viemax
		Global.goto_scene(nextlevel)

