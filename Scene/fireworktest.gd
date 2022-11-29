extends Node2D


export var color_set = -1 # -1 == random


onready var particles = $Particles


func _ready():

	var color_number = color_set if (color_set >= 0 && color_set < 4) else randi() % 4
	particles = load(str("res://color/" + str(color_number) + ".tres"))
	$AudioStreamPlayer2D.play()


func _on_Timer_timeout():
	$Particles2D.position = Vector2(rand_range(50, 115), rand_range(50, 300))
	pass # Replace with function body.
