extends Sprite2D

@export var frames: Array[Texture2D]

var index := 0
var time := 0.0

func _ready():
	texture = frames[0]

func _process(delta):
	time += delta
	if time >= 0.3:
		time = 0.0
		index = (index + 1) % frames.size()
		texture = frames[index]
