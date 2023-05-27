var cur_stt = other.state
if (state = states.walk || state == states.rage) && other.state != states.backbreaker
	scr_hurtplayer(other)
if (other.state == states.hurt || other.state == states.ratmounthurt) && cur_stt != states.hurt && cur_stt != states.ratmounthurt ragedash = 0