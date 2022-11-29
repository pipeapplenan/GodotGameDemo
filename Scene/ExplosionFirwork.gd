extends Node2D


export var color_set = -1 # -1 == random


onready var particles = $Particles2D2


func _ready():
	get_node("/root/Hud").get_node("CanvasLayer/Health").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Kills").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/KillNo").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Lv").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Level").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Right").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Left").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Attack").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Jump").visible = false
	
	
	var color_number = color_set if (color_set >= 0 && color_set <= 4) else randi() % 4
	particles = load(str("res://color/" + str(color_number) + ".tres"))
	$AudioStreamPlayer2D.play()


func _on_Timer_timeout():
	$Particles2D2.position = Vector2(rand_range(50, 115), rand_range(50, 300))
	pass # Replace with function body.


func _on_Button_pressed():
	get_node("/root/Hud").get_node("CanvasLayer/Health").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Kills").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/KillNo").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Lv").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Level").visible = false
	get_node("/root/Exit").get_node("CanvasLayer/Button").visible = false
	get_node("/root/Hud").killNo = 0
	get_node("/root/Hud").level = 1
	get_node("/root/Hud").crystalNo = 0
	get_tree().change_scene("res://Scene/Menu.tscn")
