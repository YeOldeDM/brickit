extends StaticBody2D

export(int) var hp = 10
export(int) var xp = 1

func kill():
	GLOBAL.score += self.xp   #Score == XP for now?!
	queue_free()

func get_hit( damage ):
	self.hp -= damage
	if self.hp <= 0:
		kill()


