extends RigidBody2D


export var exists = true


func _ready():
	if exists:
		$left.visible = true
		$right.visible = true
		set_collision_layer_bit(2, true)
	else:
		$left.visible = false
		$right.visible = false
		set_collision_layer_bit(2, false)


func _on_lever_on():
	$left.visible = true
	$right.visible = true
	set_collision_layer_bit(2, true)


func _on_lever_off():
	$left.visible = false
	$right.visible = false
	set_collision_layer_bit(2, false)

#==============================================================================
func _on_lever2_on():
	$left.visible = false
	$right.visible = false
	set_collision_layer_bit(2, false)


func _on_lever2_off():
	$left.visible = true
	$right.visible = true
	set_collision_layer_bit(2, true)
