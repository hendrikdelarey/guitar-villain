extends Spatial

var green_mat = preload("res://Note/Green_Beam_Mat.tres")
var red_mat = preload("res://Note/Red_Beam_Mat.tres")
var yellow_mat = preload("res://Note/Yellow_Beam_Mat.tres")

var line

func set_material(line):
	match line:
		1:
			$MeshInstance.material_override = green_mat
		2:
			$MeshInstance.material_override = red_mat
		3:
			$MeshInstance.material_override = yellow_mat
