extends CanvasLayer


@onready var audio_stream_player_2d: AudioStreamPlayer2D = %AudioStreamPlayer2D
@onready var enimies_killed: Label = $Win/EnimiesKilled
@onready var cash_collected: Label = $Win/CashCollected
@onready var run_time: Label = $Win/RunTime
@onready var stats_link: TouchScreenButton = $Win/UIbutton/StatsLink
@onready var label: Label = $Win/UIbutton/StatsLink/Label


func _ready():
	if DisplayServer.is_touchscreen_available() and OS.has_feature("Andriod"):
		get_viewport().screen_set_orientation(DisplayServer.SCREEN_PORTRAIT)
	else:
		return

func _process(_delta):
	run_time.text = "RUN TIME: %s" % GameManager.current_level_time
	enimies_killed.text = "ENEMIES VAPORIZED: %d" % GameManager.current_kills
	cash_collected.text = "CASH COLLECTED: $ %s" % GameManager.game_cash




func _on_stats_link_pressed() -> void:
	audio_stream_player_2d.play()
	label.modulate = Color(0, 0.5, 1)  # Set to red
	await get_tree().create_timer(0.5).timeout  # Wait for 0.1 seconds
	label.modulate = Color(1, 1, 1)  # Reset to normal
	Engine.time_scale = 1.0
	Global.reset_game_state()
	get_tree().change_scene_to_file("res://Scenes/PerformanceIndex.tscn")
