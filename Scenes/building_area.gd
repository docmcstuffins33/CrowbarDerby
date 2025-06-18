extends Node2D

var OutputPorts
var fuel = load("res://Scenes/fuel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OutputPorts = get_tree().get_nodes_in_group("OutputPorts")
	for node in OutputPorts:
		node.connect("produceFuel", _createFuel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _createFuel(pos: Vector2) -> void:
	var newFuel = fuel.instantiate()
	newFuel.position = pos
	add_child(newFuel)


func _on_timer_timeout() -> void:
	print("hi")
	_createFuel(Vector2(get_viewport_rect().size.x/2,get_viewport_rect().size.y/3))
