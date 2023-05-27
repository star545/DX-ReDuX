
wave = [
[0, states.arena_all, [obj_cheeseslime]],
]
enemy_array = []
enemlimit = 2
prevROUND = -99
max_wave_array = 0
scripted_count = 0
random_arr = []
enemyID = -4
buffer = 0
activeat = 0 
manualintensity = 0
disableat = -4
image_speed = 0
visible = false
enemy_arr = -4
state = states.normal

with (instance_create(x, y, obj_objecticontracker))
{
	objectID = other.id
	sprite_index = spr_johnicon
}
/* Indigo put this in creation codes 

wave = [
[0, states.arena_all, [obj_cheeseslime,obj_cheeseslime,obj_cheeseslime ]],
[3, states.arena_rand, [obj_pepgoblin, obj_cheeseslime, obj_pepgoblin, obj_cheeseslime, obj_pepgoblin, obj_cheeseslime]],
[6, states.arena_rand, [obj_forknight, obj_fencer, obj_ancho, obj_forknight, obj_fencer, obj_ancho,]],
[9, states.arena_rand, [obj_forknight, obj_fencer, obj_pepgoblin, obj_ancho, obj_minijohn, obj_cheeseslime]],
[12, states.arena_rand, [obj_indiancheese, obj_farmerbaddie, obj_farmerbaddie2, obj_indiancheese, obj_farmerbaddie, obj_farmerbaddie2,]],
[15, states.arena_rand, [obj_pepperwitch, obj_pepbat, obj_soldier, obj_bazookabaddie, obj_badrat, obj_minijohn, obj_clownmato, obj_peppinoclone, obj_kentukybomber]],
]