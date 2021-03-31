extends Area2D


signal collected


#play "collected" and start timer when player collects orb
func _on_orb_solar_body_entered(body):
	set_collision_mask_bit(0, false)
	$AnimationPlayer.play("collect")
	$SoundCollect.play()
	$Timer.start()


#ensures there is enough time for the animation and sound to play
func _on_Timer_timeout():
	if not $CollisionShape2D.disabled:
		emit_signal("collected")
	$CollisionShape2D.disabled = true
	$AnimatedSprite.visible = false
