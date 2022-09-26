extends Node2D

var Player = preload("res://Scenes/Objects/Player Controled/Player.tscn")
var MobileJoyStick = preload("res://Scenes/Controls/MobileJoyStick.tscn")

func add_Player_to_BaseLevel():
	var Player_instance = Player.instance()
	get_tree().get_root().add_child(Player_instance)
	
	Player_instance.global_transform = global_transform
