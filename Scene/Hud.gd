extends Node2D

var health = 100 setget set_health
var killNo = 0 setget set_killNo
var level = 0 setget set_level
var crystalNo = 0 setget set_crystalNo


func set_health(value):
	health = value
	modulate = Color(1, 1, 1, 1)
	$CanvasLayer/Tween.interpolate_property($CanvasLayer/Health, "value", $CanvasLayer/Health.value, health, 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT, 0)
	$CanvasLayer/Tween.start()
	if health <= 0:
		get_tree().change_scene("res://Scene/GameOver.tscn")
	
func set_killNo(value):
	killNo = value
	$CanvasLayer/KillNo.set_text(str(killNo))
	
func set_level(value):
	level = value
	$CanvasLayer/Level.set_text(str(level))

func set_crystalNo(value):
	crystalNo = value
	set_level(crystalNo/5 + 1)

