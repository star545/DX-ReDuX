if chance(90) { instance_destroy() exit; }

msg = "That janitor knows more than he's letting on..."
if get_keypieces() >= 25 msg = "I swear I've seen that janitor guy doing shady stuff around here..."

dialogbox = spr_dialogbox_crust
idlespr = spr_crustavo
activespr = spr_crustavo_point
image_speed = 0.35