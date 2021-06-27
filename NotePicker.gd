extends Spatial

var green_mat = preload("res://Note/Green_Picker_Mat.tres")
var red_mat = preload("res://Note/Red_Picker_Mat.tres")
var yellow_mat = preload("res://Note/Yellow_Picker_Mat.tres")

export(int, 1, 3) var line

var is_pressed = false
var is_collecting = false

func _ready():
	set_material()
	set_process_input(true)

func set_material():
	match line:
		1:
			$MeshInstance.material_override = green_mat
		2:
			$MeshInstance.material_override = red_mat
		3:
			$MeshInstance.material_override = yellow_mat

func _input(event):
	match line:
		1: 
			if event.is_action_pressed("ui_left"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_left"):
				is_pressed = false
				is_collecting = false
		2: 
			if event.is_action_pressed("ui_down"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_down"):
				is_pressed = false
				is_collecting = false
		3: 
			if event.is_action_pressed("ui_right"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_right"):
				is_pressed = false
				is_collecting = false

func _process(delta):
	if is_pressed:
		self.scale = Vector3(0.9, 0.9, 0.9)
	else:
		self.scale = Vector3(1, 1, 1)
