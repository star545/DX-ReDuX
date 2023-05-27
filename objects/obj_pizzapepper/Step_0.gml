if strongcoldpr == 1 && global.strongcoldprogress strongcoldcanappear = true
else if strongcoldpr == 1 strongcoldcanappear = false
if strongcoldpr == 0 strongcoldcanappear = true
if (global.collectsound < 10)
	global.collectsound += 1
if (timetovisible > 0)
	timetovisible--
if (timetovisible == 0 && strongcoldcanappear)
	visible = true
else if strongcoldcanappear == false visible = false