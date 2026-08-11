extends Node

@onready var inventory = get_tree().current_scene.get_node("../Inventory.tscn")

@onready var S1 = inventory.getnode($Panel/VBoxContainer/Slot1/Slot1Text)
@onready var S2 = inventory.getnode($Panel/VBoxContainer/Slot2/Slot1Text)
@onready var S3 = inventory.getnode($Panel/VBoxContainer/Slot3/Slot1Text)
@onready var S4 = inventory.getnode($Panel/VBoxContainer/Slot4/Slot1Text)
@onready var S5 = inventory.getnode($Panel/VBoxContainer/Slot5/Slot1Text)
@onready var S6 = inventory.getnode($Panel/VBoxContainer/Slot6/Slot1Text)
@onready var S7 = inventory.getnode($Panel/VBoxContainer/Slot7/Slot1Text)

var freeslots = []
var occupiedslots = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	freeslots = [S1, S2, S3, S4, S5, S6, S7]

func _add_item(item_name: String):
	var thechosenone = freeslots.pop_front()
	thechosenone.text = item_name
	occupiedslots.append(thechosenone)
	
func _remove_item(slotnum):
	if slotnum in occupiedslots:
		occupiedslots.erase(slotnum)
		slotnum.text = "[empty]"
		
		freeslots.appent(slotnum)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
