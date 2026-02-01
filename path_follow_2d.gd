extends PathFollow2D

@export var velocidade: float = 190.0

var estado_atual := -1

func _process(delta):
	progress += velocidade * delta

	var novo_estado := calcular_estado()
	if novo_estado != estado_atual:
		estado_atual = novo_estado
		aplicar_animacao(estado_atual)

	if progress_ratio >= 1.0:
		queue_free()


func calcular_estado() -> int:
	if progress_ratio < 0.33:
		return 0
	elif progress_ratio < 0.76:
		return 1
	else:
		return 2


func aplicar_animacao(estado: int) -> void:
	match estado:
		0:
			$anisold.play("down")
		1:
			$anisold.play("anda")
		2:
			$anisold.play("up")
