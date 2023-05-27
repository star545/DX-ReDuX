/// @description Import
Import.active = true;
var file;
var name = get_chardetail("name",,char)
file = get_open_filename_ext("Palettes|*.sipalette", "", working_directory, "Import your Palette");
if file != ""
{
	ini_open(file);
	var character = ini_read_string(name, "5", "");
	trace(character)
	ini_close();
	if character != ""// && character == string(player.characters)
	{
		
		ini_open("palettes.ini")
		ini_write_string(name, string(slot_sel), character)
		global.color_array[char, slot_sel] = load_custom_colors(char, slot_sel)



	}
	else
	{
		//Put error here
		//Temporary One lmao
		show_message("Error: Expected " + string(player.characters) + " Got "+ character + ". Aborting Import." );
		show_debug_message("TODO: Add an in-game error thingy")
	}
		
		
}	