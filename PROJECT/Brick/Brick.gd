extends StaticBody2D

export(int) var hp = 10
export(int) var xp = 1
export(String) var type = ""

func _ready():
	if type == "Goblin":
		Goblin()
	elif type == "Bat":
		Bat()
	else:
		Troll()


func kill():
	GLOBAL.score += self.xp   #Score == XP for now?!
	queue_free()

func get_hit( damage ):
	self.hp -= damage
	if self.hp <= 0:
		kill()

func Goblin():
	print("im goblin")
	
func Bat():
	print("im a bat")
	
func Troll():
	print("im a troll");
