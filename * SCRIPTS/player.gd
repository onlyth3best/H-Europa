extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 3.5

@export var camera : Camera3D
@onready var raycast : RayCast3D = $Camera3D/InteractionRay
var current_interactable = null

var cursor_locked = true
var mouse_sensitivity := 0.1
var rotation_x := 0
var rotation_y := 0

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	#testing	
	if Input.is_action_just_pressed("activate"):
		activate()

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	# testing…
	check_hover_collision()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_y -= event.relative.x * mouse_sensitivity
		rotation_x -= event.relative.y * mouse_sensitivity
		
		rotation_x = clamp(rotation_x, -90, 90)
		
		rotation_degrees.y = rotation_y
		camera.rotation_degrees.x = rotation_x

#testing…
func check_hover_collision():
	if raycast.is_colliding():
		var hover_collider = raycast.get_collider()
		if hover_collider and is_instance_valid(hover_collider) and hover_collider.has_method("interact") and hover_collider.has_method("show_prompt"):
			if current_interactable != hover_collider:
				if current_interactable:
					current_interactable.hide_prompt()
				current_interactable = hover_collider
				current_interactable.show_prompt()
		else:
			hide_current_prompt()
	else:
		hide_current_prompt()

func hide_current_prompt():
	if current_interactable:
		current_interactable.hide_prompt()
		current_interactable = null

func activate():
	var hit = raycast.get_collider()
	if cursor_locked and raycast.is_colliding():
		if hit and hit.has_method("interact"):
			hit.interact()
