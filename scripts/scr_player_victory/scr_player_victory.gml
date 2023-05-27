function scr_player_victory()
{
	hsp = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	machhitAnim = 0
	global.heattime = 60
	if (place_meeting(x, y, obj_keydoor) or place_meeting(x, y, obj_geromedoor))
		sprite_index = spr_victory
	if place_meeting(x, y, obj_startgate) or place_meeting(x, y, obj_arcademachinesmip)
		sprite_index = spr_entergate
	if (floor(image_index) == (image_number - 1))
		image_speed = 0
	else
		image_speed = 0.35
	var _a = instance_place(x, y, obj_startgate)
	var _b = instance_place(x, y, obj_arcademachinesmip)
	if _a != -4 {
		x = lerp(x, ((_a.x - _a.sprite_xoffset) + _a.sprite_width / 2), 0.05)	
		//y = lerp(y, (_a.y - (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index))), 0.05)		
	}
	else if _b != -4 {
		x = lerp(x, ((_b.x - _b.sprite_xoffset) + _b.sprite_width / 2), 0.05)	
	}
		
	exit;
}

