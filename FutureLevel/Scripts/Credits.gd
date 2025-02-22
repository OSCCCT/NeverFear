extends Node2D

@onready var home: Label = $CanvasLayer/HomeButton/Home
@onready var home_button: TouchScreenButton = $CanvasLayer/HomeButton


func _on_home_button_pressed() -> void:
	%AudioStreamPlayer2D.play()
	home_button.modulate = Color(0.5, 0.5, 0)  # Set to red
	await get_tree().create_timer(0.5).timeout  # Wait for 0.1 seconds
	home_button.modulate = Color(1, 1, 1)  # Reset to normal
	get_tree().change_scene_to_file("res://Scenes/HubWorld.tscn")
