if state = states.normal {
	x = lerp(x, tgtx, 0.05)	
	y = lerp(y, tgty, 0.05)	
} else {
	x += tgtx
	y += tgty
	
}