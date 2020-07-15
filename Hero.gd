extends Sprite

var gameWidth: int = OS.get_window_size().x
var gameHeight: int = OS.get_window_size().y
var spriteWidth: int = get_texture().get_width()
var spriteHeight: int = get_texture().get_height()
var halfSpriteHeight: int = spriteHeight / 2
var halfSpriteWidth: int = spriteWidth / 2
export var currentSpeed: float = 1000.0


# Limits
var lowerLimit: int = gameHeight - halfSpriteHeight
var upperLimit: int = 0 + halfSpriteHeight
var leftLimit: int = 0 + halfSpriteWidth
var rightLimit: int = gameWidth - halfSpriteWidth

var deltaCopy: float

func _enter_tree():
	positionMiddle()

func _physics_process(delta: float) -> void:
	deltaCopy = delta


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_D:
			moveRight(deltaCopy)
		
		if event.pressed and event.scancode == KEY_A:
			moveLeft(deltaCopy)
		
		if event.pressed and event.scancode == KEY_W:
			moveUp(deltaCopy)
		
		if event.pressed and event.scancode == KEY_S:
			moveDown(deltaCopy)
	

func moveRight(delta: float) -> void:
	if position.x < rightLimit:
		position.x += currentSpeed * delta
	if position.x > rightLimit:
		position.x = rightLimit

func moveLeft(delta: float) -> void:
	if position.x > leftLimit:
		position.x -= currentSpeed * delta
	if position.x < leftLimit:
		position.x = leftLimit

func moveUp(delta: float) -> void:
	if position.y > upperLimit:
		position.y -= currentSpeed * delta
	if position.y < upperLimit:
		position.y = upperLimit

func moveDown(delta: float) -> void:
	if position.y < lowerLimit:
		position.y += currentSpeed * delta
	if position.y > lowerLimit:
		position.y = lowerLimit




func positionMiddle() -> void:
	self.position.x = gameWidth / 2
	self.position.y = gameHeight / 2
