extends Spatial

var green_mat = preload("res://Green_Note_Mat.tres")
var red_mat = preload("res://Red_Note_Mat.tres")
var yellow_mat = preload("res://Yellow_Note_Mat.tres")

export(int, 1, 3) var line
var position = 0

var is_pressed = false
var is_colliding = false
var is_collected = false
var picker

func _ready():
	set_material()
	set_position()

func _process(delta):
	collect()

func set_material():
	match line:
		1:
			$MeshInstance.material_override = green_mat
		2:
			$MeshInstance.material_override = red_mat
		3:
			$MeshInstance.material_override = yellow_mat

func set_position():
	var x = 0
	match line:
		1:
			x = -1
		2:
			x = 0
		3:
			x = 1
	
	self.translation = Vector3(x, 0, -position)

func collect():
	if not is_collected and is_colliding and picker:
		if picker.is_collecting:
			is_collected = true
			picker.is_collecting = false
			note_hit()

func _on_area_entered(area):
	if area.is_in_group("picker"):
		is_colliding = true
		picker = area.get_parent()


func _on_area_exited(area):
	if area.is_in_group("picker"):
		if not is_collected:
			missed_note()
		is_colliding = false

func missed_note():
	print_debug("Missed hit!")

func note_hit():
	hide()
	print_debug("Note hit!")
	
