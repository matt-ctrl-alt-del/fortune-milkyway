extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_killzone_body_entered(body: CharacterBody2D) -> void:
	get_tree().reload_current_scene()
