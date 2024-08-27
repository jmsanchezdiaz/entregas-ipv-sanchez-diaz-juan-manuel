extends Sprite

onready var fire_position: Position2D = $FirePosition

var player

export (PackedScene) var projectile_scene: PackedScene

var projectile_container: Node 
	
func initialize(_player:Node, container: Node): 
	self.projectile_container = container
	self.player = _player
	$Timer.start()
	
func fire():
	var projectile: Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile)
	var direction = player.global_position - fire_position.global_position
	projectile.set_starting_values(fire_position.global_position, direction.normalized())
	projectile.connect("delete_requested", self, "_on_Projectile_delete_requested")

func _on_Timer_timeout():
	self.fire()
	
func _on_Projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
