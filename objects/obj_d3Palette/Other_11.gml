



/// @description Export Palettes
Export.active = true;

var file;
var a = get_chardetail("name",,char)
file = get_save_filename_ext("Palettes|*.sipalette", a, working_directory, "Export your Palette");
if file != ""
{
	event_perform(ev_destroy, 0)
	ini_open("palettes.ini")
	var b = ini_read_string(a, string(slot_sel), "")
	ini_close()
	if b != ""
	{
		ini_open(file)
		ini_write_string(a, "5", b)
		ini_close()
		
	}
	
	
	//file_copy(_original,file)
}	