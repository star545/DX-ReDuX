//alarm[0] = 300
image_speed = 0.1
with obj_drawcontroller event_perform(ev_other, ev_room_start)
obj_player1.x = obj_doorA.x + 16
obj_player1.y = obj_doorA.y - 14
obj_player1.xscale = 1
obj_player1.roomstartx = obj_player1.x
obj_player1.roomstarty = obj_player1.y
pepx = -415
noisex = room_width
noisespr = spr_vspizzaboy
noisevs = spr_pizzaboytitle
vsy = -400
shake = 0
shake2 = 0
instance_deactivate_all(true)
audio_stop_all()
flash = 0
flashed = 0
flamey = 0
flash_delay = 30
