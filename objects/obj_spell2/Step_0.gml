/// @description Insert description here
// You can write your code in this editor

//rotate around player
dir = point_direction(x,y,mouse_x,mouse_y);
x = player.x + lengthdir_x(80,dir)
y = player.y + lengthdir_y(80,dir)


//image stuff
image_angle = dir
if (image_index > 6) {
	
	flicker = true;
	image_speed = 0
}
if flicker {
	image_yscale = random_range(0.9,1.1)
}


//push back player
if(flicker){
	player.x -= lengthdir_x(knockback,dir)
	player.y -= lengthdir_y(knockback,dir)
	__angle=random_range(-0.5,0.5)
    camera_set_view_angle(view_camera[0],__angle);
	
	//collision with enemies
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, obj_enemy, _list, false);
	if _num > 0
	{
	    for (var i = 0; i < _num; ++i;)
	    {
	        _list[| i].hp -= player.spells[3].damage
			_list[| i].x += lengthdir_x(knockback,image_angle)
			_list[| i].y += lengthdir_y(knockback,image_angle)
	    }
	}
	ds_list_destroy(_list);
	
}else{
    camera_set_view_angle(view_camera[0],0)
}




if !mouse_check_button(mb_left){self_destruct = true;}
if player.mana > player.spells[3].cost {
	player.mana -= player.spells[3].cost
} else { self_destruct = true; }
//destroy self
if self_destruct {
	player.allow_cast = true;
	player.spells[3].cooldown = player.spells[3].reload
	player.allow_cast = true
	instance_destroy()
}
