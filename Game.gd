extends Spatial

onready var music_node = $Music
onready var road_node = $Road

var audio
var audio_file = "res://Ill System - Rock Bottom.ogg"
var map_file = "res://Ill-System-Test.mboy"

var map
var tempo
var bar_length
var quarter_time
var speed
var note_scale
var start_pos_in_sec


# Called when the node enters the scene tree for the first time.
func _ready():
	audio = load(audio_file)
	map = load_map()
	calc_params()
	
	music_node.setup(self)
	road_node.setup(self)

func calc_params():
	tempo = map.tempo
	bar_length = 8
	quarter_time = 60/float(tempo)
	speed = bar_length/float(4*quarter_time)
	note_scale = bar_length/float(4*400)
	start_pos_in_sec = (float(map.start_pos)/400) * quarter_time

func load_map():
	var file = File.new()
	file.open(map_file, File.READ)
	var content = file.get_as_text()
	file.close()
	return JSON.parse(content).get_result()
