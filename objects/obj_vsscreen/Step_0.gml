if pepx != 0 {
	pepx = lerp(pepx, 0, 0.1)
	pepx = Approach(pepx, 0, 1)
} else if noisex != (960 - sprite_get_width(noisespr)) {
	noisex = lerp(noisex, (960 - sprite_get_width(noisespr)), 0.1)
	noisex = Approach(noisex, (960 - sprite_get_width(noisespr)), 1)
} else if flash_delay > 0 flash_delay--
else if flash < 2 && !flashed {
	flash = Approach(flash, 2, 0.05)
	if flash == 2 {
		flashed = true
		flash = 0
		alarm[0] = 240
		scr_soundeffect(sfx_becomeknight)
		shake = 10
		shake2 = 10
		
	}
	
}
flamey -= 4

shake = Approach(shake, 0, 0.3)
shake2 = Approach(shake2, 0, 0.3)
