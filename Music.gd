extends Spatial

var audio = preload("res://Ill System - Rock Bottom.ogg")

onready var player = $AudioStreamPlayer3D

var speed
var started = false
var pre_start_duration
var start_pos_in_sec

func setup(game):
	player.stream = game.audio
	
	speed = game.speed
	started = false
	pre_start_duration = game.bar_length
	start_pos_in_sec = game.start_pos_in_sec

func start():
	started = true
	player.play(start_pos_in_sec)

func _process(delta):
	if not started:
		pre_start_duration -= speed*delta
		if pre_start_duration <= 0:
			start()
			return
