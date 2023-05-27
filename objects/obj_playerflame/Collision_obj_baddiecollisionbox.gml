if !instance_exists(other.baddieID)
	exit;
var bID = other.baddieID
if !bID.on_fire {
	bID.on_fire = true
	bID.flash = true
}