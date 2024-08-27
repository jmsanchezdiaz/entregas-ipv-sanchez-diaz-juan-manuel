extends Sprite

onready var cannon: Sprite = $Cannon

export (float) var H_SPEED_LIMIT: float
export (float) var FRICTION_WEIGHT: float
export (float) var ACCELERATION: float

var velocity = Vector2.ZERO

func set_projectile_container(container: Node):
	cannon.projectile_container = container

func _physics_process(delta):
	var mouse_position: Vector2 = get_global_mouse_position()
	
	cannon.look_at(mouse_position)

	if Input.is_action_just_pressed("fire"):
		cannon.fire()

	var h_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if h_direction != 0:
		velocity.x = clamp(velocity.x + (h_direction * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)
	else:
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0	
	
	position += velocity * delta
