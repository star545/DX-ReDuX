if (other.state != states.rocket && other.state != states.rocketslide && other.state != states.chainsaw && other.skateboarding == 0)
{
	instance_create(x, y, obj_genericpoofeffect)
	other.mask_index = spr_player_mask
	while place_meeting_collision(other.x, other.y) other.y++
	other.movespeed = 10
	other.state = states.mach2
	other.skateboarding = 1
	tv_push_prompt_once(tv_create_prompt("This is the clown transformation text", tvprompt.transfo, spr_tv_clown, 3), "skateboard")
}
