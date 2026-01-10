class_name PlayerStateJump extends PlayerState

@export var jump_velocity : float = 450



# -> void: es wird keine ausgabe erwartet
func init() -> void: # was passiert wenn state initiiert
	pass

func enter() -> void: # was passiert wenn state betreten
	#animation abspielen
	player.add_debug_ind(Color.GREEN)
	player.velocity.y = -jump_velocity
	pass

func exit() -> void: # was passiert wenn state verlassen
	player.add_debug_ind((Color.YELLOW)) # debug indicator (gelb) hinzufügen 
	pass


func handle_input(event : InputEvent) -> PlayerState: # was passiert wenn input gedrückt/losgelassen wird
	if event.is_action_released("jump"): # wenn spieler jump loslässt, zu fall wechseln
		player.velocity.y *= 0.5
		return fall
	return next_state

func process(_delta: float) -> PlayerState: # was jeden tick passiert

	return next_state

func physics_process(_delta: float) -> PlayerState: # was jeden physics-tick passiert
	if player.is_on_floor(): # wenn spieler auf boden ist, zu idle wechseln
		return idle
	elif player.velocity.y >= 0: # wenn spieler auf hochpunkt, zu fall wechseln
		return fall
	player.velocity.x = player.direction.x * player.move_speed
	return next_state
