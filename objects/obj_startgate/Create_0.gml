score_array = []
snd_rumble = -4
gate_id = "normal"
y_crop = sprite_height
treasure_spr = spr_treasure
treasure_index = 0
closed = global.panic
state = states.normal
mode = 0
can_proceed = 0
showing_score = false
ease_frame = 0
targetDoor = "A"
targetRoom = LoadLevelRoom
arena = 0
depth = 50
rank_as_num = 0
tex_groups = -4
death_as_num = 0
level = "none"
world = 1
drawing = 0
msg = "UNDEFINED"
highscore = 0
death_highscore = 0
rank = 0
death_rank = 0
best_time = 0
death_time = 0
has_treasure = 0
secret_count = 0
toppin = array_create(5, 0)
surf = noone
scr_input_init()

bg_x = array_create(10)
bg_xscroll = [0.33, 0.66, 1, 0, 0, 0, 0, 0, 0, 0]
bg_y = array_create(10)
bg_yscroll = array_create(10, 0)


function gate_createlayer(sprite, index, xscroll = 0, yscroll = 0, imgspd = 0) {
	return {
		sprite_index : sprite,
		image_index : index,
		image_xscale : 1,
		image_yscale : 1,
		image_speed : imgspd,
		image_alpha : 1,
		image_blend : c_white,
		image_angle : 0,
		x : 0,
		y : 0,
		hspeed : xscroll,
		vspeed : yscroll,
		func : -4
	}
}


show_fade = 1
details = [
gate_createlayer(spr_entrancegate, get_level_pct("entrance") == 100 ? sprite_get_number(spr_entrancegate) - 1 : 0),
gate_createlayer(spr_entrancegate, 1),
gate_createlayer(spr_entrancegate, 2, 1),
gate_createlayer(spr_entrancegate, 3, 0.66),
gate_createlayer(spr_entrancegate, 4, 0.33),
]

