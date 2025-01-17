extends RigidBody2D
@onready var node_2d: Node2D = $"../Node2D"
@onready var marker_2d: Marker2D = $Marker2D


signal clicked

var held = false

func _process(delta: float) -> void:
	marker_2d.position = linear_velocity
	node_2d.look_at(marker_2d.global_position)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("clicked")
			clicked.emit(self)

func _physics_process(delta):
	if held:
		apply_central_force(get_global_mouse_position())  
	
func pickup():
	if held:
		return
	#freeze = true
	held = true

func drop():
	if held:
		freeze = false
		held = false
