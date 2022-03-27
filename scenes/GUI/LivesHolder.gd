extends Control

var life_size = 80


func on_change_life(player_health):
	$lifes.rect_size.x = player_health * life_size
