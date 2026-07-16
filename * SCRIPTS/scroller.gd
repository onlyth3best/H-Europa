extends Control

@export var speed := 217.0

@onready var label_a := $Label1
@onready var label_b := $Label2

var label_height := 0.0

func _ready():
	label_height = label_a.size.x
	label_b.position.x = label_a.position.x + label_height

func _process(delta):
	label_a.position.x += speed * delta
	label_b.position.x += speed * delta

	if label_a.position.x >= label_height:
		label_a.position.x = label_b.position.y - label_height

	if label_b.position.x >= label_height:
		label_b.position.x = label_a.position.y - label_height
#
#
#extends Control
#
#@export var speed := 27.0
#
#@onready var label_a := $Label1
#@onready var label_b := $Label2
#
#var label_height := 0.0
#
#func _ready():
	#label_height = label_a.size.x
	#label_b.position.x = label_a.position.x + label_height
#
#func _process(delta):
	#label_a.position.x -= speed * delta
	#label_b.position.x -= speed * delta
#
	#if label_a.position.x <= -label_height:
		#label_a.position.x = label_b.position.y + label_height
#
	#if label_b.position.x <= -label_height:
		#label_b.position.x = label_a.position.y + label_height
