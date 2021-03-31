extends Node2D


var sun_orbs = 1
var moon_orbs = 1
var at_door1 = false
var at_door2 = false


func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Level3.tscn")


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
		get_tree().change_scene("res://Level2.tscn")
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


#==============================================================================
var buttons1 = 1
func _on_button_button_press():
	buttons1 -= 1
	finished1()
func _on_button_button_unpress():
	buttons1 += 1
	finished1()
#plat1
func finished1():
	var plat = $ButtonsMPlats/mplat
	if buttons1 == 0:
		plat.disabled = false
		plat.move()
	elif plat.returning:
		plat.move()

#==============================================================================
var buttons2 = 1
func _on_button2_button_press():
	buttons2 -= 1
	finished2()
func _on_button2_button_unpress():
	buttons2 += 1
	finished2()
#plat2
func finished2():
	var plat = $ButtonsMPlats/mplat2
	if buttons2 == 0:
		plat.disabled = false
		plat.move()
	elif plat.returning:
		plat.move()

#==============================================================================
var buttons3 = 1
func _on_button3_button_press():
	buttons3 -= 1
	finished3()
func _on_button3_button_unpress():
	buttons3 += 1
	finished3()
#plat3
func finished3():
	var plat = $ButtonsMPlats/mplat3
	if buttons3 == 0:
		plat.disabled = false
		plat.move()
	elif plat.returning:
		plat.move()

#==============================================================================
var buttons4 = 1
func _on_button4_button_press():
	buttons4 -= 1
	finished4()
func _on_button4_button_unpress():
	buttons4 += 1
	finished4()
#plat4
func finished4():
	var plat = $ButtonsMPlats/mplat4
	if buttons4 == 0:
		plat.disabled = false
		plat.move()
	elif plat.returning:
		plat.move()

#==============================================================================
var buttons5 = 4
func _on_button5_button_press():
	buttons5 -= 1
	finished5()
func _on_button5_button_unpress():
	buttons5 += 1
	finished5()
#plat5
func finished5():
	var plat = $ButtonsMPlats/mplat5
	if buttons5 == 0:
		plat.disabled = false
		plat.move()
	elif plat.returning:
		plat.move()
