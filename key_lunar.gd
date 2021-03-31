extends Area2D


signal collected


func _on_key_lunar_body_entered(body):
	set_collision_mask_bit(0, false)
	$AnimationPlayer.play("collect")
	$SoundCollect.play()
	$Timer.start()


#sun/moon keys can be collected on either side but sun only opens sun and etc.
func _on_Timer_timeout():
	if not $CollisionShape2D.disabled:
		emit_signal("collected")
	$CollisionShape2D.disabled = true
	$AnimatedSprite.visible = false
