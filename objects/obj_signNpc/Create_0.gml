text_scroll = 0.75
state = states.arenaintro
text_pos = 0
message_pos = 0
message_delay = 200
bubble_spr = spr_npcbubble
bubble_index = 0
active = false
text_array = [
["Message 1 Message 1 Message 1 Message 1 Message 1 Message 1", sfx_punch],
["Message 2 Message 1 Message 1 Message 1 Message 1 Message 1", sfx_punch],
["Message 3 Message 1 Message 1 Message 1 Message 1 Message 1", sfx_punch],
["Message 4 Message 1 Message 1 Message 1 Message 1 Message 1", sfx_punch],
]
set_color = c_white
color_array = [
c_white,
c_black,
c_red,
c_green,
c_blue,
c_red,
]


typer = scribble_typist()
typer.in(0.3, 0)

typer.character_delay_add(",", 450)
typer.character_delay_add(".", 450)
