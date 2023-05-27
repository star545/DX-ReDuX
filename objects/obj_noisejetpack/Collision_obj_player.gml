global.noisejetpack = 1
repeat(30) create_fire_effect(x, y, spr_firemouth_projectile)	
scr_soundeffect(sfx_secretfound)
trace(global.noisejetpack)
instance_destroy()