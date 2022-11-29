extends Node2D

func _ready():
	get_node("/root/Hud").get_node("CanvasLayer/Health").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/Kills").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/KillNo").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/Lv").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/Level").visible = true
	get_node("/root/Exit").get_node("CanvasLayer/Button").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/Right").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/Left").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/Attack").visible = true
	get_node("/root/Hud").get_node("CanvasLayer/Jump").visible = true
	get_node("/root/Hud").killNo = 0
	get_node("/root/Hud").level = 1



func _on_Door_area_entered(area):
	if area.name=="DodoHurtBox":
		get_tree().change_scene("res://Scene/world2.tscn")


func _on_FallDieArea_area_entered(area):
	if area.name == "DodoHurtBox":
		get_tree().change_scene("res://Scene/GameOver.tscn")
