class_name PlayerStateJump extends PlayerState


# -> void: es wird keine ausgabe erwartet
func init() -> void: # jegliche referenzen,variablen abrufen
	pass

func enter() -> void: # was passiert wenn state betreten
	# animation abspielen
	pass

func exit() -> void: # was passiert wenn state verlassen
	pass


func handle_input( event : InputEvent ) -> PlayerState: # was passiert wenn input gedrückt/losgelassen wird		
	#Input.is_action_pressed("up")
	return next_state

func process(delta: float) -> PlayerState: # was jeden tick passiert
	if player.direction.x == 0 and player.direction.y == 0:
		return idle
	return next_state

func physics_process(delta: float) -> PlayerState: # was jeden physics-tick passiert
	player.velocity.y = player.direction.y * 100
	return next_state
