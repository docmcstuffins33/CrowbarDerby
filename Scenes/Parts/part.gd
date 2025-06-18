extends Area2D

var hoveringOver := false
var grabbed := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$InputPort.connect("inputRecieved", _on_input_input_recieved)
	$OutputPort.add_to_group("OutputPorts")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && hoveringOver:
		grabbed = true
	if Input.is_action_just_released("Interact") && grabbed:
		grabbed = false
	if grabbed:
		position = get_viewport().get_mouse_position()
		if Input.is_action_just_pressed("Rotate"):
			rotation += PI/2
		

func _on_mouse_entered() -> void:
	hoveringOver = true

func _on_mouse_exited() -> void:
	hoveringOver = false


func _on_input_input_recieved() -> void:
	$OutputPort._produceFuel()
