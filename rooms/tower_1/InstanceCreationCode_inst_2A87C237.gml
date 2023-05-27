if chance(90) { instance_destroy() exit; }
msg = "I've been seeing more and more cracks around in this tower. This place has seen better days..."
if get_keypieces() >= 25 msg = "I keep seeing more and more things crawling around here... it's freaking me out a little bit..."
idlespr = spr_crustavo
activespr = spr_crustavo_point
dialogbox = spr_dialogbox_crust
image_speed = 0.35