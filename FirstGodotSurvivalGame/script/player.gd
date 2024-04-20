extends CharacterBody2D

var speed = 100
var player_state

@export var inv:Inv

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	else:
		player_state = "walking"

	velocity = direction.normalized() * speed
	move_and_slide()

	play_anim(direction)

func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	elif player_state == "walking":
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				$AnimatedSprite2D.play("e-walk")
			else:
				$AnimatedSprite2D.play("w-walk")
		else:
			if dir.y > 0:
				$AnimatedSprite2D.play("s-walk")
			else:
				$AnimatedSprite2D.play("n-walk")
				
		# Diagonal movement animations
		if dir.x>0.5 and dir.y<-0.5:
			$AnimatedSprite2D.play("ne-walk")
		if dir.x>0.5 and dir.y>0.5:
			$AnimatedSprite2D.play("se-walk")
		if dir.x<-0.5 and dir.y<0.5:
			$AnimatedSprite2D.play("sw-walk")
		if dir.x<-0.5 and dir.y<-0.5:
			$AnimatedSprite2D.play("nw-walk")

func player():
	pass

func collect(item):
	inv.insert(item)
	
