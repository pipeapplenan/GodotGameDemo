extends Control

var dialog = [
'One night, Dodo had a very trilling dream.',
	'She become a very brave girl.',
	'She walks through the magic forest, jump over undergrand magma cave.',
	'She run over dark forest and fight with big monsters in Arena.',
	'Dodo feels excited in her dream compared to his timid personality in a real world.',
	'She can kill and fight with enemies.',
	'Dodo needs your encourange to move forward.....'
]

var finished = false

func _ready():
	load_dialog()
	
#func _process(delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		load_dialog()
	
func load_dialog():
	#if dialog_index < dialog.size():
	#	$RichTextLabel.bbcode_text = dialog[dialog_index]
		#$RichTextLabel.percent_visible = 1
		#$Tween.interpolate_property(
		#	$RichTextLabel, "percent_visible", 0, 1, 3,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		#)
		#$Tween.start()
	#else:
	#	queue_free()
	#dialog_index += 1
	for i in dialog:
		$RichTextLabel.text = i
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 4,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Tween.start()
		yield(get_tree().create_timer(5),"timeout")



