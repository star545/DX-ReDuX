if !ds_exists(tex_list, ds_type_list) exit;
if (!ds_list_empty(tex_list))
{
	var b = ds_list_find_value(tex_list, 0)
	for (var i = 0; i < array_length(b); i++)
	{
		if texture_is_ready(b[i])
			texture_flush(b[i])
	}
	ds_list_delete(tex_list, 0)
}
else
{
	ds_list_destroy(tex_list)
	instance_destroy()
}
alarm[0] = 1
