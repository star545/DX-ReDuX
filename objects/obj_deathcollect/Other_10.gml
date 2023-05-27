
global.heattime = 60
global.combotime = 60
scr_soundeffect(sfx_secretfound)
instance_destroy()
with obj_deathmode { 
	time += 600
	time_fx = 10
	time_fx_y = 0
}
create_collect(x, y, sprite_index)
