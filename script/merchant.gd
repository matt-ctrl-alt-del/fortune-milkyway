extends Area2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var InteractionLabel = $MarginContainer/Label
@onready var sprite = $AnimatedSprite2D
@onready var speech_sound = preload("res://interaction_folder/notification.mp3")

const lines: Array[String] = [
	"Hey there!",
	"Wandering across forbidden lands... I see.",
	"Give me a portion of your gold gathered, and I will keep it secret!"
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		if interaction_area.get_overlapping_bodies().size() > 0:
			DialogManager.start_dialog(global_position, lines)
			sprite.flip_h = true if interaction_area.get_overlapping_bodies()[0].global_position.x < global_position.x else false
			
func _on_interaction_area_body_entered(_body):
	InteractionLabel.show_label(global_position, "talk")

func _on_interaction_area_body_exited(_body):
	pass

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	DialogManager.start_dialog(global_position, lines)
	sprite.flip_h = true if interaction_area.get_overlapping_bodies()[0].global_position.x < global_position.x else false
	await DialogManager.dialog_finished
