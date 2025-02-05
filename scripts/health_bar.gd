extends ProgressBar

@export var health_component: HealthComponent

func _ready():
	self.max_value = health_component.max_health
	self.min_value = 0

func _process(delta):
	self.value = health_component.health
	if health_component.health != self.max_value:
		self.visible = true
		
		if health_component.health == self.min_value:
			self.visible = false
	else:
		self.visible = false
