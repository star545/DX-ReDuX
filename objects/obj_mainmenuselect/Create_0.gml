scr_input_init()
spr_title = choose(spr_CLASSIC, spr_FAULT, spr_OG)
optionselected = 0
selected = 0
msg = ["START GAME", "OPTIONS", "ERASE SAVE"]
anim_to_left = [spr_title_start_to_erase, spr_title_options_to_start, spr_title_erase_to_options]
anim_to_right = [spr_title_start_to_options, spr_title_options_to_erase, spr_title_erase_to_start]
titlex = 0
depth = -95
image_speed = 0.35