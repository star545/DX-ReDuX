instance_activate_all()
obj_player.x = obj_player.roomstartx
obj_player.y = obj_player.roomstarty
obj_player1.state = states.actor
obj_player1.image_index = 0
obj_player1.sprite_index = spr_player_gnomecutscene1
instance_destroy()
scr_soundeffect(mu_pizzaboyboss)
