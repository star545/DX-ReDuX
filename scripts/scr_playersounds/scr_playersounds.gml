function scr_playersounds()
{
	with (obj_player)
	{
		// Mach 1
		var _state = state == states.chainsaw ? tauntstoredstate : state
		
		if (state == states.mach1 || sprite_index == spr_mach1) && grounded && move != -xscale { 
			if !audio_is_playing(mach1snd) mach1snd = scr_soundeffect_loop(sfx_mach1)	
		}
		else if audio_is_playing(mach1snd) audio_stop_sound(mach1snd)
		
		// Mach 2 
		
		if (sprite_index == spr_mach || state == states.climbwall) { 
			if !audio_is_playing(mach2snd) mach2snd = scr_soundeffect_loop(sfx_mach2)	
		}
		else if audio_is_playing(mach2snd) audio_stop_sound(mach2snd)
		
		// Mach 3
		var gus_check_mach3 = ((state == states.ratmount || state == states.ratmountjump) && abs(hsp) >= 12 && brick)
		var gus_check_mach4 = ((state == states.ratmount || state == states.ratmountjump) && abs(hsp) >= 16 && brick)
		
		if (state == states.mach3 || gus_check_mach3 || sprite_index == spr_mach3boost || sprite_index == spr_player_jetpackdash) && sprite_index != spr_crazyrun && !gus_check_mach4 { 
			if !audio_is_playing(mach3snd) mach3snd = scr_soundeffect_loop(sfx_mach3)	
		}
		else if audio_is_playing(mach3snd) audio_stop_sound(mach3snd)
		
		// Mach 4

		if sprite_index == spr_crazyrun || gus_check_mach4 || state = states.rocket { 
			if !audio_is_playing(mach4snd) mach4snd = scr_soundeffect_loop(sfx_mach4)	
		}
		else if audio_is_playing(mach4snd) audio_stop_sound(mach4snd)

		if state == states.knightpepslopes && grounded { 
			if !audio_is_playing(knightslide) knightslide = scr_soundeffect_loop(sfx_knightslide)	
		}
		else if audio_is_playing(knightslide) audio_stop_sound(knightslide)
		
		if sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode { 
			if !audio_is_playing(bombpep1snd) bombpep1snd = scr_soundeffect_loop(sfx_bombpep1)	
		}
		else if audio_is_playing(bombpep1snd) audio_stop_sound(bombpep1snd)
		
		if state == states.Sjumpprep { 
			if !audio_is_playing(superjumpholdsnd) superjumpholdsnd = scr_soundeffect_loop(sfx_superjumphold)	
		}
		else if audio_is_playing(superjumpholdsnd) audio_stop_sound(superjumpholdsnd)
		
		if sprite_index == spr_tumblestart && floor(image_index) < 1 { 
			if !audio_is_playing(tumble1snd) tumble1snd = scr_soundeffect_loop(sfx_tumble1)	
		}
		else if audio_is_playing(tumble1snd) audio_stop_sound(tumble1snd)
		
		if sprite_index == spr_tumblestart && floor(image_index) < 11 { 
			if !audio_is_playing(tumble1snd) tumble1snd = scr_soundeffect_loop(sfx_tumble1)	
		}
		else if audio_is_playing(tumble1snd) audio_stop_sound(tumble1snd)
		
		if sprite_index == spr_tumblestart && floor(image_index) = 11 && !audio_is_playing(tumble2snd) { 
			tumble2snd = audio_play_sound(sfx_tumble2, 1, false)
			sfx_gain(tumble2snd)
			if audio_is_playing(tumble1snd) audio_stop_sound(tumble1snd)
		}
		
		if (sprite_index == spr_tumble or sprite_index == spr_machroll) { 
			if !audio_is_playing(tumble3snd) tumble3snd = scr_soundeffect_loop(sfx_tumble3)	
		}
		
		if sprite_index == spr_cheeseballplayer && grounded {
			if !audio_is_playing(cheeseballsnd) cheeseballsnd = scr_soundeffect_loop(sfx_cheeseballroll)	
		} else if audio_is_playing(cheeseballsnd) audio_stop_sound(cheeseballsnd)
		
		if sprite_index == spr_player_trashslide && grounded {
			if !audio_is_playing(trashrollsnd) trashrollsnd = scr_soundeffect_loop(sfx_trashslide)	
		} else if audio_is_playing(trashrollsnd) audio_stop_sound(trashrollsnd)
		
		if sprite_index == spr_currentplayer && place_meeting(x, y + 1, obj_current) {
			if !audio_is_playing(currentsnd) currentsnd = scr_soundeffect_loop(sfx_current)	
		} else if audio_is_playing(currentsnd) audio_stop_sound(currentsnd)
		
		if (sprite_index == spr_mach2jump && character == characters.pizzelle) || (state == states.chainsawpogo && (sprite_index == spr_player_chainsawspin || sprite_index == spr_player_chainsawspin_flash)) {
			if !audio_is_playing(flipsnd) flipsnd = scr_soundeffect_loop(sfx_spin)	
		} else if audio_is_playing(flipsnd) audio_stop_sound(flipsnd)
		
		if (state == states.ghost && (hsp != 0 || vsp != 0)) {
			if !audio_is_playing(ghostsnd) ghostsnd = scr_soundeffect_loop(sfx_ghostwoosh)	
		} else if audio_is_playing(ghostsnd) audio_stop_sound(ghostsnd)
		
		if (state == states.barrelslide) {
			if !audio_is_playing(barrelsnd) barrelsnd = scr_soundeffect_loop(sfx_tumble3)	
		} else if audio_is_playing(barrelsnd) audio_stop_sound(barrelsnd)



		if (state != states.tumble && sprite_index != spr_machroll)
		{
			audio_stop_sound(tumble1snd)
			audio_stop_sound(tumble2snd)
			audio_stop_sound(tumble3snd)
		}
		if (audio_is_playing(suplexdashsnd) && state != states.handstandjump && sprite_index != spr_uppercut && sprite_index != spr_uppercutend)
			audio_stop_sound(suplexdashsnd)
	}
	exit;
}

