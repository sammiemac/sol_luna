extends Area2D


var press = false
signal button_press
signal button_unpress

func _on_button_body_entered(body):
	$AnimatedSprite.play("pressed")
	$SoundPress.play()
	press = true
	emit_signal("button_press")


func _on_button_body_exited(body):
	$Timer.start()
	press = false
	emit_signal("button_unpress")


func _on_Timer_timeout():
	if not press:
		$AnimatedSprite.play("default")
