extends Node2D


var sun_orbs = 1
var moon_orbs = 1
var at_door1 = false
var at_door2 = false


func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Levels/Level1.tscn")


# Must have collected all orbs and both standing in the tunnels
func finished():
	if sun_orbs == 0 and moon_orbs == 0 and at_door1 and at_door2:
		$Timer.start()
func doors():
	if sun_orbs == 0 and moon_orbs == 0:
		$tunnel_lunar.open()
		$tunnel_solar.open()
func _on_Timer_timeout():
	if at_door1 and at_door2:
		get_tree().change_scene("res://Levels/Level2.tscn")
	else:
		$Timer.start()


func _on_orb_solar_collected():
	sun_orbs -= 1
	doors()
func _on_orb_lunar_collected():
	moon_orbs -= 1
	doors()


# Keeps track of whether there is a body on the tunnels or not
func _on_tunnel_solar_body_entered(body):
	at_door1 = true
	finished()
func _on_tunnel_solar_body_exited(body):
	at_door1 = false

func _on_tunnel_lunar_body_entered(body):
	at_door2 = true
	finished()
func _on_tunnel_lunar_body_exited(body):
	at_door2 = false
