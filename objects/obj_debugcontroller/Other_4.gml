with (obj_solid)
{
    if (object_index == obj_solid || object_index == obj_secretbigblock || object_index == obj_secretblock || object_index == obj_secretmetalblock)
        visible = other.showcollisions
}
with (obj_slope)
{
    if (object_index == obj_slope)
        visible = other.showcollisions
}
with (obj_platform)
{
    if (object_index == obj_platform)
        visible = other.showcollisions
}
with (obj_sidePlatform)
{
    if (object_index == obj_sidePlatform)
        visible = other.showcollisions
}
with (obj_slopePlatform)
{
	if (object_index == obj_slopePlatform)
        visible = other.showcollisions
}
with obj_grindrail {
	if (object_index == obj_grindrail)
        visible = other.showcollisions
}
with obj_grindrailslope {
	if (object_index == obj_grindrailslope)
        visible = other.showcollisions
}
with obj_monsterslope {
	if (object_index == obj_monsterslope)
        visible = other.showcollisions
}
with obj_monstersolid {
	if (object_index == obj_monstersolid)
        visible = other.showcollisions
}
/*
    layer_set_visible("Tiles_BG", showtiles)
    layer_set_visible("Tiles_BG2", showtiles)
    layer_set_visible("Tiles_BG3", showtiles)
    layer_set_visible("Tiles_1", showtiles)
    layer_set_visible("Tiles_2", showtiles)
    layer_set_visible("Tiles_3", showtiles)
    layer_set_visible("Tiles_4", showtiles)
    layer_set_visible("Tiles_Foreground1", showtiles)
    layer_set_visible("Tiles_Foreground2", showtiles)
    layer_set_visible("Tiles_Foreground3", showtiles)