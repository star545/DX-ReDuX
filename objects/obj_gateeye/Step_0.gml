if !instance_exists(targetGate)
	instance_destroy()
	
x = Wave(startX, toX, xSpd, 0)
y = Wave(startY, toY, ySpd, 0)

if x <= startX + 10
	depth = targetGate.depth + 1
else if x >= toX - 10
	depth = targetGate.depth - 1