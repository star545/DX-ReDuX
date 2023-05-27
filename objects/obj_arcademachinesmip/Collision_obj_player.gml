

with (obj_player1)
{
	if (place_meeting(x, y, other) && key_up && !other.closed && grounded && (state == states.normal or state == states.mach1 or state == states.mach2 or state == states.mach3 || state == states.mariowalk) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.victory && state != states.comingoutdoor && obj_player1.spotlight == 1)
	{
		//audio_stop_all()
		audio_sound_gain(global.music, 0, 1700)
		global.leveltosave = other.level
		global.leveltorestart = other.targetRoom
		global.levelreset = 0
		global.resetlevel = 0
		global.exitlevel = false
		global.levelname = other.msg
		global.textures_saved = other.tex_groups
		scr_load_texgroups(global.textures_saved)
		if other.rank != -4 && !other.arena other.state = states.options
		else other.can_proceed = 1
		backtohubstartx = ((other.x - other.sprite_xoffset) + other.sprite_width / 2)
		backtohubstarty = other.y
		backtohubroom = room
		mach2 = 0
		obj_camera.chargecamera = 0
		image_index = 0
		state = states.victory
		obj_player2.backtohubstartx = x
		obj_player2.backtohubstarty = y
		obj_player2.backtohubroom = room
		if (global.coop == true)
		{
			with (obj_player2)
			{
				x = obj_player1.x
				y = obj_player1.y
				mach2 = 0
				obj_camera.chargecamera = 0
				image_index = 0
				state = states.victory
			}
		}
	}
}

var _end = 0
with obj_player1 if anim_end() _end = true
if obj_player1.state == states.victory && _end && can_proceed
{
	with (obj_player)
	{
		if (other.level == "snickchallenge")
		{
			global.wave = 0
			global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
			if global.panicbg
				scr_panicbg_init()
			global.snickchallenge = 1
			global.collect = 10000
			with (obj_camera)
			{
				global.panic = true
				global.fill = time_in_frames(10, 0)
			}
		}
		obj_music.fadeoff = 0
		//audio_sound_gain(global.music, (0.6 * global.option_music_volume), 0)
		targetDoor = "A"
		targetRoom = other.targetRoom
		if (!instance_exists(obj_fadeout))
			with instance_create(x, y, obj_fadeout) music_to_normal = true
		obj_tv.promptappear = false
		global.death_mode = other.mode
		if global.death_mode {
			global.laps = 3
			instance_create(x, y, obj_deathmode)
			
			
		}
	}
}

if !closed && state == states.normal || state == states.options scr_controlprompt("[spr_promptfont]" + msg, -1)
