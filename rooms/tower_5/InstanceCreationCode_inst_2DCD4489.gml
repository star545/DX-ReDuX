if chance(90) { instance_destroy() exit; }
msg = "Boy, this floor is kind of spooky! I'm quaking in my tiny crust boots!"
if get_keypieces() >= 25 msg = "...I wouldn't trust that tubby golden fellow if I were you..."
idlespr = spr_crustavo
activespr = spr_crustavo_point
dialogbox = spr_dialogbox_crust
image_speed = 0.35