vsp = random_range(-10, -18)
use_player_palette = false
hsp = (sign((x - obj_player.x)) * random_range(10, 18))
grav = 0.4
angle = 0
canrotate = 0
randomize()
spinspeed = choose(0, 0, 5, 10, 20)
spindir = irandom_range(-1, 1)
alarm[0] = 5
cigar = 0
stomped = 0
buffer = 10
if (x != obj_player.x)
    image_xscale = (-(sign((x - obj_player.x))))
var p = obj_player
if place_meeting(x, y, p)
{
    if (p.vsp < -5 || p.vsp > 5)
        vsp = (p.vsp / 1.3)
    hsp += (p.hsp / 1.7)
}
depth = -999
paletteselect = 0
spr_palette = 0
d = 255
