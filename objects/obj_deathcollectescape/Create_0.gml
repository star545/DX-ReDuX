image_speed = 0.35
global.collected = 0
global.collectsound = 0
depth = 11
image_alpha = global.panic ? 1 : 0.2
arena = 0
if !global.death_mode instance_destroy(id, false)
//if !global.panic instance_destroy(id, false)