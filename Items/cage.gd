extends RigidBody2D


var press = false


func _on_button_button_press():
	if  not press:
		$SoundDoorFall.play()
		$AnimationPlayer.play("fall")
	press = true
