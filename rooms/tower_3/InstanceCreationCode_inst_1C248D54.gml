if chance(90) { instance_destroy() exit; }
msg = "Something crawled into the ground on the floor below us. You know anything about that?"
if get_keypieces() >= 25 msg = "I keep hearing voices whispering to me. Do you think I should see a doctor?"

dialogbox = spr_dialogbox_crust
idlespr = spr_crustavo
activespr = spr_crustavo_point
image_speed = 0.35