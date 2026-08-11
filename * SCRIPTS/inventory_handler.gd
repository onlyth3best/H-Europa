extends Node

@onready var S1 = null
@onready var S2 = null
@onready var S3 = null
@onready var S4 = null
@onready var S5 = null
@onready var S6 = null
@onready var S7 = null

var freeslots = []
var occupiedslots = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _add_item(item_name: String):
	if freeslots.is_empty():
		print("Inventory is full!")
		return
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
