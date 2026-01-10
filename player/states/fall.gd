class_name PlayerStateFall extends PlayerState
@export var fall_grav_mult : float = 1.165
@export var coyote_time : float = 0.1
@export var jump_buffer_t: float = 0.2

var coyote_timer : float = 0
var buffer_timer : float = 0


# -> void: es wird keine ausgabe erwartet
func init() -> void: # jegliche referenzen,variablen abrufen
	pass

func enter() -> void: # was passiert wenn state betreten
	#animation abspielen
	player.gravity_mult = fall_grav_mult # gravitation des spielers erhöhen
	if player.previous_state == jump: # verhindern c.t., wenn vorh. state jump 
		coyote_timer = 0
	else: 
		coyote_timer = coyote_time #coyote timer auf time setzen
	pass

func exit() -> void: # was passiert wenn state verlassen
	player.gravity_mult = 1 # gravitation des spielers zurücksetzen
	pass


func handle_input( event : InputEvent ) -> PlayerState: # was passiert wenn input gedrückt/losgelassen wird
	if event.is_action_pressed("jump"):
		if coyote_timer > 0: # wenn c.t. "verfügbar", springen
			return jump
		else:
			buffer_timer = jump_buffer_t #buffer timer auf time setzen
	return next_state

func process( delta: float) -> PlayerState: # was jeden tick passiert
	coyote_timer -= delta
	buffer_timer -= delta
	return next_state

func physics_process(_delta: float) -> PlayerState: # was jeden physics-tick passiert
	if player.is_on_floor(): # wenn spieler auf boden ist, zu idle zurückkehren
		player.add_debug_ind() # debug indicator hinzufügen
		if buffer_timer > 0: # # wenn b.t. "verfügbar", springen
			return jump
		return idle
	player.velocity.x = player.direction.x * player.move_speed
	return next_state
