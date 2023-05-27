if chance(90) { instance_destroy() exit; }
msg = "My brother went missing in one of the secret hub rooms... the last I heard of him he was in some... art gallery?"
if get_keypieces() >= 25 msg = "Aha... ahahah... I keep seeing things crawl in the corner of my eye and it's driving me crazy!"
dialogbox = spr_dialogbox_crust
idlespr = spr_crustavo
activespr = spr_crustavo_point
image_speed = 0.35