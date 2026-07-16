extends Area3D

@onready var prompt_label : Label3D = $InteractText
@onready var animPlayerWD : AnimationPlayer = $"../../doorwalls/AnimationPlayer_WALLDOOR"
var IsOpen = false

func interact():
	print("you picked up this item!!")
	#queue_free() TO DELETE
	if !IsOpen:
		animPlayerWD.play("dooropen")
		IsOpen = true
	else:
		animPlayerWD.play("doorclose")
		IsOpen = false
	
func show_prompt():
	prompt_label.visible = true
	
func hide_prompt():
	prompt_label.visible = false
