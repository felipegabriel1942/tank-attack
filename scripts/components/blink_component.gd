extends Node

#@export var sprite: Sprite2D
#@export var blink_duration: float = 0.5
#@export var blink_speed: float = 0.1

func blink(duration: float = 0.5, speed: float = 0.1, color := Color.BLACK, reset_color := Color.WHITE):
	_blink_children(self, duration, speed, color, reset_color)

# Função recursiva para aplicar o efeito de piscar a todos os Sprite2D
func _blink_children(node: Node, duration: float, speed: float, color: Color, reset_color: Color):
	print(node)
	
	if node is Sprite2D:
		print(node)  # Verifica se o nó atual é um Sprite2D
		var tween = node.create_tween()
		for i in range(int(duration / speed)):
			tween.tween_property(node, "modulate", color, speed / 2)
			tween.tween_property(node, "modulate", reset_color, speed / 2)
	
	# Chama recursivamente para todos os filhos do nó
	for child in node.get_children():
		print(children)
		_blink_children(child, duration, speed, color, reset_color)

# Exemplo de uso
func take_damage():
	blink(0.5, 0.1, Color.BLACK, Color.WHITE)
