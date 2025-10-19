extends Node2D

@onready var audio_pain = $Audio_Hurt

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_killzone_body_entered(body: CharacterBody2D) -> void:
			audio_pain.play()
			await get_tree().create_timer(0.2).timeout
			get_tree().reload_current_scene()
