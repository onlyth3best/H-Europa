extends Area3D

@onready var prompt_label : Label3D = $InteractText

func interact():
	print("you picked up this item!!")
	#queue_free() TO DELETE
	
func show_prompt():
	prompt_label.visible = true
	
func hide_prompt():
	prompt_label.visible = false
