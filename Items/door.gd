extends StaticBody2D


export var type = 0
var closed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if type == 1:
		$Solar.visible = true
		$Lunar.visible = false
	elif type == 2:
		$Lunar.visible = true
		$Solar.visible = false
	elif type == 3:
		$Lunar.visible = false
		$Solar.visible = true


func open():
	$SoundDoor.play()
	if type == 1:
		$AnimationPlayer.play("up")
	elif type == 2:
		$AnimationPlayer.play("up2")
	elif type == 3:
		$Timer.start()
		$AnimationPlayer.play("fast")


func _on_Timer_timeout():
	$SoundDoor.stop()


func _on_key_solar_collected():
	open()


func _on_key_lunar_collected():
	open()


func _on_key_lunar2_collected():
	open()


func _on_key_solar2_collected():
	open()


func _on_button_button_press():
	if not closed:
		open()
		closed = true
