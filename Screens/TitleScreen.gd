extends Control


func _ready():
	$HowTo.visible = false
	$Credits.visible = false


func _on_play_pressed():
	$Timer.start()
	$SoundEnter.play()


func _on_howto_pressed():
	$HowTo.visible = true
	$SoundEnter.play()


func _on_credits_pressed():
	$Credits.visible = true
	$SoundEnter.play()


func _on_Back_pressed():
	$HowTo.visible = false
	$Credits.visible = false
	$SoundBack.play()


func _on_play_mouse_entered():
	$SoundSelect.play()


func _on_howto_mouse_entered():
	$SoundSelect.play()


func _on_credits_mouse_entered():
	$SoundSelect.play()


func _on_Back_mouse_entered():
	$SoundSelect.play()


func _on_Timer_timeout():
	get_tree().change_scene("res://Levels/Level1.tscn")
