extends Sprite
class_name Projectile

signal delete_requested(projectile)

export (float) var speed: float
var direction : Vector2

func set_starting_values(start_position: Vector2, move_direction: Vector2):
	self.direction = move_direction
	position = start_position
	$Timer.start()
	set_physics_process(true)

func _ready():
	set_physics_process(false)
	
func _physics_process(delta):
	position += direction * speed * delta
	
	var window_size = OS.window_size
	var outboundX = global_position.x < 0 or global_position.x > window_size.x
	var outboundY = global_position.y < 0 or global_position.y > window_size.y
	
	if outboundX or outboundY:
		emit_signal("delete_requested", self)


func _on_Timer_timeout():
	emit_signal("delete_requested", self)
