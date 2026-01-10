class_name PlayerStateRun extends PlayerState


# -> void: es wird keine ausgabe erwartet
func init() -> void: # was passiert wenn state initiiert
	pass

func enter() -> void: # was passiert wenn state betreten
	# animation abspielen
	pass

func exit() -> void: # was passiert wenn state verlassen
	pass


func handle_input( event : InputEvent ) -> PlayerState: # was passiert wenn input gedrückt/losgelassen wird		
	if event.is_action_pressed("jump"):
		return jump
	return next_state

func process(_delta: float) -> PlayerState: # was jeden tick passiert
	if player.direction.x == 0:
		return idle
	return next_state

func physics_process(_delta: float) -> PlayerState: # was jeden physics-tick passiert
	player.velocity.x = player.direction.x * player.move_speed 
	if player.is_on_floor() == false: # abischerung: wenn spieler nicht auf boden, zu fall wechseln
		return fall
	return next_state
