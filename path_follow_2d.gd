extends PathFollow2D

@export var velocidade: float = 150.0
var mudou_arte: bool = false

func _process(delta: float):

	progress += velocidade * delta
	
	if progress_ratio >= 0.7 and not mudou_arte:
		mudar_comportamento()
		mudou_arte = true

	if progress_ratio >= 1.0:
		queue_free()

func mudar_comportamento():
	$AnimatedSprite2D.animation = "up"
	
	if has_node("AnimationPlayer"):
		$AnimationPlayer.play("up")
