if !fadein && fadealpha == 0
	instance_destroy()
fadealpha = Approach(fadealpha, fadein, rate)