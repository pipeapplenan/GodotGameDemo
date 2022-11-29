extends Node2D


export(int) var hpHeight = 12
export(int) var hpWidth	= 50

export(int) var hpTotal = 100
export(int) var currentHp = 100


func init():
	$HP.rect_size = Vector2(hpWidth, hpHeight)
	$HP.max_value = hpTotal
	$HP.value = hpTotal
	modulate = Color(1, 1, 1, 0)
	
	
func update_hp(hp):
	modulate = Color(1, 1, 1, 1)
	$Tween.interpolate_property($HP, "value", $HP.value, hp, 0.25, Tween.TRANS_LINEAR, Tween.EASE_OUT, 0)
	$Tween.start()
