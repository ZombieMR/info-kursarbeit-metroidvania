class_name PlayerStateRun extends PlayerState


# -> void: es wird keine ausgabe erwartet
func init() -> void: # jegliche referenzen,variablen abrufen
	pass

func enter() -> void: # was passiert wenn state betreten
	# animation abspielen
	pass

func exit() -> void: # was passiert wenn state verlassen
	pass


func handle_input( event : InputEvent ) -> PlayerState: # was passiert wenn input gedrückt/losgelassen wird		
	return next_state

func process(delta: float) -> PlayerState: # was jeden tick passiert
	if player.direction.x == 0:
		return idle
	#elif player.direction.y < 0:
	#	return jump
	return next_state

func physics_process(delta: float) -> PlayerState: # was jeden physics-tick passiert
	player.velocity.x = player.direction.x * player.bewegungsgeschwindigkeit 
	return next_state
