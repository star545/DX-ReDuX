//If Condition is correct then output
if condition != noone && condition()
{
    if (activated == false) || (flags.do_once == false)
    {
		output();
		if flags.do_save == true && (ds_list_find_index(flags.saveroom, id) == -1)
			ds_list_add(flags.saveroom, id)		
		
		activated = true;
    }
}
else if reverse_output != noone && condition != noone && !condition() //Reverse of the Condition
{
    if (activated == true) || (flags.do_once == false)
    {
		reverse_output();
		activated = false;
    }
}
//Activated
if activated == true && flags.do_once == true
	instance_destroy();