if state = states.portal {
	x = -50
	y = -50
	visible = false
	hsp = 0
	vsp = 0
	var p = instance_nearest(xstart, ystart, obj_player)
	if global.panic && !instance_exists(escapePortal) && distance_to_pos(xstart, ystart, p.x, p.y, 500, 100) {
		escapePortal = instance_create(xstart, ystart, obj_escapespawn);
		escapePortal.drawSprite = other.stunfallspr;
		escapePortal.drawXscale = image_xscale;
		escapePortal.spr_palette = spr_palette;
		escapePortal.paletteselect = paletteselect;			
	}
	if global.panic && instance_exists(escapePortal) && floor(escapePortal.image_index) >= 8 {
		x = xstart
		y = ystart
		visible = true
		state = states.stun
		stunned = 20
		boundbox = 0
		create_particle(x, y, particle.genericpoofeffect)
	}
	
}
else if (state == states.grabbed)
	scr_enemy_grabbed()
else if (state == states.lungeattack)
	scr_enemy_lungeattack()
else if (state == states.secret)
	scr_enemy_secret()
scr_squash()

var old_heat = local_heat_level
local_heat_level = use_heat()
if old_heat != local_heat_level {
	if local_heat_level baddie_heat_pal()
	else baddie_unheat_pal()
}



if (state != states.stun && state != states.hit)
	linethrown = false
	
if obj_player1.state != states.lungeattack && obj_player1.state != states.chainsaw && obj_player1.state != states.handstandjump	&& state != states.lungeattack && state != states.hit && lunged {
	lunged = false;
	trace("fellout")	
}

if shake_timer > 0
	shake_timer--

if (state == states.stun && (!thrown))
	linethrown = false
if (object_index != obj_pizzaball && object_index != obj_fakesanta && (place_meeting((x + 1), y, obj_spike) or place_meeting((x - 1), y, obj_spike) or place_meeting(x, (y + 1), obj_spike) or place_meeting(x, (y - 1), obj_spike)))
	instance_destroy()
if (state != states.grabbed && state != states.pummel && object_index != obj_pepbat && object_index != obj_ghoul && object_index != obj_ghost && object_index != obj_fakesanta && use_collision) {
	var go_down_slopes = (state == states.stun && (thrown || linethrown))
	scr_collision()
	
}
if (invtime > 0)
	invtime--
if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1) && object_index != obj_ghoul)
	create_particle((x - (image_xscale * 20)), (y + 43), particle.cloudeffect, 0)
if (state == states.walk)
	image_speed = (0.35)
else if (state != states.charge)
	image_speed = 0.35
if (dodgebuffer > 0)
	dodgebuffer--
if on_fire {
	fire_buffer--
	if fire_buffer mod 5 == 0 instance_create(x, y, obj_enemyflame)
	if fire_buffer <= 0 {
		fire_buffer = 20
		mortHP--
		flash = true
		if mortHP <= 0 {
			instance_destroy()
			create_particle(x, y, particle.genericpoofeffect)
			scr_soundeffect(sfx_punch)
		}
		
	}
	
}
	
with (instance_nearest(x, y, obj_player))
{
	if (state == states.backbreaker)
	{
		other.stunned = 0
		if (other.state != states.pizzagoblinthrow && (!other.provoked) && other.bombreset > 0)
		{
			other.bombreset = 0
			other.provoked = 1
		}
		other.scaredbuffer = 0
	}
	else if (other.state != states.pizzagoblinthrow)
		other.provoked = 0
}
if (y > (room_height + 100))
	instance_destroy()
if (thrown && (x > (room_width + 100) or x < -100 or y < -100))
	instance_destroy()

