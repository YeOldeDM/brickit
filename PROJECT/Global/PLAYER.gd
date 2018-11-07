extends Node

const PLAYER_FILE = "user://PLAYER"

const XP_BASE = 100
const XP_MULT = 25

# SIGNALS
signal hp_changed(to)
signal max_hp_changed(to)

signal mp_changed(to)
signal max_mp_changed(to)

signal level(to)
signal xp_changed(to)

signal gold_changed(to)

# MEMBERS
var hp = 100 setget _set_hp
var max_hp = 100 setget _set_max_hp

var mp = 50 setget _set_mp
var max_mp = 50 setget _set_max_mp

var level = 1 setget _set_level
var xp = 0 setget _set_xp

var gold = 0 setget _set_gold



func get_xp_to_level( level ):
	if level == 1:
		return 0
	elif level == 2:
		return XP_BASE
	else:
		var ml = level - 1
		var x = XP_BASE
		for i in ml:
			x += XP_MULT * i
		return x

# SETTERS
func _set_hp(to):
	hp = to
	emit_signal("hp_changed",to)

func _set_max_hp(to):
	max_hp = to
	emit_signal("max_hp_changed",to)

func _set_mp(to):
	mp = to
	emit_signal("mp_changed",to)

func _set_max_mp(to):
	max_mp = to
	emit_signal("max_mp_changed",to)

func _set_level(to):
	level = to
	emit_signal("level_changed",to)

func _set_xp(to):
	xp = to
	emit_signal("xp_changed",to)

func _set_gold(to):
	gold = to
	emit_signal("gold_changed",to)

# SAVE/LOAD

func save_player():
	var file = File.new()
	var opened = file.open( PLAYER_FILE, File.WRITE )
	if opened != OK:
		print("\nCOULDN'T OPEN PLAYER FILE AT ", PLAYER_FILE,"\n")
		return opened

	var data = {
		"hp": hp,
		"max_hp": max_hp,
		"mp": mp,
		"max_mp": max_mp,
		"level": level,
		"xp": xp,
		"gold": gold,
	}
	
	file.store_line( to_json( data ) )
	
	print("\nPLAYER FILE SAVED!!\n")
	file.close()
	return opened

func load_player():
	var file = File.new()
	var opened = file.open( PLAYER_FILE, File.READ )
	if opened != OK:
		print("\nCOULDN'T OPEN PLAYER FILE AT ", PLAYER_FILE,"\n")
		return opened
	
	var data = parse_json( file.get_line() )
	
	if "max_hp" in data:
		max_hp = data.max_hp
	if "hp" in data:
		hp = data.hp
	if "mp" in data:
		mp = mp
	if "max_mp" in data:
		max_mp = data.max_mp
	
	if "level" in data:
		level = data.level
	if "xp" in data:
		xp = data.xp
	
	if "gold" in data:
		gold = data.gold
	
	print("\nPLAYER FILE LOADED!!\n")
	file.close()
	return opened
	
	
