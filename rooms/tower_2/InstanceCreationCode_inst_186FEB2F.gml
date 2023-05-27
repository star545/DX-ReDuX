if chance(90) { instance_destroy() exit; }
msg = "I was on the 5th floor and I thought I saw something hiding near a door. Havent been up there since..."
if get_keypieces() >= 25 msg = "That thing on the 5th floor... I swear I keep seeing it... like it's following me..."
dialogbox = spr_dialogbox_crust
idlespr = spr_crustavo
activespr = spr_crustavo_point
image_speed = 0.35