extends Node

func _ready():
	$Player.set_projectile_container(self)
	$Turret1.initialize($Player, self)
	$Turret2.initialize($Player, self)
	$Turret3.initialize($Player, self)
