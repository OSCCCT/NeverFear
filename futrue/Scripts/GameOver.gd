extends Node2D



func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
