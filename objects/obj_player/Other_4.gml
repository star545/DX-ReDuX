savedhallwaydirection = hallwaydirection
savedhallway = hallway
savedvhallwaydirection = vhallwaydirection
savedverticalhallway = verticalhallway
ghost_pepper = 0
with (obj_secretportal)
{
	if secret
	{
		if (!instance_exists(obj_ghostcollectibles))
		{
			instance_create(0, 0, obj_ghostcollectibles)
			trace(instance_number(obj_ghostcollectibles))
		}
	}
}
if room == tower_1 && !global.panic && lastroom == tower_arenatutorial {
	global.fuel = 5
	global.bullets = 5
	global.score = 0
	global.combo = 0
	global.comboscore = 0
	
}
if (!is_bossroom())
	hitstunned = 0

if (state == states.comingoutdoor && global.coop == true && (!(place_meeting(x, y, obj_exitgate))))
{
	if (object_index == obj_player1 && obj_player1.spotlight == 0)
		visible = false
	if (object_index == obj_player2 && obj_player1.spotlight == 1)
		visible = false
}
if (global.coop == true)
{
	scr_changetoppings()
	if (!instance_exists(obj_cooppointer))
		instance_create(x, y, obj_cooppointer)
	if (!instance_exists(obj_coopflag))
		instance_create(x, y, obj_coopflag)
}
if (state == states.grab)
	state = states.normal
if (place_meeting(x, y, obj_boxofpizza) or place_meeting(x, (y - 1), obj_boxofpizza))
{
	box = 1
	hallway = 0
	state = states.crouch
}
if (object_index != obj_player2 or global.coop == true)
{
	var _dr = obj_doorA
	with par_doortrig {
		if doorID == other.targetDoor _dr = id
	}
	if _dr != -4 && instance_exists(_dr) {
		if hallway x = _dr.x + (hallwaydirection * 100)
		else if box x = _dr.x + 32
		else x = _dr.x + 16
		y = _dr.y - 14
	}
}
if verticalhallway
{
	verticalbuffer = 2
	var _vinst = noone
	with (obj_verticalhallway)
	{
		event_perform(ev_other, ev_room_start)
		if (targetDoor == other.targetDoor)
			_vinst = id
	}
	if (_vinst != noone)
	{
		x = (_vinst.x + (_vinst.sprite_width * vertical_x))
		var bbox_size = abs((bbox_right - bbox_left))
		x = clamp(x, (_vinst.x + bbox_size), (_vinst.bbox_right - bbox_size))
		trace(x, _vinst.x)
		if (vhallwaydirection > 0)
			y = (_vinst.bbox_bottom + 50)
		else
			y = (_vinst.bbox_top - 78)
		if (verticalstate == states.climbwall)
			state = states.climbwall
		if (state == states.climbwall)
		{
			x = round(x)
			var i = 0
			while (!(scr_solid((x + xscale), y)))
			{
				x += xscale
				trace(x)
				i++
				if (i > room_width)
					break
				else
					continue
			}
		}
		y += verticalhall_vsp
		vsp = verticalhall_vsp
	}
	y += (vhallwaydirection * 50)
	y = floor(y)
	verticalstate = states.normal
}




if (character == characters.pepperman && place_meeting(x, y, obj_boxofpizza))
{
	while place_meeting(x, y, obj_boxofpizza)
	{
		var _inst = instance_place(x, y, obj_boxofpizza)
		y -= _inst.image_yscale
	}
}
if (state == states.taxi)
{
	x = obj_stopsign.x
	y = obj_stopsign.y
}
if object_index == obj_player1 {
	with obj_pizzaface {
		x = other.x
		y = other.y
		if other.hallway x += other.hallwaydirection * -250
		else if other.verticalhallway y += other.vhallwaydirection * -400
		else image_alpha = 0
	
	}
}
hallway = 0
verticalhallway = 0
box = 0
if isgustavo
	brick = 1
	
if global.exitlevel && is_hub()
{
	global.resetlevel = 0
	scr_playerreset()
	scr_flush_texgroups(global.textures_saved)
	if backtohubroom != -4 && room == backtohubroom && room != tower_entrancehall
	{
		trace("Sent to Hub")
		x = backtohubstartx
		y = backtohubstarty 
		while place_meeting_collision(x, y)
			y--
		if !global.levelcomplete {
			instance_create(x, y - 900, obj_exitlevel_pep)
			state = states.actor
			visible = false
		} else {
			state = states.comingoutdoor	
			
			
		}
		
		
	}
	backtohubroom = -4
	global.exitlevel = 0
	global.levelcomplete = 0
}	
	
if place_meeting(x, y, obj_exitgate)
{
	with (instance_place(x, y, obj_exitgate))
		other.x = x
	state = states.comingoutdoor	
}
if (room == rank_room)
{
	x = rankpos_x
	y = rankpos_y
}
roomstartx = x
roomstarty = y
