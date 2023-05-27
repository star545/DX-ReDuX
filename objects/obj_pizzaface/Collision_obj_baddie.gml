if !global.cheat_pizzagooch exit;
if !other.invincible && other.invtime <= 0 && other.state != states.grabbed && other.instantkillable && other.killbyenemy && id != other.id && (id.thrown || id.fake_thrown) && id.state = states.stun
	instance_destroy(other.id)