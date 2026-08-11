extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frameeee.
func _process(_delta: float) -> void:
	# $DirectionalLight3D_SKY.light_energy
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
