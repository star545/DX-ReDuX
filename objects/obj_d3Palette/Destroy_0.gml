var i = 0
repeat 3 { save_custom_colors(characters.peppino, i) i++ }
i = 0
repeat 3 { save_custom_colors(characters.noise, i) i++ }
i = 0
repeat 3 { save_custom_colors(characters.pizzelle, i) i++ }
i = 0
repeat 3 { save_custom_colors(characters.gus, i) i++ }
i = 0
repeat 3 { save_custom_colors(characters.snick, i) i++ }
i = 0
repeat 3 { save_custom_colors(characters.jetpack_noise, i) i++ }
i = 0


instance_activate_object(obj_player)
obj_player1.custom_update = true
//obj_player1.custom_slot = slot_sel
instance_deactivate_object(obj_player)
