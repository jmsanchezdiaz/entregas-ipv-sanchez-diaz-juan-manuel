extends Sprite

onready var fire_position: Position2D = $FirePosition

export (PackedScene) var projectile_scene: PackedScene

var projectile_container: Node

func fire():
	var projectile: Projectile = projectile_scene.instance()
	var direction: Vector2 = fire_position.global_position - global_position
	projectile_container.add_child(projectile)
	projectile.set_starting_values(
		fire_position.global_position,
		direction.normalized()
	)
	projectile.connect("delete_requested", self, "_on_Projectile_delete_requested")


func _on_Projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
