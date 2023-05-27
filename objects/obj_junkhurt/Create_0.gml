scr_collision_init()
ratgrabbed = 0
grabbed = 0
state = states.normal
hsp = 0
vsp = 0
grav = 0.5
flash = 1
unpickable = 0
hp = 0
grounded = true
state = 0
playerid = obj_player1
image_speed = 0
image_index = random_range(0, (image_number - 1))
var arr = [spr_junkdebris_glove, spr_junkdebris_smile, spr_junkdebris_trash, spr_junkdebris_mallet, spr_junkdebris_toilet, spr_null]

debris_num = arr[image_index]
mask_index = spr_player_mask
depth = -5
platformid = -4
hsp_carry = 0
vsp_carry = 0
thrown = false
use_collision = 1