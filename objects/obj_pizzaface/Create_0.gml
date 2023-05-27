scr_collision_init()
scr_initenemy()
walkspr = spr_pizzaface_angry
idlespr = spr_pizzaface_angry
stunfallspr = spr_pizzaface_stun
scaredspr = spr_pizzaface_dead
spr_dead = spr_pizzaface_dead
grabbedspr = spr_pizzaface_angry
elite = 0
panic = 0
grav = 0.5
destroyable = true
escape = 0
maxspeed = 8
spd = 0
saved_angle = 0
afterimg = 0
flash = false
end_turn = 0
state = states.chase

image_speed = 0.35
depth = -50
x = obj_player1.x
y = obj_player1.y
alarm[1] = 10
image_alpha = 0
if global.death_mode {
	sprite_index = spr_pizzaface_docile
	with (instance_create(x, y, obj_objecticontracker))
	{
		objectID = other.id
		sprite_index = spr_pizzafaceicon
	}	
	destroyable = false
	
}