extends Node


@onready var points_label: Label = %PointsLabel
@onready var player = get_node("../SceneObjects/CharacterBody2D")
@onready var camera = get_node("../SceneObjects/MovingCamera")
@onready var y_pos = player.position.y;

func _process(delta):
	#print("Player y Vel: ",player.velocity.y)
	print("Player y Pos: ", player.position.y)
	print("Camera y Pos: ", camera.position.y)
	if player.position.y < 576 and player.position.y > 575:
		camera.position.y = 405
	#var direction: Vector2 = Input.get_vector("left","right","jump","down");
	if player.is_on_floor():
		y_pos = player.position.y;
		#camera.position.y = -400;
		
	if not player.is_on_floor():
		if player.position.y > y_pos or player.position.y < y_pos:
			camera.position.y += player.velocity.y/100;
			if camera.position.y >= 405: 
				camera.position.y = 405
	
	if Input.is_action_pressed("right"):
		#print("Character X Position: ",player.position.x);
		#print("Camera X Position:    ",camera.position.x);
		#print("Character Y Position: ",player.position.y);
		#print("Camera Y Position:    ",camera.position.y);
		if player.position.x < 2147 && player.position.x > 520:
			if player.velocity[0] != 0:
			#var direction: Vector2 = Input.get_vector("left","right","up","down");
				camera.position.x = player.get_position()[0] - 80;
			
	if Input.is_action_pressed("left"):
		#print("Character X Position: ",player.position.x);
		#print("Camera X Position:    ",camera.position.x);
		#print("Character Y Position: ",player.position.y);
		#print("Camera Y Position:    ",camera.position.y);
		if player.velocity[0] != 0:
			if player.position.x > 520 && player.position.x < 2147:
				camera.position.x = player.get_position()[0] - 80;

var points = 0

func add_point():
	points += 1
	print(points)
	points_label.text = "Points: " + str(points)
