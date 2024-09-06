extends Node2D

export (PackedScene) var turret_scene
export (float) var SPAWN_RANGE: float = 200.0

func _ready():
	for i in 3:
		var turret_instance = turret_scene.instance()
		var turret_pos:Vector2 = Vector2(rand_range(global_position.x- SPAWN_RANGE, global_position.x + SPAWN_RANGE), rand_range(global_position.y +SPAWN_RANGE, global_position.y - SPAWN_RANGE))
		turret_instance.initialize(self, turret_pos, self)
