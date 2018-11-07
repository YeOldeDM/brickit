extends Control

onready var hp_bar = $HP
onready var mp_bar = $MP
onready var xp_bar = $XP

onready var level_label = $Level


# Called by start()
# Kickstart all the global setters after connecting their signals to this UI
func bootstrap():
	GLOBAL.max_hp = GLOBAL.max_hp # set max values first as to not overload the bar.
	GLOBAL.hp = GLOBAL.hp
	
	GLOBAL.max_mp = GLOBAL.max_mp # set max values first as to not overload the bar.
	GLOBAL.mp = GLOBAL.mp
	
	GLOBAL.level = GLOBAL.level # this might set "max_xp" so call before xp.
	GLOBAL.xp = GLOBAL.xp
	


# Call after GLOBAL.load_player()
func start():
	GLOBAL.connect("max_hp_changed", self, "_on_max_hp_changed")
	GLOBAL.connect("hp_changed", self, "_on_hp_changed")
	
	GLOBAL.connect("max_mp_changed", self, "_on_max_mp_changed")
	GLOBAL.connect("hp_changed", self, "_on_mp_changed")
	
	GLOBAL.connect("level_changed", self, "_level_changed")
	GLOBAL.connect("xp_changed", self, "_on_xp_changed")
	
	call_deferred("bootstrap")


# SIGNAL CALLBACKS

func _on_hp_changed(to):
	hp_bar.value = to

func _on_max_hp_changed(to):
	hp_bar.max_value = to

func _on_mp_changed(to):
	mp_bar.value = to

func _on_max_mp_changed(to):
	mp_bar.max_value = to

func _on_xp_changed(to):
	xp_bar.value = to

func _on_level_changed(to):
	level_label = str(to)




