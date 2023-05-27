global.ghostkiller = true
create_particle(obj_player.x, obj_player.y, particle.genericpoofeffect, 0)
depthlayer = 0
scr_controlprompt("[spr_promptfont]Kill the ghosts!!", -4)
alarm[0] = 240
alarm[1] = alarm[0] - 60
alpha = 1
image_speed = 0.35
colmount = 0