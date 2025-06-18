extends Area2D

signal produceFuel(pos : Vector2)

func _produceFuel() -> void:
	produceFuel.emit(global_position)
