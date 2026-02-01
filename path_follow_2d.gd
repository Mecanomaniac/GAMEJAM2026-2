extends PathFollow2D

@export var velocidade: float = 150.0
var mudou_arte: bool = false 

func _process(delta: float):
	progress += velocidade * delta
	
	# Verifica se chegou no ponto de mudança (ex: 70% do caminho)
	if progress_ratio >= 0.7 and not mudou_arte:
		mudar_comportamento()
		mudou_arte = true
	
	if progress_ratio >= 1.0:
		queue_free()

func mudar_comportamento():
	# 1. Muda a cor para vermelho
	# O modulate funciona como um filtro de luz sobre a sua sprite
	$AnimatedSprite2D.modulate = Color(1, 0, 0) 
	
	# 2. Muda para a animação "up" que você criou no AnimationPlayer
	# Certifique-se de que o nome no play() seja igual ao nome na lista do AnimationPlayer
	if has_node("AnimationPlayer"):
		$AnimationPlayer.play("up")
	
	# Opcional: Se quiser que ele suba a escada mais devagar ou pare
	# velocidade = 50.0
