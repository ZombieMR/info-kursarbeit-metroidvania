class_name Player extends CharacterBody2D # erweitert/baut auf bereits existierende klasse 
 

#region export-variablen
@export var bewegungsgeschwindigkeit: float = 150
#endregion


#region state machine variablen
var states : Array[PlayerState]
var current_state : PlayerState : 
	get : return states[0]
var previous_state : PlayerState : 
	get : return states[1]
#endregion

#region standart-variablen
var direction : Vector2 = Vector2(0, 0)
var gravity : float = 981
#endregion


func _ready() -> void:
	initialize_states() # funktion: alle states initiieren
	pass

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))

func _process(_delta: float) -> void: #erstellen "dauerschleife"
	update_direction()
	change_state(current_state.process(_delta))
	pass

func _physics_process(_delta: float) -> void: #erstellen physik-"dauerschleife"
	velocity.y += gravity * _delta
	move_and_slide()
	change_state(current_state.physics_process(_delta))
	pass


func initialize_states() -> void: 
	states = []
	for i in $States.get_children(): #alle states sammeln
		if i is PlayerState: 
			states.append(i) 
			i.player = self
		pass 
	if states.size() == 0: # falls state versagt,  funktion beenden
		return
	for state in states:# alle states initiieren
		state.init()
	change_state(current_state) # ersten state setzen
	current_state.enter()
	$Label.text = current_state.name

	pass

func change_state(new_state : PlayerState) -> void: # state ändern
	if new_state == null: # .. nicht wenn neuer state nicht vorhanden
		return
	elif new_state == current_state: # .. nicht wenn neuer gleich aktueller state 
		return
	if current_state: # aktuellen state beenden
		current_state.exit()
	
	states.push_front(new_state) # state zu neuem ändern, alte nach hinten verschieben
	current_state.enter()
	states.resize(3) # nur letzten 3 vergangenen states in liste speichern
	$Label.text = current_state.name
	pass
func update_direction() ->  void: # bewegungsvektor richtung ändern
	#var prev_direction : Vector2 = direction
	# fix deadzones controller
	var x_axis = Input.get_axis("left", "right")
	var y_axis = Input.get_axis("up", "down")
	direction = Vector2(x_axis, y_axis)
	pass
