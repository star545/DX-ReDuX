optionselected = 0

optionsaved_fullscreen = (!global.option_fullscreen)
optionsaved_resolution = global.option_resolution
optionsaved_vibration = (!global.option_vibration)
stickpressed = 0
depth = -99
buffer = 0

array_selected = 0
options = [ 
create_option("FULLSCREEN", global.option_fullscreen, [
create_suboption("TRUE", function() { trace("TRUE FUNC")}),
create_suboption("FALSE", function() { trace("FALSE FUNC")})
]),
create_option("RESOLUTION", 0, function() { trace("RES FUNC") })


]