extends Node

@onready var points_label: Label = %PointsLabel
@onready var pathFollow : PathFollow2D = $Path2D/PathFollow2D
@onready var player = get_node("../SceneObjects/CharacterBody2D")
#func _input(event):
	#if event.is_action_pressed("right"):
		#pathFollow.progress_ratio += 0.05


func _process(delta):
	if Input.is_action_pressed("right"):
		if player.velocity[0] != 0:
			pathFollow.progress_ratio += 0.005
	#print("Velocity: ", player.velocity)
	if Input.is_action_pressed("left"):
		if player.velocity[0] != 0:
			pathFollow.progress_ratio -= 0.005

var points = 0

func add_point():
	points += 1
	print(points)
	points_label.text = "Points: " + str(points)
