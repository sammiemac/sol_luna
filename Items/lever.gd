extends Area2D


#sun levers only amke sun platforms appear/reappear, and moon levers do the same for moon platforms
#kyle said he wants some platforms to already be on/off, and the levers should switch them
#throw signals to let nodes know when switches are on/off


export var lever_id = 0
export var on = false
signal on
signal off


func _ready():
	if lever_id == 1:
		$lever_solar.visible = true
	elif lever_id == 2:
		$lever_lunar.visible = true
	
	if on:
		$AnimationPlayer.play("on")
	elif not on:
		$AnimationPlayer.play("off")


func _on_lever_body_entered(body):
	$Timer.start()
	$CollisionShape2D.disabled = true
	
	if not on:
		$AnimationPlayer.play("on")
		$SoundOn.play()
		emit_signal("on")
		on = true
	elif on:
		$AnimationPlayer.play("off")
		$SoundOff.play()
		emit_signal("off")
		on = false


func _on_Timer_timeout():
	$CollisionShape2D.disabled = false
