var _destroyed = 0
if (ds_list_find_index(global.baddieroom, id) != -1)
{
	_destroyed = 1
	instance_destroy()
}
if _destroyed exit;

if !room_started
{
	if escape state = states.portal
	if !elite && global.laps >= 2 {
		elite = 1
		elitehit = 0	
	}
	if elite {
		hp += 1
		elitehp = hp
		var _hp = (global.laps - 2)
		if global.laps >= 4 elitehit += _hp
	}
	baddie_heat_pal(false)
	if global.mort_powerups.flame
		mortHP += 3
	mortHP = ceil(mortHP)	
	
	if global.option_doubleenem && !clone {
		clone = true
		with instance_create(x, y, object_index) {
			state = other.state
			clone = true
			elite = other.elite
			elitehit = other.elitehit
			hp = other.hp
			mortHP = other.mortHP
			paletteselect = other.paletteselect
			
		}
		
	}
	
}

room_started = 1