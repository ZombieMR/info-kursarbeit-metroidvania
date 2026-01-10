class_name PlayerState extends Node

##vorlage state-skripte


#aufsetzen variablen
var player : Player 
var next_state : PlayerState

#region state referenzen
#referenz zu jeglichen states
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall

#endregion

# -> void: es wird keine ausgabe erwartet
func init() -> void: # was passiert wenn state initiiert
	pass

func enter() -> void: # was passiert wenn state betreten
	pass

func exit() -> void: # was passiert wenn state verlassen
	pass


func handle_input(event : InputEvent) -> PlayerState: # was passiert wenn input gedrückt/losgelassen wird
	return next_state

func process(_delta: float) -> PlayerState: # was jeden tick passiert
	return next_state

func physics_process(_delta: float) -> PlayerState: # was jeden physics-tick passiert
	return next_state
