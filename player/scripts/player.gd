class_name Player extends CharacterBody2D # erweitert/baut auf bereits existierende klasse 
 
func _process(_delta: float) -> void: #erstellen "dauerschleife"
	
	pass

func _physics_process(_delta: float) -> void: #erstellen "dauerschleife" für physik  
	velocity.x = 0 							#basiswert stillstehen
	if Input.is_action_pressed("left"):		#nach links bewegen
		velocity.x = -100
	elif Input.is_action_pressed("right"):	#nach rechts bewegen
			velocity.x = 100
	velocity.y = velocity.y + 981 * _delta
	if Input.is_action_pressed("jump"):
		velocity.y = -100
	move_and_slide()
	pass
