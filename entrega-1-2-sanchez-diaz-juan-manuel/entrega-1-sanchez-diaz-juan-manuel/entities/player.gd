extends Sprite

export (float) var speed: float = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction: int = int(Input.is_action_pressed("move_der")) - int(Input.is_action_pressed("move_izq"))
	
	position.x += direction * speed * delta
