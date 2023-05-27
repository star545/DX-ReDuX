enum dialogstate {
	intro,
	outro,
	normal,
	choices
	
	
}
ax = 0
ay= 0
instant_destroy = false;
current_message = 0
state = dialogstate.intro
choice_selected = 0
pause_time = 0
whos_talkin = 0
drawchar = 0
real_drawchar = 0
drawspd = 0.5
snddelay = 3
sndcnt = 0
animation = 1
yoffset = 200
surface = -4
force_next = false;
depth = -999
image_alpha = 0
image_speed = 0.35
show_debug_message("Dialog box created!")

typer = scribble_typist()
typer.in(0.3, 0)

typer.character_delay_add(",", 450)
typer.character_delay_add(".", 450)



