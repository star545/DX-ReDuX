with (instance_create(x, (y - 15), obj_spitcheesespike))
{
	hsp = -5
	vsp = -6
	parried = other.parried
}
with (instance_create(x, (y - 15), obj_spitcheesespike))
{
	hsp = 5
	vsp = -6
	parried = other.parried
}
instance_destroy()
